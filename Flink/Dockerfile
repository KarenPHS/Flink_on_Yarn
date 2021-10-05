FROM hsuan8169/hadoopha
MAINTAINER Hsuan hsuan8169@gmail.com

USER root

# Download Flink
RUN cd /usr/local && wget -O ./flink.tgz https://downloads.apache.org/flink/flink-1.14.0/flink-1.14.0-bin-scala_2.12.tgz && tar -xvf flink.tgz && chown root: -R /usr/local/flink-1.14.0 && mv flink-1.14.0 flink

RUN echo -e $'# Set Flink_HOME\n\
FLINK_HOME=/usr/local/flink\n\
# Add Hadoop bin and sbin directory to PATH\n\
export PATH=$PATH:$FLINK_HOME/bin\n\
# Add HADOOP_CLASSPATH\n\
export HADOOP_CLASSPATH=$(find $HADOOP_HOME -name '*.jar' | xargs echo | tr ' ' ':')' >> /root/.bashrc && source /root/.bashrc

# Set flink-conf.yaml
COPY ./flink-conf.yaml /usr/local/flink/conf/flink-conf.yaml

# Set Zookeeper
COPY ./zoo.cfg /usr/local/flink/conf/zoo.cfg

# Remove downloaded flink file
RUN rm /usr/local/flink.tgz
