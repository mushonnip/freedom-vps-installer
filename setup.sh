#!/bin/bash

# ANCHOR - Compatibility Check
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "Not supported in OpenVZ virtualization"
		exit 1
fi

# ANCHOR - Installing Dependencies
apt update
apt install -y bzip2 gzip coreutils screen curl unzip wget

# ANCHOR - Setup
# disable ipv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

# load config
. application.config

# acme cert installation
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
echo "Installing Cert..."
bash acme.sh --register-account -m $EMAIL
bash acme.sh --issue --standalone -d $DOMAIN --force
bash acme.sh --installcert -d $DOMAIN --fullchainpath /etc/cert/acme.crt --keypath /etc/cert/acme.key

# ANCHOR - All Bin Install
chmod +x bin/**/*
mv bin/ /usr/local/bin/

# SECTION - Websocket TLS
# NOTE - Install Binary
mv bin/websockets/ws-nontls /usr/local/bin/ws-tls
chmod +x /usr/local/bin/ws-tls

# NOTE - Install service
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=WSS Service
Documentation=https://google.com
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls 443
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# !SECTION - Websocket TLS

# SECTION - Websocket Non-TLS
# NOTE - Install Binary
mv bin/websockets/ws-nontls /usr/local/bin/ws-nontls
chmod +x /usr/local/bin/ws-nontls

# NOTE - Install service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=WS Service
Documentation=https://google.com
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 8880
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# !SECTION - Websocket Non-TLS

# ANCHOR - Enable Services
systemctl daemon-reload
systemctl enable ws-tls --now
systemctl enable ws-nontls --now