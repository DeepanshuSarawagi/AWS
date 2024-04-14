# Amazon MQ

- Amazon MQ is managed message broker service for RabbitMQ and ActiveMQ.
- SQS, SNS are "cloud-native" services: proprietary protocols from AWS
- When migrating to the cloud, instead of re-engineering the application to use SQS and SNS, we can use Amazon MQ.
- Amazon MQ doesn't "scale" as much as SQS / SNS
- Amazon MQ runs on servers, can run in Multi-AZ with failover
- Amazon MQ has both queue feature (~SQS) and topic features (~SNS)