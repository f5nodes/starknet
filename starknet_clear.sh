#!/bin/bash

threshold_size=$(( $1 * 1024 * 1024 * 1024 ))
database_file="$HOME/pathfinder/pathfinder/goerli.sqlite"

while true; do
    # Check if the size of the DB is over the threshold size
    if [ "$(stat -c "%s" "$database_file")" -gt "$threshold_size" ]; then
        # Clear database and restart the node
        cd $HOME/pathfinder/
        docker-compose down -v
        rm -rf $HOME/pathfinder/pathfinder
        mkdir -p $HOME/pathfinder/pathfinder
        chown -R 1000.1000 .
        docker-compose up -d
        echo "[$(date)] Starknet DB file was successfully cleared!"
    else
		  echo "[$(date)] Starknet DB file size is $(stat -c "%s" "$database_file"), waiting $1 GB.."
    fi
    # Wait 1 hour
    sleep 3600
done
