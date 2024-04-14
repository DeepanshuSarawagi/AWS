# StepFunctions

## Introduction:

- Build serverless visual workflow to orchestrate your lambda functions.
- Represent flow as JSON state machine.
- **Features:**
  - Sequence
  - Parallel
  - Conditions
  - Error handling
  - Timeouts
- Maximum execution time of 1 year.
- Possibility to include human approval feature.
- When chaining the lambda functions to a state machine, be mindful of added latency to pass the calls.

## Step functions integrations:

### Optimized integrations:
- Invoke a lambda function.
- Run an AWS Batch job.
- Run ECS tasks and wait for it complete.
- Insert item into a DynamoDB table.
- Publish messages to SNS/SQS.
- Launch an EMR, Glue or SageMaker jobs.
- Launch another Step Function workflow.

### AWS SDK Integrations:

- Access 200+ AWS services from your State Machines.
- Works like standard AWS SDK API call.

### Step Function Workflow Triggers:

You can invoke a Step Function workflow (State Machine) using:

- AWS Management console
- AWS SDK
- AWS CLI
- Lambda
- API Gateway
- EventBridge
- CodePipeline
- Step Functions

### Step Functions - Tasks

**Lambda Tasks:**
- Invoke a Lambda function

**Activity Tasks:**
- Activity worker (HTTP), EC2 Instances, mobile device, on premise DC
- They poll the Step functions service

**Service Tasks:**
- Connect to a supported AWS service
- Lambda function, ECS Task, Fargate, DynamoDB, Batch job, SNS topic, SQS queue

**Wait Task:**
- To wait for a duration or until a timestamp

Note: 

: Step Functions does not integrate natively with AWS Mechanical Turk


Refer to the following comparison table between Step Function [Standard vs Express Workflows](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-standard-vs-express.html)

## Express Workflow - Synchronous vs. Asynchronous:

| **Synchronous Workflow**                                                                  | **Asynchronous Workflow**                                              |
|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Wait till the workflow completes, then return the result                                  | Doesnt wait for the workflow to complete                               |
| invoked from Amazon API Gateway, AWS Lambda, or by using the StartSyncExecution API call. | To get the result, you must poll the service's CloudWatch Logs.        |
| **Examples:** Orchestrate microservices, handle errors, retries, parallel tasks           | **Example:** Workflows that dont require immediate response, messaging |

