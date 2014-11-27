#!/bin/bash

# 读取字符串长度
file=/dir1/dir2/dir3/my.file.txt
echo $file
echo ${#file}
echo $file | awk '{print length($0)}'

# 替换字符串
echo ${file/dir/path}				#替换第一个dir为path
echo ${file//dir/path}				#替换所有dir为path
echo $file | sed 's/dir/path/'		#替换第一个dir为path
echo $file | sed 's/dir/path/g'		#替换所有dir为path

# 截取字符串 -- ${变量名：起始位置：长度}
echo ${file:0:5}
echo ${file:1:5}
echo ${file: -4}					# 只提取最后4位，常用于提取后缀名，注意 ：与-4之间是有一个空格的，'-'有特殊意义，看下面

# 对未设定，空值的变量操作
name=lgp
echo $name
echo ${name:-spectrumleeee}			# name有初始值
unset name
echo ${name:-spectrumleeee}			# name未定义

# 三目表达式 语法是expr && cmd1 ||cmd2
[ 7 -gt 6 ] && echo "yes" || echo "no"
[ 7 -lt 6 ] && echo "yes" || echo "no"
((a=7<6?1234:5678))
echo $a
[ 7 -lt 6 ] && : ||echo "11"
[ 7 -gt 6 ] && : ||echo "111"
echo $?
[ 7 -lt 6 ] && true ||echo "1111"
echo $?

# REF: http://www.cnblogs.com/lottu/p/3427724.html
