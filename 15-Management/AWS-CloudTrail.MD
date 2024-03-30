# Brief document on working of AWS CloudTrail service

## Table of contents:

1. [Introduction](#1-introduction)
2. [CloudTrail Events](#2-cloudtrail-events)
   1. [Management Events](#2a-management-events)
   2. [Data Events](#2b-data-events)
   3. [Insight Events](#2c-insight-events)
3. [Components of CloudTrail](#3-components-of-cloudtrail)
4. [CloudTrail Process Flow](#4-cloudtrail-process-flow)
5. [Log file format](#5-log-file-format-and-bucket-format)
6. [Access to CloudTrail from secondary AWS account](#6-how-to-allow-users-from-secondary-aws-account-to-allow-ro-access-to-cloudtrail-logs-in-primary-aws-account-s3-bucket)
7. [Faster response to CloudTrail Events](#7-faster-response-to-cloudtrail-events)

## 1. Introduction:

- Records and tracks all API requests on your AWS account.
- Example: When an Auto scaling policy makes an API request to launch three new
  EC2 instances, CloudTrail records API requests made by Auto scaling policy and
  delivers the logs to AWS S3.
- Every API request captured is recorded as an Event.
- Multiple events are recorded within AWS CloudTrail logs.
- Events contain an associated metadata, such as
  Identity of the caller
  Timestamp of the request
  Source IP address
- New log files are created every 5 mins and are stored in S3.
- Log files are delivered to S3 Bucket 15 mins after the API was called.
- CloudTrail logs can also be delivered to CloudWatch logs for metrics monitoring
  and alerting via SNS.
- It is a global service which supports all regions.
- Effective for security analysis.
- Monitors restricted API calls.
- Resolve day-to-day operational issues
- We need to apply permissions to the S3 bucket allowing cross-account access for the CloudTrail
- CloudTrail will retain trail for 90 days. If you want to retain forever, you can send it to S3
  and use Athena to analyze.

## 2. CloudTrail Events:

 ### 2a. Management Events:
  - Operations that are performed on your AWS account.
  - By default, trails are configured to record Management events.
  - Can separate events from Read Event and Write Events.

 ### 2b. Data Events:
  - They are not recorded by default since they are high volume events.
  - Example, AWS S3 object level activity.
  - AWS Lambda function execution (InvokeAPI)
  - These two are the only services that are supported at the moment.

 ### 2c. Insight Events:
  - Enable CloudTrail Insights to detect unusual activity in your AWS account.
    - Inaccurate resource provisioning.
    - Hitting service limits.
    - Bursts of IAM actions.
    - Gaps in periodic maintenance activity.
  - CloudTrail Insights analyzes normal management events to create baseline.
  - And then continuously analyze write events to detect unusual pattern.

## 3. Components of CloudTrail

Trail:
- These are the building block of service.
- We can create many different trails containing different configurations related
  API requests.

S3:
- S3 is used by default to store the CloudTrail log files and a dedicated S3 bucket
  is required during the creation of new trail.
Logs:
- Logs are created by CloudTrail and records all events captured.
- A new log file is created approximately every five minutes and once processed it
  is delivered to a S3 bucket as defined by the Trail configuration.

KMS:
- The use of KMS is an optional element of CloudTrail.
- It adds additional encryption to the log files when stored in S3 bucket.

SNS:
- SNS is also an optional component in CloudTrail. It allows you to send notifications
  whenever a new log file delivered in S3 bucket.
- It can also be used in conjunction with CloudWatch when metric threshold has
  been reached.

CloudWatch Logs:
- This is also an optional component where we can configure to send logs to CloudWatch
  logs for additional metrics.

Event Selectors:
- Event Selectors allows you to add a level of customization to the type of API
  requests you want CloudTrail to capture.

Events:
- For every API requests that is captured by CloudTrail, it is recorded as an event
  in a CloudTrail log file.

API activity filters:
- These are the search filters can be applied against search API history in the
  management console for create, modify and delete API requests.
- These events are held in management console for seven days even if the Trail itself
  is stopped or deleted.

Tags:
- Allows you to add your own metadata about the CloudTrail.

## 4. CloudTrail Process Flow:
- Create Trail to let CloudTrail know which resources to be monitored for API requests.
- Create/Utilize S3 bucket to deliver the captured log files.
- Optionally encrypt the log files with KMS.
- Optionally configure the SNS for sending notifications whenever a log file is delivered.
- Optionally enable the log file validation to ensure log file is not delivered when
  delivered to S3.
- Post creation of Trail, we can configure the CloudWatch logs to deliver the CloudTrail
  logs to it for additional monitoring. This allows us to create additional Metrics
  against specific API requests
- Optionally configure the Event Selectors, this allows to configure the CloudTrail
  to capture specific events, or data.
- Optionally we can add Tags.
- As soon as API requests are captured based on the Trail configuration, we can
  use the Activity Filter to filter specific events quickly.

## 5. Log file format and bucket format:
- AccountID_CloudTrail_RegionName_YYYYDDTHHmmZ_UniqueString.FileNameFormat
- BucketName/prefix/AWSLogs/AccountID/CloudTrail/regionName/YYYY/MM/DD

## 6. How to allow users from secondary AWS account to allow RO access to CloudTrail logs in primary AWS account S3 bucket?
- Create a Role for secondary AWS ACCOUNT in the Primary AWS Account
- Attach a policy to the newly created role by allowing read only access to the specific bucket
- This policy will enable users from secondary AWS account to view S3 bucket (corresponding to their account) in priamry AWS account
- Assign a user in secondary AWS account new permissions to Assume Role in the primary AWS account (sts:AssumeRole)
- The sts:AssumeRole will have resource of primary AWS account with the Role we created to access S3 bucket.

## 7. Faster response to CloudTrail Events:

- Overall, CloudTrail may take up to 15 minutes to deliver events.
- EventBridge:
  - Can be triggered for any API call.
  - Fastest and the most reactive way.
- CloudTrail delivery in CloudWatch logs:
  - Events are streamed.
  - Can perform a metric filter to analyze and detect anomalies.
- Delivery in S3:
  - Events are delivered every 5 minutes.
  - Possibility of analyzing logs integrity, deliver cross account and provides long term storage.
