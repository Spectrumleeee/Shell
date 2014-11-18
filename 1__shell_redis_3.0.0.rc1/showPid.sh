#!/bin/bash

if [ $# -eq 0 ] ; then
ps aux | grep 'redis-server' | grep 'cluster'
else
  redis-cli -c -p $1 cluster nodes | grep $2 | awk '{print $2}'

fi

