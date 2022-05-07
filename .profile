if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
running
echo -e "\x1b[96m            Type\x1b[m \x1b[92mmenu\x1b[m \x1b[96mto Continue\x1b[m"
echo -e ""