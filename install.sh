#!/bin/bash

if [ ! $ALCHEMY_KEY ]; then
  read -p "Твоє посилання з Alchemy (Приклад: https://eth-goerli.alchemyapi.io/v2/secret): " ALCHEMY_KEY
fi
echo 'Твій лінк: ' $ALCHEMY_KEY
sleep 1
echo 'export ALCHEMY_KEY='$ALCHEMY_KEY >> $HOME/.bash_profile

sudo apt update
sudo apt install mc wget curl git htop net-tools unzip jq build-essential ncdu tmux -y
bash <(curl -s https://raw.githubusercontent.com/f5nodes/root/main/install/docker.sh) &>/dev/null

git clone https://github.com/eqlabs/pathfinder.git
cd $HOME/pathfinder
git fetch
git checkout `curl https://api.github.com/repos/eqlabs/pathfinder/releases/latest -s | jq .name -r`

source $HOME/.bash_profile
echo "PATHFINDER_ETHEREUM_API_URL=$ALCHEMY_KEY" > pathfinder-var.env

docker-compose pull
mkdir -p $HOME/pathfinder/pathfinder
chown -R 1000.1000 .
sleep 1
docker-compose up -d

if [ -z `docker-compose ps -q starknet-node` ] || [ -z `docker ps -q --no-trunc | grep $(docker-compose ps -q starknet-node)` ]; then
  echo -e "\nВаша StarkNet нода \e[91mбула встановлена неправильно\e[0m, виконайте перевстановлення."
else
  echo -e "\nВаша StarkNet нода \e[92mвстановлена та працює\e[0m!"
  echo -e "\nПеревірити логи Вашої ноди можна командою \e[92mdocker-compose -f $HOME/pathfinder/docker-compose.yml logs -f --tail=100\e[0m"
fi