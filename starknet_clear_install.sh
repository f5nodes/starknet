#!/bin/bash

read -p "Enter the desired size threshold for the database (in GB): " threshold_size

starknet_clear="https://raw.githubusercontent.com/f5nodes/starknet/main/starknet_clear.sh"

wget -q $starknet_clear -O $HOME/starknet_clear.sh
sudo chmod +x $HOME/starknet_clear.sh
nohup $HOME/starknet_clear.sh "$threshold_size" > starknet_clear.out 2>/dev/null &

echo -e "\nStarknet clear DB script was installed & running!"
echo -e "Check the output of the running script (once an hour): \e[92mcat starknet_clear.out\e[0m"
