#!/bin/bash

if [ $# -ne 2 ] ; then
  echo 'USAGE: ./oneKey_recreate_cluster.sh beginNode endingNode'
  exit 0
fi

./stopAll.sh
beginNode=$1
endingNode=$2

for ((i=$beginNode;i<=$endingNode;i++)) ;
  do
#    echo $i
#    let i=i+1
    rm -r $i
    ./create_node.sh $i
    ./startAll.sh $i
  done

./create_cluster.sh


