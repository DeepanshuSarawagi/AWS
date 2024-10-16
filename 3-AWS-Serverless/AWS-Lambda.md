# Basics of AWS Lambda

## Introduction:

- It is the serverless compute service that allows you to run the code without having to create the EC2 instance.
- The responsibility to maintain and administer the Ec2 instances is passed over
  to the AWS to manage for you.
- You can execute functions for maximum of 15 minutes.
- Scaling is on-demand and automatic.
- AWS Lambda charges compute power 100ms per use in addition to the number of
  times your code runs.
- Lambda Container Image - Lambda's own container and it has its own Lambda Runtime API.

### AWS Lambda theory working
- Upload the code to Lambda
- Configure your Lambda function to execute upon specific triggers from the supported events
- Once the specific trigger is initiated, Lambda will run the code as per your
- Lambda function using only the required compute power as defined.
- Lambda will then calculate the compute time in milliseconds to ascertain the
  cost of the service.

### Components of AWS Lambda: 
- A Lambda function is compiled of your own code that you want Lambda to invoke.
- Events sources are AWS services that can be used to trigger your Lambda functions.
- Downstream resources are the resources that are required during the execution of your Lambda function.
- Log Streams helps to identify and troubleshoot issues that occur within your Lambda function.

### Permissions of package
- It is essential to have correct permissions when uploading the package to AWS Lambda
- The file should have global read permissions and directory should have 755 permissions
- If right permissions aren't set then the AWS Lambda function would fail.

### Capacity
- AWS Lambda now supports 10GB of memory required to execute the AWS Lambda function.
- Timeout - Determines how long the function should before it terminates.

### Network
- By default, the AWS Lambda function are only allowed to access resources that are accessible over the internet i.e., 
  Amazon S3. If you want your function to access any resources within your VPC, then we need to configure it.
- When configured, AWS Lambda then assigns a ENI to your resources using a private IP address.
- It is important to note that when using this configuration removes the default ability of using the resources over the public internet.
- To overcome this situation you must attach your function to a private subnet which has access to a NAT instance or Gateway.
- The execution role of your Lambda function will need to have specific permissions that will allow to operate within your VPC.
  - ec2:CreateNetworkInterface
  - ec2:DescribeNetworkInterfaces
  - ec2:DeleteNetworkInterface

### DLQ Resource
- The Dead Letter Queue resource can be a SQS or SNS resource.
- In the event of function failing for one or more reasons, the event exception will be caught in this DLQ resource. 
- These exceptions will be then handled based on the invocation type.
- Invocation can be synchronous or asynchronous depending upon the event source itself.
- If the invocation is asynchronous then the Lambda would retry the event further two more time if a failure occurs.
- If you have a DLQ resource configured then the event payload will be sent to this DQL resource.
- Synchronous invocations do not automatically retry the failed executions of the functions.
- Enable Active Tracing - By enabling this option, it integrates the AWS X-Ray service to trace the event resources that invoked the AWS Lambda function.

### Concurrency
- It effectively measures how many functions can be run at the same time.
- By default, the unreserved account concurrency is set to 1000.
- This means we can have 1000 occurrences of Lambda functions running at once.

**Reserve Concurrency -** 
- Allows our function to run x number of parallel executions.
- This means that the specified function will have a reserved concurrent capacity, and it will be reduced from the unreserved account concurrency. 
- For example, if we set it to 150, then the account unreserved concurrency will be reduced to 850. 
- This further means that the particular Lambda function will have 150 concurrent executions, and the rest other 
  AWS Lambda functions will share the unreserved capacity.

### Auditing and Compliance
- AWS Cloudtrail can log this Lambda function's auditing, risk compliance, operational and governance purposes.

### Event sources
- An event source is an AWS service that produces the event that your Lambda function responds to by invoking it.
- **Poll Based Services**
  - Lambda polls the service looking for particular event and then invokes the function if a matching event is found. 
  - This type of service follows synchronous invocations.
- **Pushed Based Services**
  - Services using this push model publish events in addition to actually invoking your Lambda function.
  - Invocation types varies on types of service.

For detailed difference between different lambda invocation types, refer to this [developer guide](https://docs.aws.amazon.com/lambda/latest/operatorguide/invocation-modes.html)

An Event Source Mapping is the configuration that links your event source to the Lambda function.

### AWS CloudWatch monitors following metrics of your Lambda functions
- Invocations
- Errors
- DeadLetterErrors
- Duration
- Throttles
- IteratorAge
- ConcurrentExecutions
- UnreservedConcurrentExecutions
    
### Lambda Limits:
**Execution:**
 - Memory is 128MB to 10GB (Increments in 1MB)
   - CPU is linked to RAM
   - 2 vCPUs are allocated at 1.5 MB of RAM.
   - 6 vCPUs are allocated at 10 MB of RAM.
 - Maximum Execution Time - 15 minutes
 - Environment variables (4KB)
 - Disk capacity in the function container (/tmp) - 512MB
 - Concurrent Executions is 1000 - it can be increased
**Deployment:**
 - Deployment size (compressed zip): 50MB
 - Size of uncompressed deployments - code + dependencies - 250MB
 - Can use /tmp to load other files at startup
 - Environment variables - 4KB
 - Max container image of 10GB.
 - Invocation payload (request/response) - 6 MB (sync) and 256 KB (async)

### Lamda@edge:
- It is another type of synchronous invocation of Lambda.
- Written on Node.js or Python.
- Scales to 1000s requests/second.
- Runs at the nearest regional edge cache.
- VM-based isolation.
- Used to change CloudFront requests and responses:
  - **Viewer Requests:**
    - Perform customization after CloudFront receives a request from the user.
  - **Viewer Responses:**
    - Perform customization before CloudFront forwards the response to the user.
  - **Origin Requests:**
    - Perform customization after CloudFront forwards a request to the origin.
  - **Origin Responses:**
    - Perform customization after CloudFront receives the response from the origin.
- You can use the Lambda Function globally by using Lambda@Edge
- Deploy Lambda functions alongside CDN distribution
- Helps to build more responsive application.
- Customize the CDN content.

### AWS Lambda integrations:
- API Gateway
- DynamoDB
- Kinesis
- S3
- SNS
- SQS
- Amazon IoT
- Amazon Cognito
- Amazon EventBridge
- CloudWatch Logs

### Lambda and CodeDeploy:

- **CodeDeploy** can help you automate traffic shift to different lambda aliases.
- Feature is integrated with SAM framework.
- Can increase the traffic to new aliases of lambda function linearly:
  - grow traffic every n minutes to 100%.
  - Linear10PercentEvery3Minutes
  - Linear10PercentEvery10Minutes
- **Canary:**
  - Try x percent and then 100% to new alias.
  - Canary10Percent5Minutes
  - Canary10Percent30Minutes
- Can create Pre- and Post-traffic hooks to check Lambda health.