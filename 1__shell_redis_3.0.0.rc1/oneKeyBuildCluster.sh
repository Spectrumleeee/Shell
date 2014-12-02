#!/bin/bash

./stopAll.sh

ip_port_list=()
port_list=()
#ip_port_list[0]="hello"
#ip_port_list[1]="world"
#echo ${ip_port_list[*]}
index=0
while read line
do
    ip_port_list[$index]=$line
    port_list[$index]=`echo $line | awk -F ':' '{print $2}' `
    ((index=index+1))
done < ip-port

cluster_ip_port_list=`echo ${ip_port_list[*]}`
#echo ${port_list[*]}

#redis-trib.rb create --replicas 1 $cluster_ip_port_list

index=0
port_list_len=${#port_list[@]}
while [ $index -lt $port_list_len ]
do
    rm -r ${port_list[$index]}
    ./create_node.sh ${port_list[$index]}
    ./startAll.sh ${port_list[$index]}
    ((index=index+1))
done

redis-trib.rb create --replicas 1 $cluster_ip_port_list
