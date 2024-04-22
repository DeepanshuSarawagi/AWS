# Brief document explaining design and components of Simple Notification Service

## Introduction:

- It is used as a subscribe/publish messaging service.
- SNS is centered around topics. You can think of a topic as a group for collecting
  messages.
- Users or endpoints can then subscribe to this topic, where messages or events
  are published.
- When a message is published, all subscribers of that topic receive a notification
  of that message.
- SNS is a managed service which is highly scalable allowing you to distribute messages
  automatically to all the subscribers in your environment, including mobile devices.
- SNS uses the concept of Publishers and Subscribers.
- The publishers sends messages to a SNS topic which is used as the central communication
  control point.
- Subscribers are then notified of this message in the topic by one of the following
  methods:
    - HTTP
    - HTTPS
    - Email
    - SQS
    - Email-JSON
    - Application
    - Lambda
    - SMS
    - Kinesis Data Firehose
- SNS integrates with lot of AWS services.
- Many AWS services can send data directly to SNS for notifications.
  - CloudWatch Alarms.
  - ASG Notifications.
  - CloudFormation State changes.
  - AWS Budgets.
  - S3 Events notifications.
  - AWS DMS.
  - Lambda.
  - DynamoDB.
  - RDS Events.
- Upto `12,500,000` subscriptions per topic.
- An account can have upto `100,000` topics limit.
- SNS offers methods of controlling specific access to your topics through topic
  policy. For example, you can specify which protocol subscribers must use such as
  SMS or HTTPS, or you can restrict access of a topic to a specific user.
- SNS and SQS can be integrated seamlessly. A Solution can be designed to send messages
  seamlessly to subscribers through a push method, while SQS handles incoming messages
  and waits for consumers to pull data.

## SNS and SQS Fan-out pattern:
  - Push once in SNS, receive in all SQS queues that are subscribers.
  - We need to make sure SQS queue access policy allows for SNS to write.
  - SNS can directly connect with Kinesis Data Firehose.
  - SNS FIFO - same like SQS FIFO, the subscribers can only by SQS FIFO.
  - The SNS FIFO naming convention - should have .fifo extension.
  - Same throughput as of SQS FIFO.
  - SNS Message Filtering using SNS Fan Out pattern.
  - JSON Policy used to filter messages sent to SNS Topic's subscribers.
  - Cross Region Delivery: Works with SQS in other region provided the security allows it.

**SNS FIFO + SQS FIFO: Fan Out**
  - Provides Fan Out + Ordering + De-duplication.

## Amazon SNS – Security

### Encryption:

- In-flight encryption using HTTPS API
- At-rest encryption using KMS keys
- Client-side encryption if the client wants to perform encryption/decryption itself
### Access Controls: 
- IAM policies to regulate access to the SNS API
- SNS Access Policies (similar to S3 bucket policies)
- Useful for cross-account access to SNS topics
- Useful for allowing other services ( S3…) to write to an SNS topic

## SNS - Messaging Filtering:

- JSON policy used to filter messages sent to SNS topic’s subscriptions
- If a subscription doesn’t have a filter policy, it receives every message

## SNS Message delivery retries:

- Amazon SNS defines a delivery policy for each delivery protocol. 
- The delivery policy defines how Amazon SNS retries the delivery of messages when server-side errors occur 
  (when the system that hosts the subscribed endpoint becomes unavailable). 
- When the delivery policy is exhausted, Amazon SNS stops retrying the delivery and discards the message—unless a dead-letter queue is attached to the subscription.

For delivery protocols and policies, refer to this [table](https://docs.aws.amazon.com/sns/latest/dg/sns-message-delivery-retries.html).

## Delivery policy stages

Each delivery policy is comprised of four phases.

### Immediate Retry Phase (No Delay): 

- This phase occurs immediately after the initial delivery attempt. There is no delay between retries in this phase.

### Pre-Backoff Phase

- This phase follows the Immediate Retry Phase. 
- Amazon SNS uses this phase to attempt a set of retries before applying a backoff function. 
- This phase specifies the number of retries and the amount of delay between them.

### Backoff Phase

- This phase controls the delay between retries by using the retry-backoff function. 
- This phase sets a minimum delay, a maximum delay, and a retry-backoff function that defines how quickly the delay increases from the minimum to the maximum delay. 
- The backoff function can be arithmetic, exponential, geometric, or linear.

### Post-Backoff Phase

- This phase follows the backoff phase. 
- It specifies a number of retries and the amount of delay between them. 
- This is the final phase.