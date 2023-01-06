#!/bin/bash

starknet_clear="https://raw.githubusercontent.com/f5nodes/starknet/main/starknet_clear.sh"

wget -q $starknet_clear -O $HOME/starknet_clear.sh
sudo chmod +x $HOME/starknet_clear.sh
nohup $HOME/starknet_clear.sh > starknet_clear.out 2> /dev/null &

echo -e "\nStarknet clear DB script was installed & running\e[0m!"
echo -e "\nCheck the output of running script (once a hour) \e[92mcat starknet_clear.out\e[0m"