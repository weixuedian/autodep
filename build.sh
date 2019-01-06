#!/usr/bin/env bash
if [ ! -d "/home/autodep/haohao/" ];then
 git clone git@gitlab.com:haohaoteam/haohao.git
else
 echo "文件夹已经存在"
 git pull
fi
echo "开始执行中...."
cd /home/autodep/haohao
git pull
echo "更新完毕"

echo "结束执行"


