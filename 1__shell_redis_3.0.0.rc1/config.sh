#!/bin/bash

if [ $# -eq 0 ];then
  echo "Usage: ./config.sh key value start_pid stop_pid "
  exit
fi

CFG=redis.conf
modify_key=$1
modify_value=$2
start_pid=$3
stop_pid=$4

index=$start_pid
let last=stop_pid+1

while [ $index -lt $last ] ;
  do
    cd $index
    sed -i "/^$modify_key/c$modify_key $modify_value" $CFG
    let index=index+1
    cd ..  
  done
