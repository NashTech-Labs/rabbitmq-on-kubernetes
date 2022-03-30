# RabbitMQ on Kubernetes

RabbitMQ is a message broker system which follows AMQP protocol. To deploy the RabbitMQ on Kubernetes and manage replication and HA for the messages is a difficult task.

We will use RabbitMQ operator to deploy the CRDs. Then we will use the helm chart to deploy the Cluster.

### Prerequisites
- Kubernetes 1.21+
- Helm v3

### Deploy the RabbitMQ operator

```
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install rabbitmq-operator bitnami/rabbitmq-cluster-operator -n rabbitmq --create-namespace --atomic
```

### Deploy the RabbitMQ Cluster
To deploy a cluster, make changes to the already existing values file or create new values file from it and execute the following command:
```
helm install rabbitmq-cluster ./rabbitmq-cluster -n rabbitmq -f <new-values-file-if-created> --atomic
```
