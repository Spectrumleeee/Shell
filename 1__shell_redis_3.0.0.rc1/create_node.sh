#!/bin/bash

if [ $# -eq 0 ]; then
  echo 'Usage: ./create_node.sh node'
  exit
else
  if [ -d $1 ]; then
    echo 'directory '$1' already exists!'
    exit
  else
      cp -r template $1
      ./config.sh port $1 $1 $1
      ./config.sh pidfile /home/cloud/redis-cluster/$1/redis.pid $1 $1
      ./config.sh cluster-node-timeout 4444 $1 $1
  fi
fi 
