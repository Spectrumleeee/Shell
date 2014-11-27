#!/bin/bash

A=(a b c def)   # 定义$A数组
echo ${A[@]} 		# 或 ${A[*]}     可得到 a b c def (全部元素)
echo ${A[*]}
echo ${A[0]}     	# 可得到 a (第一个数组元素)，${A[1]} 则为第二个数组元素
echo ${#A[0]}     	# 可得到 1 (第一个数组元素(a)的长度)，
echo ${#A[3]}     	# 可得到 3 (第四个数组(def)的长度)
A[3]=xyz    		# 将第4个数组重新定义为 xyz
echo ${A[3]}

echo ${A[*]:0:3}	# 取前3个元素
B=(${A[@]:0:3})     # 将A中前3个元素深度复制给B
echo ${B[*]}	

unset A[0]			# 删除A中第一个元素
echo ${A[@]}		
echo ${B[@]}		# B没有改变，说明是深度复制
echo ${A[2]}
unset A
echo ${A[*]}		# A为空

# REF: http://www.cnblogs.com/lottu/p/3427724.html
