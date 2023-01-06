#!/bin/bash

while true; do
    # Check if the size of the DB is over 100 GB
    if [ $(du -h pathfinder/pathfinder/goerli.sqlite | cut -f1 | sed 's/G//') -gt 100 ]; then
        # Clear database and restart the node
        cd $HOME/pathfinder/
        docker-compose down -v
        rm -rf $HOME/pathfinder/pathfinder
        mkdir -p $HOME/pathfinder/pathfinder
        chown -R 1000.1000 .
        docker-compose up -d
        echo "[$(date)] Starknet DB file was succesfully cleared!"
    else
        echo "[$(date)] Starknet DB file size is $(du -h pathfinder/pathfinder/goerli.sqlite | cut -f1), waiting 100 GB.."
    fi
    # Wait 1 hour
    sleep 3600
done

