#!/bin/bash

if [ $# -eq 0 ] ; then
./showPid.sh > all-redis-pid.txt
while read line
do
	echo $line | awk '{print $2}' >> pid.txt
done < all-redis-pid.txt

while read linePid
do
	kill -9 $linePid
done	< pid.txt
rm all-redis-pid.txt
rm pid.txt 	
else
	for arg in "$@" ;
 	  do
 	     redis-cli -h 127.0.0.1 -p $arg shutdown
	  done 
fi
