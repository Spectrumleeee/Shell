#!/bin/bash
if [ $# -ne 2 ] ; then
  echo "USAGE: ./fsync-aof.sh master_port slave_port"
  exit 0
fi
master_port=$1
slave_port=$2
master_append_size=`ls -l 7001 | grep append | awk '{print $5}'`
slave_append_size=`ls -l 7004 | grep append | awk '{print $5}'`
echo 'master aofsize' $master_append_size kb
echo 'slave  aofsize' $slave_append_size kb
dbsize_master=`./client.sh dbsize $master_port`
echo 'master dbsize ' $dbsize_master
dbsize_slave=`./client.sh dbsize $slave_port`
echo 'slave  dbsize ' $dbsize_slave 

count=0;
while (( 1<2 ))
 do
	dbsize_master=`./client.sh dbsize $master_port`
	dbsize_slave=`./client.sh dbsize $slave_port`
	if [ ! -z "$dbsize_slave" ] && [ "$dbsize_slave" != "$dbsize_master"  ] ; then
		 echo $dbsize_slave" : "$dbsize_master
	else
		 echo finished in $count secs! 
		 echo $dbsize_slave" : "$dbsize_master
		 exit 0
	fi
	((count=count+1))
  	sleep 1
 done
