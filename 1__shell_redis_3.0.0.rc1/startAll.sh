#!/bin/bash

pid=7000
maxPid=7010

if [ $# -eq 0 ] ; then
  while [ $pid -lt $maxPid ] ;
   do
	cd $pid
	   redis-server ./redis.conf
	cd ..
	let pid+=1
   done
else
	for arg in "$@" ;
	  do
	    cd $arg
               redis-server ./redis.conf
            cd ..
          done	
fi
