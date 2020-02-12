FROM openjdk:8-jre-alpine
MAINTAINER xugongkai "KK989827@163.com"
ADD ./target/bbk-springcloud-eureka-0.0.1-SNAPSHOT.jar /app/bbk-springcloud-eureka-0.0.1-SNAPSHOT.jar
VOLUME /tmp

ENV TZ=Asia/Shanghai
ENV spring.profiles.active=prov
ENV JAVA_OPTS="\
-Xmx150m \
-XX:+UnlockExperimentalVMOptions \
-XX:+UseCGroupMemoryLimitForHeap \
-Dcom.sun.management.jmxremote.rmi.port=39997 \
-Dcom.sun.management.jmxremote=true \
-Dcom.sun.management.jmxremote.port=39997 \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.local.only=false \
-Djava.rmi.server.hostname=47.94.129.175 "

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 28761 39997

ENTRYPOINT java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app/bestbigkk-eureka-0.0.1-SNAPSHOT.jar
