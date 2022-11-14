# starknet

version: v0.4.0

## Installing

1. Run the script:

```sh
. <(wget -qO- sh.f5nodes.com) starknet
```

## Commands

#### Check node logs:

```sh
journalctl -u starknetd -f
```

**CTRL + C** to exit logs

#### Restart the node:

```sh
systemctl restart starknetd
```

#### Delete node:

```sh
systemctl stop starknetd
systemctl disable starknetd
rm -rf ~/pathfinder/
rm -rf /etc/systemd/system/starknetd.service
rm -rf /usr/local/bin/pathfinder
```
