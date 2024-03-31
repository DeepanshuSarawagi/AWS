# Brief document on Amazon Inspector Service and Macie Service

- Automated Security Assessment
- For EC2 instances:
  - Leveraging the AWS SSM.
  - Analyze against unintended network accessibility.
  - Analyze the running OS against the known vulnerabilities.

- For ECS Containers:
  - For assessment of container images that are pushed to ECR.

- For lambda functions:
  - For software vulnerabilities in function code and package dependencies.
  - Assessment of functions as they are deployed.

- Reporting and Integration with AWS Security Hub.
- Send findings to Amazon EventBridge.

## Amazon Macie Service

- Fully managed data security and data privacy service that uses ML and matching pattern to discover and protect your
  sensitive data in AWS.
- Macie helps identify and alert PII (Personal Identifiable Information)
- Can be integrated with CloudWatch EventBridge and SNS for notifications.