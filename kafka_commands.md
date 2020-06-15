#### run zookeeper
```
zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
```
#### run kafka-server
```
kafka-server-start.sh $KAFKA_HOME/config/server.properties
```
#### create cluster

```
$kafka-topics.sh --create --zookeeper <ZOOKEEPER_URL:PORT> 
                  --replication-factor <NO_OF_REPLICATIONS> 
                  --partitions <NO_OF_PARTITIONS> --topic <TOPIC_NAME>
```      

#### create topic
```
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic1
```

#### list zookeeper topics
```
kafka-topics.sh --list --zookeeper localhost:2181
kafka-topics.sh --describe --zookeeper localhost:2181 --topic topic1
```

#### kafka producer
```
kafka-console-producer.sh --broker-list localhost:9092 --topic topic1
```

#### kafka consumer 
```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic1
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic1 --from-beginning
```

#### server configs 
```
cd ~/kafka/config

cp server.properties server-1.properties
nano server-1.properties
broker.id=1
listeners=PLAINTEXT://:9081
log.dir=/tmp/kafka-logs-1

cp server.properties server-2.properties
nano server-2.properties
broker.id=2
listeners=PLAINTEXT://:9082
log.dir=/tmp/kafka-logs-2

cp server.properties server-3.properties
nano server-3.properties
broker.id=3
listeners=PLAINTEXT://:9083
log.dir=/tmp/kafka-logs_3
```

#### start servers (seperate terminals)
```
bin/kafka-server-start.sh kafka/config/server.properties

kafka-server-start.sh $KAFKA_HOME/config/server.properties
kafka-server-start.sh $KAFKA_HOME/config/server-1.properties
kafka-server-start.sh $KAFKA_HOME/config/server-2.properties
kafka-server-start.sh $KAFKA_HOME/config/server-3.properties
```

#### check if zookeeper is alive 
```
service --status-all
```
