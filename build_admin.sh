#!/usr/bin/env bash
if [ ! -d "/home/deploy/haohao" ];then
 mkdir /home/deploy/
 cd /home/deploy/
 git clone git@gitlab.com:haohaoteam/haohao.git
else
 echo "文件夹已经存在"
fi
echo "开始执行中...."
cd /home/deploy/haohao
git pull
echo "资源完毕更新完毕"

mvn package -Pprod -DskipTests=true
echo "执行打包完毕"
rm -rf *.jar
rm -rf *.war
find .|grep 0.0.war|xargs -i -t mv {} /home/haohao/
find .|grep 0.0.jar|xargs -i -t mv {} /home/haohao/
echo "移动文件完毕"
sh ./deploy/haohao-admin-test-shell.sh 
echo "启动docker 中................................"
echo "执行完毕"
