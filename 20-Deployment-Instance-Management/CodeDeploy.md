# AWS CodeDeploy

## Introduction:

- We want to deploy our applications automatically to many EC2 instances.
- These instances are not managed by Elastic beanstalk.
- We can use the managed service to perform automatic code deploys.
  - It integrates very seamlessly with EC2, ECs, Lambda and ASG.
- Deploy how to deploy application using `appsec.yaml` and deployment strategy.
- We can use hooks to verify the deployment after each deployment phase.

## Code Deploy to ASGs:

### In-place updates:

- Updates existing EC2 instances.
- Instances newly created by ASG also gets automated deployments as part of `CodeDeploy`.

### Blue/Green deployments:

- A new ASG is created with same settings.
- All the new instances as part of this ASG will get automated deployments.
- Choose how long to keep the old ASGs.
- Must be using ELB to route traffic to both old and new ASG.

## CodeDeploy to Lambda:

- Uses traffic shifting feature of lambda alias.
- Pre- and post-traffic shift features can be used to validate deployments.
- Easy and autoomated rollbacks using CloudWatch ALARMS.
- Serverless Application Model (SAM) framework natively uses CodeDeploy.

## CodeDeploy to ECS:

- Support for Blue/Green deployment using ECS and Fargate.
- Setup is done within the ECS service definition.
- A new task set is created and traffic is re-routed to new task set.
- If everything is table for X minutes then old task set is terminated.
- Support Canary deployments (`Canary10Percent5Minutes`).