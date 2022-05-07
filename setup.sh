#!/bin/bash
# ==============================================
# Color
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# ==============================================

cd /root

#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
REQUIRED_PKG="linux-headers-$(uname -r)"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 2
  echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 1. apt update -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 2. apt upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 3. apt dist-upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 4. reboot"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] After rebooting"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] Then run this script again"
  echo -e "[ ${tyblue}NOTES${NC} ] if you understand then tap enter now"
  read
else
  echo -e "[ ${green}INFO${NC} ] Okey, you have all packages"
fi

ReqPKG="linux-headers-$(uname -r)"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  # rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

# clear
# if [ -f "/etc/xray/domain" ]; then
# echo "Script Already Installed"
# exit 0
# fi
# mkdir /var/lib/freedom;
# echo "IP=" >> /var/lib/freedom/ipvps.conf
clear
chmod +x scripts/*
./scripts/cloudflare.sh > /dev/null 2>&1
sleep 1
clear
screen -S ssh-vpn ./ssh-vpn.sh > /dev/null 2>&1
sleep 1
clear
screen -S xray ./xray.sh > /dev/null 2>&1
sleep 1
clear
screen -S sstp ./sstp.sh > /dev/null 2>&1
sleep 1
clear
screen -S ssr ./ssr.sh > /dev/null 2>&1
sleep 1
clear
screen -S ss ./shadowsocks.sh > /dev/null 2>&1
sleep 1
clear
screen -S wireguard ./wireguard.sh > /dev/null 2>&1
sleep 1
clear
screen -S ipsec ./ipsec.sh > /dev/null 2>&1
sleep 1
clear
./set-br.sh > /dev/null 2>&1
sleep 1
clear
./scripts/websocket.sh > /dev/null 2>&1
sleep 1
clear
./ohp.sh > /dev/null 2>&1
sleep 1
clear

chmod 644 .profile

echo '============================================='
echo '               REBOOTING SERVER'
echo '============================================='
echo ""
sleep 2
reboot