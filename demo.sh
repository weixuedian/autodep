#!/usr/bin/env bash
CONTAINER_NAME=haohao-xx-1.0.0
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
array=("172.0.0.1")
for data in ${array[@]}
do
    DOCKER_CMD="docker --host=${data}:2375 "
    JAR_SOURCE=${CONTAINER_NAME}.jar
    echo "JAR_SOURCE=${JAR_SOURCE}"
    echo "REMOVING ${data}"
    echo "STARTING ${data}"
    ${DOCKER_CMD} run \
               --env JAVA_OPTS="-Dhost.ip=${data} -Duser.timezone=GMT+08 -Dspring.profiles.active=dev" \
               --env SERVER_IP=${data} \
               --name ${CONTAINER_NAME} \
               --publish 8081:8080/tcp \
               --expose 8080/tcp \
               --volume /opt/docker/${CONTAINER_NAME}/logs:/logs \
               --restart always \
               --detach \
               ccr.ccs.tencentyun.com/weixuedian/java8-springboot-jar:8-boot-jar
    echo "COPYING ${data}"
    ${DOCKER_CMD} cp ${JAR_SOURCE} ${CONTAINER_NAME}:/app.jar
done
