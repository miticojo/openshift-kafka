# "Apache Kafka for OpenShift"

Run [Apache Kafka](https://kafka.apache.org/) and [Apache ZooKeeper](https://zookeeper.apache.org/) on [OpenShift v3](https://www.openshift.com/), based on official RHEL 7 docker image.

This was developed for demonstration purposes. Use in environments where you do not need persistence in the face of failures or configuration tuning for scale.

The architecture is as follows:

* 1 pod containing a container for Apache Kafka and Apache ZooKeeper
* 1 service to access the containers

## Quick start

1. Load resources (Template with ImageStream, BuildConfig, DeploymentConfigs, Services)
 ```bash
oc create -f https://raw.githubusercontent.com/miticojo/openshift-kafka/master/template.yaml
```

1. Deploy the Apache Kafka + Apache Zookeeper pod
   ```bash
oc new-app openshift-kafka
```

## Follow the [Apache Kafka Documentation Quick Start](https://kafka.apache.org/documentation.html#quickstart)

1. Deploy a debugging container and connect to it
   ```bash
oc run -it --rm kafka-debug --image<namespace>/openshift-kafka --command -- bash
```

1. Create a topic
   ```bash
bin/kafka-topics.sh --create --zookeeper apache-kafka --replication-factor 1 --partitions 1 --topic test
```

1. List topics
   ```bash
bin/kafka-topics.sh --list --zookeeper apache-kafka
```

1. Send some messages
   ```bash
bin/kafka-console-producer.sh --broker-list apache-kafka:9092 --topic test <<EOF
foo
bar
baz
EOF
```

1. Receive some messages
   ```bash
bin/kafka-console-consumer.sh --bootstrap-server apache-kafka:9092 --topic test --from-beginning
```

## Credits

* This is based on work original by:
  * [Matthew Farrellee](https://github.com/mattf/openshift-kafka)
  * [Jim Minter](https://github.com/jim-minter)
