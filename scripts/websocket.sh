#!/bin/bash
echo "SSH Websocket" | lolcat
echo "Websocket TLS / Websocket None TLS" | lolcat
echo "Installing Websocket..." | lolcat
sleep 1

chmod +x bin/websocket-tls
chmod +x bin/websocket-nontls
cp services/websocket-tls.service /etc/systemd/system/
cp services/websocket-nontls.service /etc/systemd/system/
cp services/websocket-ovpn.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable websocket-tls websocket-nontls websocket-ovpn
systemctl restart websocket-tls websocket-nontls websocket-ovpn

echo "Complete..."
sleep 1