# Brief document on AWS Simple Queue Service

## Introduction:

- It is a service that handles the delivery of messages between the components.
- It is a fully managed service that works with serverless systems, microservices
  and distributed architecture.
- It has the capability of sending, storing and receiving messages at scale without
  dropping message data. 
- It also has the feature of dead-letter queue.
- Default retention of 4 days and maximum of 14 days.
- Limitation of < 256KB per message.
- Can have duplicate messages.
- Used to decouple services.
- SQS can scale automatically.
- Messages can be read by EC2 instances or Lambda.
- SQS could be used as write buffer for DynamoDB.
  - Instead of writing directly to DynamoDB during an event of throttling issues, write to SQS instead.
  - Since it can scale exponentially.
  - The application can take the writes from SQS and then write it to DynamoDB table.

## SQS Components:

### Producer:
  - Producer component of your architecture is responsible to send messages to
    your queue.
  - At this point, the SQS service stores the message across a number of SQS servers
    for resiliency within the specified Queue.

### Consumers:

  - Consumers are responsible for processing messages within your queue.
  - Consumers poll for messages from the queue. (Max 10 messages at a time)
  - Once the message is processed, delete the message using DeleteMessageAPI.

  - When the consumer element of your architecture is ready to process the message from the queue,
    the message is then retrieved and is marked as
    processed by activating the visibility timeout on the message.
  - This timeout will ensure that the same message will not be read and processed
    by another consumer.
  - When the message has been processed, the consumer will then delete the message
    from the queue.
  - The default visibility timeout is 30 seconds and it can be set to as long as
    12 hours.
  - If the consumer needs to process the message which will take longer than the visibility timeout, then it can
    call the ChangeMessageVisibility API to get more time.
  - If a consumer fails to process a message during this visibility timeout due to
    communication error, the consumer will not send a delete message request to the
    queue.
  - If the visibility timeout expires, the message will become available again in
    the queue for other consumers to process.
  - SQS with ASG (Auto Scaling Group):
    - Consumers(EC2) in the ASG will poll for the messages from the SQS.
    - The SQS can monitor the CloudWatch Metric - Queue Length (ApproximateNumberOfMessages)
    - Based on the QueueLength, the ASG can scale out the instances/consumers based on the CloudWatch Alarm triggered.

## SQS Queue Types:

### Standard Queues:
  - Supports at least once delivery of messages which means the message can be delivered
    to the queue more than once.
  - They offer a best effort on trying to preserve the message ordering.
  - They provide almost unlimited number of transactions per second.
  - If message ordering is critical to your solution, then this type of queue service
    may not be the best fit.
  - DLQ of standard queue must also be a standard queue.

### First-In, First-Out:
  - The order of messages is maintained and there are no duplicates.
  - Limited number of transactions per second.
  - Defaulted to 300 transactions per second for all send, receive and delete operations without batching.
    - Upto 3000 messages per second with batching.
  - If we are using batching with SQS, the limit increases to 3000 TPS with batching.
  - The queue name extension should end with .fifo
  - Content based deduplication can be enabled.
  - DLQ of FIFO queue must also be a FIFO queue.

### Dead Letter Queue:
  - DLQ is not used as source messages to hold messages submitted by Producers.
  - Instead, DLQ is used by the source queue to send messages that fail processing.
    - If a consumer fails to process message within a visibility timeout then the message goes back to Queue..
  - If the message cant be processed by the consumer after a maximum number of tries
    specified (MaximumReceives threshold; it can be set between 1 and 1000), the queue will then send the message to DLQ.
  - The DLQ must have the same queue type as the source It's used against.

#### SQS DLQ - Redrive to source:

- Feature to help consume messages in DLQ to understand what is wrong with them.
- Post debugging issue, when the code is fixed, we can redrive the messages from DLQ back to the source queue in batches without
  writing custom code.

## SQS Queue Access Policy:
  - They are resource policy.
  - Helps to enable cross account access.
  - Publish S3 Event Notification to SQS Queue - for this SQS needs to give permission to S3 that it can send message.

## SQS Delay Messages:
  - Delay a message, consumers dont see it immediately upto 15 minutes.
  - The default is 0 seconds with message being available right away.
  - Can set at default queue level and can be overridden using DelaySeconds parameter for each queue.

## SQS Long Polling:
  - When a consumer requests for a messages from a queue, it can wait for messages to arrive if there are none in the queue.
  - This is called as Long Polling.
  - LongPolling decreases the number of API calls made to SQS queue and increases efficiency and decreases latency of your
    consumer.
  - The wait can be 1 to 20 seconds.
  - Long Polling can be enabled at the queue level or at the API level using WaitTimeSeconds parameter.

## SQS Request-Response Systems:
  - We can implement Request Response Systems using the SQS Temporary Queue Client.
  - It creates virtual queues instead of leveraging SQS queues (Cost effective)

## SQS - Solution Architecture Idempotency
- Messages can be processed twice by consumer (in case of failures, timeouts, etc)
- To hedge against that problem, implement idempotency.
- Means that same action done twice by consumer wont duplicate the effect. 

