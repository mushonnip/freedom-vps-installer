#!/bin/bash
# ==========================================
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
tyblue='\e[1;36m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# ==========================================
clear
# ==================================================
# Link Hosting Kalian
# geovpn="vpnkuy.site/ssh"

# Link Hosting Kalian Untuk Xray
geovpnn="vpnkuy.site/xray"

# Link Hosting Kalian Untuk Trojan Go
geovpnnn="vpnkuy.site/trojango"

# Link Hosting Kalian Untuk Stunnel5
geovpnnnn="vpnkuy.site/stunnel5"

# Link Hosting Kalian Untuk menu
geovpnnnnn="vpnkuy.site/menu"

# Link Hosting Kalian Untuk banner
geovpnnnnnn="vpnkuy.site/banner"

# Link Hosting Kalian Untuk dom
geovpnnnnnnn="vpnkuy.site/dom"

# Link Hosting Kalian Untuk trial
geovpnnnnnnnn="vpnkuy.site/trial"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=freedom-project
organizationalunit=freedom-project
commonname=freedom-project
email=freedom-project@mail.com

cp etc/common-password /etc/common-password >/dev/null 2>&1
chmod +x /etc/pam.d/common-password >/dev/null 2>&1

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
# cat > /etc/systemd/system/rc-local.service <<-END
# [Unit]
# Description=/etc/rc.local
# ConditionPathExists=/etc/rc.local
# [Service]
# Type=forking
# ExecStart=/etc/rc.local start
# TimeoutSec=0
# StandardOutput=tty
# RemainAfterExit=yes
# SysVStartPriority=99
# [Install]
# WantedBy=multi-user.target
# END

# # nano /etc/rc.local
# cat > /etc/rc.local <<-END
# #!/bin/sh -e
# # rc.local
# # By default this script does nothing.
# exit 0
# END

# sleep 1
# Ubah izin akses
echo -e "[ ${tyblue}NOTES${NC} ] Ubah izin akses"
chmod +x /etc/rc.local
sleep 1
# enable rc local
echo -e "[ ${tyblue}NOTES${NC} ] enable rc local"
systemctl enable --now rc-local

# disable ipv6
echo -e "[ ${tyblue}NOTES${NC} ] disable ipv6 "
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
# sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

sleep 1
#update
clear
echo ""
echo -e "[ ${tyblue}NOTES${NC} ] INSTALL ALL PAKET "
sleep 1
echo -e "[ ${green}INFO${NC} ] update"
apt update -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] upgrade"
apt upgrade -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install toilet"
apt install toilet -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install dist-upgrade"
apt dist-upgrade -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] remove --purge ufw firewalld"
apt-get remove --purge ufw firewalld -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] remove --purge exim4"
apt-get remove --purge exim4 -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install  curl"
apt -y install wget curl >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install ruby"
apt install ruby -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install python"
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install make"
apt install make -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install cmake"
apt install cmake -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install coreutils"
apt install coreutils -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install rsyslog"
apt install rsyslog -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install net-tools"
apt install net-tools -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install zip"
apt install zip -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install unzip"
apt install unzip -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install nano"
apt install nano -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install sed"
apt install sed -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install gnupg"
apt install gnupg -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install gnupg1"
apt install gnupg1 -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install bc"
apt install bc -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install jq"
apt install jq -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install apt-transport-https"
apt install apt-transport-https -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install build-essential"
apt install build-essential -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install dirmngr"
apt install dirmngr -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install libxml-parser-perl"
apt install libxml-parser-perl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install neofetch"
apt install neofetch -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install git"
apt install git -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install lsof"
apt install lsof -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install libsqlite3-dev"
apt install libsqlite3-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install libz-dev"
apt install libz-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install gcc"
apt install gcc -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install g++"
apt install g++ -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install libreadline-dev"
apt install libreadline-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install zlib1g-dev"
apt install zlib1g-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install libssl-dev"
apt install libssl-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install libssl1.0-dev"
apt install libssl1.0-dev -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] install dos2unix"
apt install dos2unix -y >/dev/null 2>&1

# set time GMT +7
echo -e "[ ${tyblue}NOTES${NC} ] set time GMT +7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
echo -e "[ ${tyblue}NOTES${NC} ] set locale"
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
echo -e "[ ${green}INFO${NC} ] reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof"
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof >/dev/null 2>&1
echo "clear" >> .profile
echo "figlet -f slant FREEDOM PROJECT | lolcat" >> .profile
echo "sleep 0.5" >> .profile
echo "clear" >> .profile
echo "running " >> .profile
echo "echo -e \" - Freedom Project\" | lolcat" >> .profile
echo "echo -e \"\x1b[96m - Please type\x1b[m \x1b[92mMENU\x1b[m \x1b[96mto see the commands\x1b[m\"" >> .profile

# install webserver
echo -e "[ ${green}INFO${NC} ] install webserver"
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl >/dev/null 2>&1
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://vpnkuy.site/ssh/nginx.conf > /etc/nginx/nginx.conf
curl https://vpnkuy.site/ssh/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/nginx status
cd

# install badvpn
echo -e "[ ${green}INFO${NC} ] installing badvpn-udpgw64"
cd
wget -O /usr/bin/badvpn-udpgw "https://vpnkuy.site/ssh/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
echo -e "[ ${tyblue}NOTES${NC} ] setting port ssh"
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
echo -e "[ ${green}INFO${NC} ] install dropbear"
apt -y install dropbear >/dev/null 2>&1
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
/etc/init.d/dropbear status

# install squid
echo -e "[ ${green}INFO${NC} ] install squid"
cd
apt -y install squid3 >/dev/null 2>&1
wget -O /etc/squid/squid.conf "https://vpnkuy.site/ssh/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# Install SSLH
echo -e "[ ${green}INFO${NC} ] install sslh"
apt -y install sslh
rm -f /etc/default/sslh

# Settings SSLH
echo -e "[ ${tyblue}NOTES${NC} ] Settings SSLH"
cat > /etc/default/sslh <<-END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:80 --pidfile /var/run/sslh/sslh.pid -n"

END

# Restart Service SSLH
echo -e "[ ${tyblue}NOTES${NC} ] Restart Service SSLH"
###############$$$$
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh status
/etc/init.d/sslh restart

# setting vnstat
echo -e "[ ${green}INFO${NC} ] install vnstat"
apt -y install vnstat >/dev/null 2>&1
/etc/init.d/vnstat restart
/etc/init.d/vnstat status
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
/etc/init.d/vnstat status
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

mkdir -p /usr/local/geovpn
mkdir -p /etc/geovpn

# install stunnel 5 
echo -e "[ ${green}INFO${NC} ] install stunnel 5 "
cd /root/
wget -q -O stunnel-5.62.zip "https://${geovpnnnn}/stunnel-5.62.zip"
unzip -o stunnel-5.62.zip
cd /root/stunnel
chmod +x configure
./configure
make
make install
cd /root
rm -r -f stunnel
rm -f stunnel-5.62.zip
mkdir -p /etc/stunnel5
chmod 644 /etc/stunnel5

# Download Config Stunnel5
echo -e "[ ${tyblue}NOTES${NC} ] Download Config Stunnel5"
cat > /etc/stunnel5/stunnel5.conf <<-END
cert = /etc/stunnel5/stunnel5.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:443

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# make a certificate
echo -e "[ ${tyblue}NOTES${NC} ] make a certificate "
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel5/stunnel5.pem

# Service Stunnel5 systemctl restart stunnel5
echo -e "[ ${tyblue}NOTES${NC} ] Service Stunnel5 systemctl restart stunnel5 "
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://stunnel.org
Documentation=https://github.com/geovpn
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/geovpn/stunnel5 /etc/stunnel5/stunnel5.conf
Type=forking

[Install]
WantedBy=multi-user.target
END

# Service Stunnel5 /etc/init.d/stunnel5
echo -e "[ ${tyblue}NOTES${NC} ] Service Stunnel5 /etc/init.d/stunnel5 "
wget -q -O /etc/init.d/stunnel5 "https://${geovpnnnn}/stunnel5.init"

# Ubah Izin Akses
echo -e "[ ${tyblue}NOTES${NC} ] Ubah Izin Akses "
chmod 600 /etc/stunnel5/stunnel5.pem
chmod +x /etc/init.d/stunnel5
cp /usr/local/bin/stunnel /usr/local/geovpn/stunnel5

# Remove File
echo -e "[ ${tyblue}NOTES${NC} ] Remove File "
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
rm -f /usr/local/bin/stunnel5

# Restart Stunnel 5
echo -e "[ ${tyblue}NOTES${NC} ] Restart Stunnel 5 "
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart

#OpenVPN
echo -e "[ ${green}INFO${NC} ] Install OpenVPN"
wget https://vpnkuy.site/ssh/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
echo -e "[ ${green}INFO${NC} ] install fail2ban"
apt -y install fail2ban >/dev/null 2>&1

# Install BBR
echo -e "[ ${green}INFO${NC} ] Install BBR "
wget https://vpnkuy.site/ssh/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# banner /etc/issue.net
echo -e "[ ${green}INFO${NC} ] Install Banner"
wget -O /etc/issue.net "https://vpnkuy.site/ssh/issue.net"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
echo -e "[ ${tyblue}NOTES${NC} ] Blokir torrent "
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
echo -e "[ ${green}INFO${NC} ] Download File Script "
cd /usr/bin
wget -O portwsnon "https://vpnkuy.site/ssh/portwsnon.sh" >/dev/null 2>&1
wget -O portwstls "https://vpnkuy.site/ssh/portwstls.sh" >/dev/null 2>&1
wget -O onoffservice "https://vpnkuy.site/ssh/onoffservice.sh" >/dev/null 2>&1
wget -O addhost "https://vpnkuy.site/ssh/addhost.sh" >/dev/null 2>&1
wget -O autoreboot "https://vpnkuy.site/ssh/autoreboot.sh" >/dev/null 2>&1
wget -O about "https://vpnkuy.site/ssh/about.sh" >/dev/null 2>&1
wget -O menu "https://vpnkuy.site/ssh/menu.sh" >/dev/null 2>&1
wget -O addssh "https://vpnkuy.site/ssh/addssh.sh" >/dev/null 2>&1
wget -O trialssh "https://vpnkuy.site/ssh/trialssh.sh" >/dev/null 2>&1
wget -O delssh "https://vpnkuy.site/ssh/delssh.sh" >/dev/null 2>&1
wget -O member "https://vpnkuy.site/ssh/member.sh" >/dev/null 2>&1
wget -O delexp "https://vpnkuy.site/ssh/delexp.sh" >/dev/null 2>&1
wget -O cekssh "https://vpnkuy.site/ssh/cekssh.sh" >/dev/null 2>&1
wget -O restart "https://vpnkuy.site/ssh/restart.sh" >/dev/null 2>&1
wget -O speedtest "https://vpnkuy.site/ssh/speedtest_cli.py" >/dev/null 2>&1
wget -O info "https://vpnkuy.site/ssh/info.sh" >/dev/null 2>&1
wget -O ram "https://vpnkuy.site/ssh/ram.sh" >/dev/null 2>&1
wget -O renewssh "https://vpnkuy.site/ssh/renewssh.sh" >/dev/null 2>&1
wget -O autokill "https://vpnkuy.site/ssh/autokill.sh" >/dev/null 2>&1
wget -O ceklim "https://vpnkuy.site/ssh/ceklim.sh" >/dev/null 2>&1
wget -O tendang "https://vpnkuy.site/ssh/tendang.sh" >/dev/null 2>&1
wget -O clearlog "https://vpnkuy.site/ssh/clearlog.sh" >/dev/null 2>&1
wget -O changeport "https://vpnkuy.site/ssh/changeport.sh" >/dev/null 2>&1
wget -O portovpn "https://vpnkuy.site/ssh/portovpn.sh" >/dev/null 2>&1
wget -O portwg "https://vpnkuy.site/ssh/portwg.sh" >/dev/null 2>&1
wget -O porttrojan "https://vpnkuy.site/ssh/porttrojan.sh" >/dev/null 2>&1
wget -O portsstp "https://vpnkuy.site/ssh/portsstp.sh" >/dev/null 2>&1
wget -O portsquid "https://vpnkuy.site/ssh/portsquid.sh" >/dev/null 2>&1
wget -O portv2ray "https://vpnkuy.site/ssh/portv2ray.sh" >/dev/null 2>&1
wget -O portvless "https://vpnkuy.site/ssh/portvless.sh" >/dev/null 2>&1
wget -O wbmn "https://vpnkuy.site/ssh/webmin.sh" >/dev/null 2>&1
wget -O xp "https://vpnkuy.site/ssh/xp.sh" >/dev/null 2>&1
wget -O swapkvm "https://vpnkuy.site/ssh/swapkvm.sh" >/dev/null 2>&1
wget -O addv2ray "https://${geovpnn}/addv2ray.sh" >/dev/null 2>&1
wget -O trialv2ray "https://${geovpnn}/trialv2ray.sh" >/dev/null 2>&1
wget -O addvless "https://${geovpnn}/addvless.sh" >/dev/null 2>&1
wget -O addtrojan "https://${geovpnn}/addtrojan.sh" >/dev/null 2>&1
wget -O delv2ray "https://${geovpnn}/delv2ray.sh" >/dev/null 2>&1
wget -O delvless "https://${geovpnn}/delvless.sh" >/dev/null 2>&1
wget -O deltrojan "https://${geovpnn}/deltrojan.sh" >/dev/null 2>&1
wget -O cekv2ray "https://${geovpnn}/cekv2ray.sh" >/dev/null 2>&1
wget -O cekvless "https://${geovpnn}/cekvless.sh" >/dev/null 2>&1
wget -O cektrojan "https://${geovpnn}/cektrojan.sh" >/dev/null 2>&1
wget -O renewv2ray "https://${geovpnn}/renewv2ray.sh" >/dev/null 2>&1
wget -O renewvless "https://${geovpnn}/renewvless.sh" >/dev/null 2>&1
wget -O renewtrojan "https://${geovpnn}/renewtrojan.sh" >/dev/null 2>&1
wget -O certv2ray "https://${geovpnn}/certv2ray.sh" >/dev/null 2>&1
wget -O addtrgo "https://${geovpnnn}/addtrgo.sh" >/dev/null 2>&1
wget -O deltrgo "https://${geovpnnn}/deltrgo.sh" >/dev/null 2>&1
wget -O renewtrgo "https://${geovpnnn}/renewtrgo.sh" >/dev/null 2>&1
wget -O cektrgo "https://${geovpnnn}/cektrgo.sh" >/dev/null 2>&1
wget -O menu-backup "https://${geovpnnnnn}/menu-backup.sh" >/dev/null 2>&1
wget -O menu-domain "https://${geovpnnnnn}/menu-domain.sh" >/dev/null 2>&1
wget -O menu-l2tp "https://${geovpnnnnn}/menu-l2tp.sh" >/dev/null 2>&1
wget -O menu "https://${geovpnnnnn}/menu.sh" >/dev/null 2>&1
wget -O menu-pptp "https://${geovpnnnnn}/menu-pptp.sh" >/dev/null 2>&1
wget -O menu-shadowsocks "https://${geovpnnnnn}/menu-shadowsocks.sh" >/dev/null 2>&1
wget -O menu-ssh "https://${geovpnnnnn}/menu-ssh.sh" >/dev/null 2>&1
wget -O menu-sstp "https://${geovpnnnnn}/menu-sstp.sh" >/dev/null 2>&1
wget -O menu-tools "https://${geovpnnnnn}/menu-tools.sh" >/dev/null 2>&1
wget -O menu-trial "https://${geovpnnnnn}/menu-trial.sh" >/dev/null 2>&1
wget -O menu-trojan "https://${geovpnnnnn}/menu-trojan.sh" >/dev/null 2>&1
wget -O menu-v2ray "https://${geovpnnnnn}/menu-v2ray.sh" >/dev/null 2>&1
wget -O menu-vpn "https://${geovpnnnnn}/menu-vpn.sh" >/dev/null 2>&1
wget -O setting-menu "https://${geovpnnnnn}/setting-menu.sh" >/dev/null 2>&1
wget -O system-menu "https://${geovpnnnnn}/system-menu.sh" >/dev/null 2>&1
wget -O ipsec-menu "https://${geovpnnnnn}/ipsec-menu.sh" >/dev/null 2>&1
wget -O sstp-menu "https://${geovpnnnnn}/sstp-menu.sh" >/dev/null 2>&1
wget -O cloudflare-pointing "https://vpnkuy.site/ssh/cloudflare-pointing.sh" >/dev/null 2>&1
wget -O cloudflare-setting "https://vpnkuy.site/ssh/cloudflare-setting.sh" >/dev/null 2>&1
wget -O menu-wireguard "https://${geovpnnnnn}/menu-wireguard.sh" >/dev/null 2>&1
wget -O bbr "https://${geovpnnnnn}/bbr.sh" >/dev/null 2>&1
wget -O status "https://${geovpnnnnn}/status.sh" >/dev/null 2>&1
wget -O running "https://${geovpnnnnn}/running.sh" >/dev/null 2>&1
wget -O addcf "https://${geovpnnnnnnn}/addcf.sh" >/dev/null 2>&1
wget -O cfd "https://${geovpnnnnnnn}/cfd.sh" >/dev/null 2>&1
wget -O cff "https://${geovpnnnnnnn}/cff.sh" >/dev/null 2>&1
wget -O cfh "https://${geovpnnnnnnn}/cfh.sh" >/dev/null 2>&1
wget -O domen "https://${geovpnnnnnnn}/host.sh" >/dev/null 2>&1
wget -O pointing "https://${geovpnnnnnnn}/pointing.sh" >/dev/null 2>&1
wget -O bw "https://${geovpnnnnnnn}/bw.sh" >/dev/null 2>&1
wget -O update "https://${geovpnnnnnnn}/update.sh" >/dev/null 2>&1
wget -O domen "https://${geovpnnnnnnn}/host.sh" >/dev/null 2>&1
wget -O trial-akun "https://${geovpnnnnnnnn}/trial-akun.sh" >/dev/null 2>&1
wget -O triall2tp "https://${geovpnnnnnnnn}/triall2tp.sh" >/dev/null 2>&1
wget -O trialpptp "https://${geovpnnnnnnnn}/trialpptp.sh" >/dev/null 2>&1
wget -O trialss "https://${geovpnnnnnnnn}/trialss.sh" >/dev/null 2>&1
wget -O trialssh "https://${geovpnnnnnnnn}/trialssh.sh" >/dev/null 2>&1
wget -O trialssr "https://${geovpnnnnnnnn}/trialssr.sh" >/dev/null 2>&1
wget -O trialsstp "https://${geovpnnnnnnnn}/trialsstp.sh" >/dev/null 2>&1
wget -O trialtrojan "https://${geovpnnnnnnnn}/trialtrojan.sh" >/dev/null 2>&1
wget -O trialv2ray "https://${geovpnnnnnnnn}/trialv2ray.sh" >/dev/null 2>&1
wget -O trialvless "https://${geovpnnnnnnnn}/trialvless.sh" >/dev/null 2>&1
wget -O trialwg "https://${geovpnnnnnnnn}/trialwg.sh" >/dev/null 2>&1
wget -O trialtrgo "https://${geovpnnnnnnnn}/trialtrgo.sh" >/dev/null 2>&1
chmod +x trialpptp >/dev/null 2>&1
chmod +x trialss >/dev/null 2>&1
chmod +x onoffservice
chmod +x trialssh >/dev/null 2>&1
chmod +x trialssr >/dev/null 2>&1
chmod +x trialsstp >/dev/null 2>&1
chmod +x trialtrojan >/dev/null 2>&1
chmod +x triall2tp >/dev/null 2>&1
chmod +x trialv2ray >/dev/null 2>&1
chmod +x trialvless >/dev/null 2>&1
chmod +x trialwg >/dev/null 2>&1
chmod +x trialtrgo >/dev/null 2>&1
chmod +x autoreboot >/dev/null 2>&1
chmod +x addhost >/dev/null 2>&1
chmod +x menu >/dev/null 2>&1
chmod +x addssh >/dev/null 2>&1
chmod +x trialssh >/dev/null 2>&1
chmod +x delssh >/dev/null 2>&1
chmod +x member >/dev/null 2>&1
chmod +x delexp >/dev/null 2>&1
chmod +x cekssh >/dev/null 2>&1
chmod +x restart >/dev/null 2>&1
chmod +x speedtest >/dev/null 2>&1
chmod +x info >/dev/null 2>&1
chmod +x about >/dev/null 2>&1
chmod +x autokill >/dev/null 2>&1
chmod +x tendang >/dev/null 2>&1
chmod +x ceklim >/dev/null 2>&1
chmod +x ram >/dev/null 2>&1
chmod +x renewssh >/dev/null 2>&1
chmod +x clearlog >/dev/null 2>&1
chmod +x changeport >/dev/null 2>&1
chmod +x portovpn >/dev/null 2>&1
chmod +x portwg >/dev/null 2>&1
chmod +x porttrojan >/dev/null 2>&1
chmod +x portsstp >/dev/null 2>&1
chmod +x portsquid >/dev/null 2>&1
chmod +x portv2ray >/dev/null 2>&1
chmod +x portvless >/dev/null 2>&1
chmod +x wbmn >/dev/null 2>&1
chmod +x xp >/dev/null 2>&1
chmod +x swapkvm >/dev/null 2>&1
chmod +x addv2ray >/dev/null 2>&1
chmod +x addvless >/dev/null 2>&1
chmod +x addtrojan >/dev/null 2>&1
chmod +x delv2ray >/dev/null 2>&1
chmod +x delvless >/dev/null 2>&1
chmod +x deltrojan >/dev/null 2>&1
chmod +x cekv2ray >/dev/null 2>&1
chmod +x cekvless >/dev/null 2>&1
chmod +x cektrojan >/dev/null 2>&1
chmod +x renewv2ray >/dev/null 2>&1
chmod +x renewvless >/dev/null 2>&1
chmod +x renewtrojan >/dev/null 2>&1
chmod +x certv2ray >/dev/null 2>&1
chmod +x addtrgo >/dev/null 2>&1
chmod +x deltrgo >/dev/null 2>&1
chmod +x renewtrgo >/dev/null 2>&1
chmod +x cektrgo >/dev/null 2>&1
chmod +x menu-backup >/dev/null 2>&1
chmod +x menu-domain >/dev/null 2>&1
chmod +x menu-l2tp >/dev/null 2>&1
chmod +x menu >/dev/null 2>&1
chmod +x menu-pptp >/dev/null 2>&1
chmod +x menu-shadowsocks
chmod +x menu-ssh >/dev/null 2>&1
chmod +x menu-sstp >/dev/null 2>&1
chmod +x menu-tools >/dev/null 2>&1
chmod +x menu-trial >/dev/null 2>&1
chmod +x menu-trojan >/dev/null 2>&1
chmod +x menu-v2ray >/dev/null 2>&1
chmod +x menu-vpn >/dev/null 2>&1
chmod +x menu-wireguard >/dev/null 2>&1
chmod +x menu-wireguard >/dev/null 2>&1
chmod +x running >/dev/null 2>&1
chmod +x status >/dev/null 2>&1
chmod +x bbr >/dev/null 2>&1
#chmod +x update >/dev/null 2>&1
chmod +x portwsnon >/dev/null 2>&1
chmod +x portwstls >/dev/null 2>&1
#chmod +x cfd >/dev/null 2>&1
#chmod +x cff >/dev/null 2>&1
#chmod +x cfh >/dev/null 2>&1
chmod +x domen
chmod +x setting-menu
chmod +x system-menu
chmod +x cloudflare-pointing
chmod +x cloudflare-setting
chmod +x domen
chmod +x pointing >/dev/null 2>&1
chmod +x bw >/dev/null 2>&1
chmod +x ipsec-menu
chmod +x sstp-menu
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
echo -e "[ ${green}INFO${NC} ] remove unnecessary files "
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx "
/etc/init.d/nginx restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting openvpn "
/etc/init.d/openvpn restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/cron restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/ssh restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/dropbear restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/fail2ban restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting sslh "
/etc/init.d/sslh restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel5 "
/etc/init.d/stunnel5 restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat "
/etc/init.d/vnstat restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/fail2ban restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting squid "
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
