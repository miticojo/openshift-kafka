FROM registry.access.redhat.com/rhel7:latest
MAINTAINER Giorgio Crivellari <gcrivell@redhat.com>


RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java-$JDK_VER-openjdk-headless tar \
  && curl -s https://www.mirrorservice.org/sites/ftp.apache.org/kafka/$KAFKA_VER/kafka_$SCALA_VER-$KAFKA_VER.tgz | tar -xz --strip-components=1 \
  && yum clean all

RUN chmod -R a=u /opt/kafka

WORKDIR /opt/kafka

VOLUME /tmp/kafka-logs /tmp/zookeeper

EXPOSE 2181 2888 3888 9092
