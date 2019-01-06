#!/usr/bin/env bash
if [ ! -d "/home/autodep/haohao/" ];then
 git clone git@gitlab.com:haohaoteam/haohao.git
else
 echo "文件夹已经存在"
fi
echo "开始执行中...."
cd /home/autodep/haohao
git pull
echo "资源完毕更新完毕"

mvn package -Pdev -DskipTests=true
echo "执行打包完毕"
rm -rf *.jar
rm -rf *.war
find .|grep 0.0.war|xargs -i -t mv {} /home/autodep/haohao/
find .|grep 0.0.jar|xargs -i -t mv {} /home/autodep/haohao/
echo "移动文件完毕"
sh ./deploy/haohao-admin-test-shell.sh 
"启动docker 中................................"
echo "执行完毕"
