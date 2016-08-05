FROM debian:jessie

MAINTAINER jjeffcaii@outlook.com

ENV \
JAVA_VERSION_MAJOR=8 \
JAVA_VERSION_MINOR=102 \
JAVA_VERSION_BUILD=14 \
JAVA_PACKAGE=jdk \
JAVA_HOME=/opt/jdk \
PATH=${PATH}:/opt/jdk/bin

RUN \
apt-get update && \
apt-get install curl -y && \
cd /tmp && \
curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/${JAVA_PACKAGE}/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz" && \
tar xvzf jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz -C /opt && \
rm -f /tmp/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
apt-get remove curl -y && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
mv /opt/${JAVA_PACKAGE}* /opt/jdk && \
rm -rf /opt/jdk/*src.zip \
/opt/jdk/lib/missioncontrol \
/opt/jdk/lib/visualvm \
/opt/jdk/lib/*javafx* \
/opt/jdk/jre/lib/plugin.jar \
/opt/jdk/jre/lib/ext/jfxrt.jar \
/opt/jdk/jre/bin/javaws \
/opt/jdk/jre/lib/javaws.jar \
/opt/jdk/jre/lib/desktop \
/opt/jdk/jre/plugin \
/opt/jdk/jre/lib/deploy* \
/opt/jdk/jre/lib/*javafx* \
/opt/jdk/jre/lib/*jfx* \
/opt/jdk/jre/lib/amd64/libdecora_sse.so \
/opt/jdk/jre/lib/amd64/libprism_*.so \
/opt/jdk/jre/lib/amd64/libfxplugins.so \
/opt/jdk/jre/lib/amd64/libglass.so \
/opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
/opt/jdk/jre/lib/amd64/libjavafx*.so \
/opt/jdk/jre/lib/amd64/libjfx*.so

CMD [ "bash" ]
