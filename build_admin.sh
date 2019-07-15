#!/usr/bin/env bash
if [ ! -d "/home/deploy/haohao" ];then
 mkdir /home/deploy/
 cd /home/deploy/
 git clone git@gitlab.com:haohaoteam/haohao.git
else
 echo "folder is exits "
fi
echo "start exec ...."
cd /home/deploy/haohao
git pull
echo "git update done"

mvn package -Pprod -DskipTests=true
echo "package done"
rm -rf *.jar
rm -rf *.war
find .|grep 0.0.war|xargs -i -t mv {} /home/deploy/haohao/
find .|grep 0.0.jar|xargs -i -t mv {} /home/deploy/haohao/
echo "move done"
sh ./deploy/haohao-admin-test-shell.sh 
echo "start up docker ................................"
echo "exec done"
