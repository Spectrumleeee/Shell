#!/bin/bash

./showPid.sh 7000 master | awk -F ':' '{print $2}' > master

while read line
do 
  ./client.sh flushall $line
  echo 'success to flush m/s '$line 
done < master

