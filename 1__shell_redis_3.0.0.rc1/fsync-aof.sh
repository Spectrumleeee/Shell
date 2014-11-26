#!/bin/bash
master_append_size=`ls -l 7001 | grep append | awk '{print $5}'`
slave_append_size=`ls -l 7004 | grep append | awk '{print $5}'`
echo 'master aofsize' $master_append_size kb
echo 'slave  aofsize' $slave_append_size kb
dbsize_master=`./client.sh dbsize 7001`
echo 'master dbsize ' $dbsize_master
dbsize_slave=`./client.sh dbsize 7004`
echo 'slave  dbsize ' $dbsize_slave 
dbsize_master=`./client.sh dbsize 7001`
echo 'master dbsize ' $dbsize_master
dbsize_slave=`./client.sh dbsize 7004`
echo 'slave  dbsize ' $dbsize_slave 
dbsize_master=`./client.sh dbsize 7001`
echo 'master dbsize ' $dbsize_master
