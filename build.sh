#!/usr/bin/env bash
if [ ! -d "/home/autodep/haohao/" ];then
 git clone git@gitlab.com:haohaoteam/haohao.git
else
 echo "文件夹已经存在"
 cd hoahao
 git pull
fi


