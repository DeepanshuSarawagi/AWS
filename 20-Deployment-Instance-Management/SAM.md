# SAM - Serverless Application Model framework

## Introduction:

- Framework for developing and deploying serverless applications.
- All the configuration is done in YAML code:
  - Lambda Functions: `AWS::Serverless::Function`
  - DynamoDB tables: `AWS::Serverless::SimpleTable`
  - API Gateway: `AWS::Serverless::API`
  - Step Functions: `AWS::Serverless::StateMachine`
- SAM can use CodeDeploy to deploy lambda functions and uses the traffic shifting feature.
- SAM leverages the CloudFormation in the backend.

### Solution Architecture using SAM:

![SAM solution](https://d2908q01vomqb2.cloudfront.net/1b6453892473a467d07372d45eb05abc2031647a/2023/05/10/Screenshot-2023-05-10-at-12.41.31-PM.png)

[Blog reference](https://aws.amazon.com/blogs/compute/implementing-cross-account-cicd-with-aws-sam-for-container-based-lambda/)