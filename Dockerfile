FROM confluentinc/cp-kafka-connect-base

COPY ./target/kafka-connect-target/usr/share/java/kafka-connect-rabbitmq/* /etc/kafka-connect/jars/
COPY ./target/kafka-connect-target/etc/kafka-connect-rabbitmq/* /bin/config/
COPY ./start-connect.sh /start-connect.sh

ENV CLASSPATH=/etc/kafka-connect/jars/*
ENV KAFKA_HEAP_OPTS="-Xmx2G -Xms2G"


ENTRYPOINT ["/bin/bash", "start-connect.sh"]