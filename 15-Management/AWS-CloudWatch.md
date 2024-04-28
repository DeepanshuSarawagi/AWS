# Brief document on Amazon CloudWatch

## Introduction:

- Designed for monitoring health and operation performance.
- Features of CloudWatch
  - CloudWatch Dashboards
    - We can create dashboards using AWS Management console or using CLI by calling
      PutDashboardAPI to build and customize page using different visual widgets.
    - We can monitor resources in multiple different regions using dashboards.
    - Dashboards are global and can include graphs from different regions/AWS accounts.
    - Dashboards can be shared with people who don't have AWS account using email or 3rd party SSO provider using Cognito.
  - Default monitoring records metrics every 5 minutes, detailed monitoring records metrics every 1 minute at additional cost.

## CloudWatch Metrics and Anomaly Detection: 
- Metrics enables you to monitor a specific element of an application or a resource over a period of time while tracking these data points.
  - Disk Reads/Writes
  - NumberOfObjects - specific to S3
  - Creating customised is regional. A metric cannot be available for another region.
- Allows CloudWatch to implement ML algorithms against your data to help detect any activity which is outside the normal 
  baseline parameters that are generally expected

## CloudWatch Custom Metric:
- Possible to define your own custom metric and send to CloudWatch.
- Example: RAM usage, disk space, number of logged in users
- We can use API call PutMetricData
- You can push metrics in two resolutions (We can say for how frequently we want to monitor this metric):
  - Standard: 60 seconds
  - High Resolution: 1/5/10/30 seconds at higher cost.

## CloudWatch Alarms

- CloudWatch Alarms tightly integrate with Metrics and allow you to create automatic actions based on specific 
  thresholds that you configure relating to reach metric
- Can be easily integrated with dashboards.
- We can perform actions using CloudWatch Alarms Action.
  - EC2 instance action (Stop, Reboot, Terminate, Recover)
  - ASG actions (Scale based on different CloudWatch Alarms)
  - SNS (Email notifications)
- If you set an alarm on a high-resolution metric, you can specify a high-resolution alarm with a period
of 10 seconds or 30 seconds, or you can set a regular alarm with a period of any multiple of 60 seconds.

## CloudWatch Synthetics Canary:

- Configurable script that monitor your APls, URLs, Websites, ...
- Reproduce what your customers do programmatically to find issues before customers are impacted
- Checks the availability and latency of your endpoints and can store load time data and screenshots of the Ul
- Integration with CloudWatch Alarms Scripts written in Node.js or Python
- Programmatic access to a headless Google Chrome browser
- Can run once or on a regular schedule

### CloudWatch Synthetics Canary Blueprints:

- **Heartbeat Monitor:** Load URL, store screenshot and an HTTP archive file.
- **API Canary:** Test basic read and write functions of REST APIs.
- **Broken link checker:** Check all the links inside URL is working.
- **Visual monitoring:** Compare a screenshot taken during a canary run with a baseline screenshot.
- **Canary recorder:** Used with CloudWatch Synthetics recorder - (record your actions on a website and automatically 
    generate a script for it)
- **GUI Workflow builder:** verifies that actions can be taken on your webpage. E.g., login form.

## CloudWatch EventBridge

- EventBridge connects to your own application allowing to respond to your events that occur in your application.
- Has evolved from an existing feature called Amazon Events.
- Amazon EventBridge is the only event-based service that integrates directly with third-party SaaS partners.
- An event is anything that causes change to your environment or application.
- CloudWatch EventBridge supports following targets
  - Amazon EC2
  - Amazon Lambda
  - Amazon Kinesis Data Stream
  - Amazon Kinesis Data FireHose
  - Amazon SNS and SQS queues
  - Amazon CloudWatch Logs
  - Amazon Batch jobs
  - CodeBuild Projects
  - AWS CodePipeline
  - EC2 CreateSnapshot, EC2 RebootInstances, EC2 StopInstance, EC2 TerminateInstances API calls
  - Amazon API Gateway REST API Endpoints
  - Amazon Redshift clusters
### Rules:
- Acts as a filter for incoming streams of event traffic and routes these events to appropriate targets defined within the Rule.
- Rule itself can route events to multiple targets, however, targets must be in the same region.

### Targets:
- Targets are where the events are sent by the Rules.

### Event Bus:
- It is the component that actually receives the events from your application and your rules are associated to specific event bus.

### Schema Registry:

- The schema registry allows you to generate code for your application that will know in advance how data is structured in the event bus.
- Schema can be versioned.

## CloudWatch Logs

- Gives you a centralized location to house all of your logs from different AWS
  services which provides logs as an output, such as CloudTrail, EC2, VPC Flow Logs etc.
- Acts as a central repository for real time monitoring of all the log data.
- Can utilize Insights to get overview of logs in real-time and take actions as needed.
- CloudWatch Logs can send logs to:
  - Kinesis Data Streams
  - Kinesis Data Firehose
  - S3
  - ElasticSearch
- Unified CloudWatch Agent can collect logs and additional metric data from EC2 instances as well as from on-premise services 
  running either a linux or windows operating system
- CloudWatch Agent installation requires creation of role and attaching it to the instance with permissions to collect 
  the data and also interacting with AWS SSM
- Download and install the agent on EC2 instance.
- Configure and restart the EC2 instance.
- The most efficient of achieving this is to use the EC2 systems manager.
- For installing Unified CloudWatch Agent using EC2 Systems Manager, we need to create two roles:
  - EC2 Allows EC2 instances to call AWS services on your behalf
    Use to install the agent and send the metrics to CloudWatch with policies
    (CloudWatchAgentServerPolicy and AmazonEC2RoleforSSM)
  - Used to communicate with the parameters store within Systems Manager, to store
    the configuration information file of the agent which then can be shared with
    other EC2 instances for Agent installation. (CloudWatchAgentAdminPolicy and AmazonEC2RoleforSSM)
  - Once the configuration file of agent is stored, we need to detach the policy from EC2 instance.
  - For security reason, only one EC2 instance needs to be attached with agent configuration role
    policy.

### CloudWatch Logs - S3 Export:

CloudWatch has a feature to directly send the logs to S3 bucket. However, S3 buckets should meet following requirements and
has certain limitations.

- S3 buckets must be encrypted with SSE-S3 or SSE-KMS.
- Logs can take up to 12 hours to become available for export.
- Logs export is not automated, we need to make an API call `CreateExportTask`.
- Not real-time or near real-time, use logs subscription instead.

### CLoudWatch Logs - Subscription:

CloudWatch logs can get subscription filter to filter the logs you want. This subscription filter can send data to many
different outputs such as:

- Subscription filter lambda function to send logs to ElasticSearch in real time.
- Or we can create a custom lambda function.
- Subscription filter with Kinesis Data Firehose to send logs to S3 in near real time.
- Subscription filter with Kinesis Data Firehose and from there to:
  - Kinesis Data Firehose
  - Kinesis Data Analytics
  - EC2 running KCL
  - Lambda

![Subscription filter for Multi-Account Multi-region CloudWatch Logs aggregation](https://cdn.hashnode.com/res/hashnode/image/upload/v1701069324947/222e2868-f06b-476f-83de-b2b8442570aa.png?auto=compress,format&format=webp)

![Subscription filter](https://cdn.hashnode.com/res/hashnode/image/upload/v1701074286418/d92009f5-3e89-40d0-856d-19886793c7b2.png?auto=compress,format&format=webp)

#### References:

To read more about CloudWatch Logs aggregation using subscription filter for multiple accounts/region. read this fantastic
[blog](https://blog.awsfundamentals.com/cloudwatch-logs-strategies-for-cross-account-and-cross-region-aggregation).

### AWS CloudWatch logs sources:
- SDK, CloudWatch Logs Agent, CLoudWatch Unified Agent.
- **Elastic Beanstalk:** Collection of logs from applications.
- **ECS:** Container logs
- **CloudWatch Logs Agent:** Example running on EC2 machine or on any on-premise VM.
- **VPC:** Collect VPC flow logs
- **Lambda:** Function logs.
- **CloudTrail:** Trails based on filter.
- **API Gateway logs**
- **Route53:** DNS Queries logs

## CloudWatch Insights

- They provide the ability to get more information from the data that CloudWatch is collecting.
- Three different types of Insights:

### Log Insights:

- This is a feature that can analyze logs that are collected by CloudWatch logs at scale in seconds using interactive query and deliver visualizations

### Container Insights:

- Allows you to collate and group different metric data from different container services and applications running on AWS. Example, EKS and ECS.
- It also monitors and captures diagnostic data which can be used to take necessary actions.
- This monitoring and insight data can be used to collect data at cluster, node, pod and task level.

### Lambda Insights:
- Feature to gain deeper understanding about the applications using AWS Lambda.
