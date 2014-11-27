#!/bin/bash

count=1
# 第一种方式
while read line
do
  echo "$count:$line"
  count=$(($count+1))
  # let count=count+1
 done < date

# 第二种方式
cat date | while read one two three four
do
  echo "$one:$two:$three"
  echo "$one:$four"
  echo "$two:$four"
  echo "${three}:${four}"			# 为什么结果会是这样？？？
  echo "$three"
  echo "$four"
done

exit 0

# REF: http://www.cnblogs.com/lottu/p/3427724.html
