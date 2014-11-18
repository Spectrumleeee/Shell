#!/bin/bash

if [ $# -eq 0 ]; then
  redis-cli -c -p 7000
elif [ $# -eq 1 ]; then 
  redis-cli -c -p $1
elif [ $# -eq 2 ]; then
  if [ $1 == 'flushall' ]; then
    redis-cli -c -p $2 $1
  elif [ $1 == 'dbsize' ]; then
    redis-cli -c -p $2 $1
  else
    redis-cli -c -p 7000 $1 $2
  fi
elif [ $# -eq 3 ]; then
  redis-cli -c -p $1 $2 $3
else
  redis-cli -c -p $4 $1 $2 $3
fi
