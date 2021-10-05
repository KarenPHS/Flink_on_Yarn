FROM hsuan8169/hadoopha
MAINTAINER Hsuan hsuan8169@gmail.com

USER root

# Download Flink
RUN cd /usr/local && wget -O ./flink.tgz https://downloads.apache.org/flink/flink-1.14.0/flink-1.14.0-bin-scala_2.12.tgz && tar -xvf flink.tgz && chown root: -R /usr/local/flink-1.14.0 && mv flink-1.14.0 flink

# Set Zookeeper
RUN cd /usr/local/zookeeper/conf && cp zoo_sample.cfg zoo.cfg
RUN sed -i '12s@.*@dataDir=/usr/local/zookeeper/zoodata@g' /usr/local/zookeeper/conf/zoo.cfg
RUN sed -i '17s@#maxClientCnxns=60@maxClientCnxns=60@g' /usr/local/zookeeper/conf/zoo.cfg
RUN echo -e $'admin.serverPort=8010\n\
server.1=journalnode1:2888:3888\n\
server.2=journalnode2:2888:3888\n\
server.3=journalnode3:2888:3888' >> /usr/local/zookeeper/conf/zoo.cfg





# Set zkEnv.sh
RUN sed -i '30iZOO_LOG_DIR="/usr/local/zookeeper/logs"' /usr/local/zookeeper/bin/zkEnv.sh
RUN sed -i '31iZOO_LOG4J_PROP="INFO,ROLLINGFILE"' /usr/local/zookeeper/bin/zkEnv.sh

# Build NN HA File
RUN mkdir /usr/local/hadoop/journalnode
# Build RM HA Fiel
RUN mkdir /usr/local/zookeeper/zoodata && echo -e $'1' > /usr/local/zookeeper/zoodata/myid

RUN echo -e $'# Add Zookeeper_HOME\n\
export ZOOKEEPER_HOME=/usr/local/zookeeper\n\
# Add Zookeeper_CONF\n\
export ZOOKEEPER_CONF=/usr/local/zookeeper/conf\n\
# Add Zookeeper PATH\n\
export PATH=$PATH:$ZOOKEEPER_HOME/bin' >> /root/.bashrc && source /root/.bashrc

# Remove downloaded zookeeper file
RUN rm /usr/local/zookeeper.tar.gz
