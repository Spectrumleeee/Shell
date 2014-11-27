#!/bin/bash

read -p "please entry your name: " -a name	# 从终端输入多个字符串，以空格为分隔符，回车结束，保存到数组（-a）name中
echo ${#name[@]};							# 输出数组name的元素个数
echo ${name[1]};							# 输出数组name的第二个元素

# REF: http://www.cnblogs.com/lottu/p/3427724.html
