#!/usr/bin/env bash
if [ ! -d "/home/autodep/haohao/" ];then
 git clone git@gitlab.com:haohaoteam/haohao.git
else
 echo "folder exits "
fi
echo "start pull ...."
cd /home/autodep/haohao
git pull
echo "pull done"

mvn package -Pdev -DskipTests=true
echo "package done"
rm -rf *.jar
rm -rf *.war
find .|grep 0.0.war|xargs -i -t mv {} /home/autodep/haohao/
find .|grep 0.0.jar|xargs -i -t mv {} /home/autodep/haohao/
echo "move done"
sh ./deploy/haohao-api-test-shell.sh 
"start docker ing ................................"
echo "exec done"


