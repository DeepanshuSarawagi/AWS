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