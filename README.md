# starknet

version: v0.4.2

## Installing

1. Run the script:

```sh
. <(wget -qO- sh.f5nodes.com) starknet
```

## Commands

#### Check node logs:

```sh
docker-compose -f $HOME/pathfinder/docker-compose.yml logs -f --tail=100
```

**CTRL + C** to exit logs

#### Restart the node:

```sh
docker-compose -f $HOME/pathfinder/docker-compose.yml restart
```

#### Stop the node:

```sh
docker-compose -f $HOME/pathfinder/docker-compose.yml down
```
