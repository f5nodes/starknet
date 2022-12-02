#!/bin/bash

cd $HOME/pathfinder
docker-compose down
docker-compose pull
docker-compose up -d

if [ -z `docker-compose ps -q starknet-node` ] || [ -z `docker ps -q --no-trunc | grep $(docker-compose ps -q starknet-node)` ]; then
  echo -e "\nВаша StarkNet нода \e[31mбула оновлена неправильно\e[0m, виконайте перевстановлення."
else
  echo -e "\nВаша StarkNet нода \e[32mоновлена та працює\e[0m!"
  echo -e "\nПеревірити логи Вашої ноди можна командою \e[92mdocker-compose -f $HOME/pathfinder/docker-compose.yml logs -f --tail=100\e[0m"
fi

# if [ "$language" = "uk" ]; then
# fi