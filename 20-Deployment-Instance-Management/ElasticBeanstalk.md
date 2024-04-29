# Brief document on Elastic Beanstalk service

-  Elastic Beanstalk is a developer centric view of deploying applications on AWS.
-  It uses all components we have seen before: ASG, ELB, EC2, RDS. It is a wrapper around all these services.
- BeanStalk is going to be free but we have to pay for the underlying instances.
- It is a great service to re-platform your application running on-prem to AWS.
- Managed service.
  - Instance configuration / OS is handled by BeanStalk.
  - Deployment strategy is configurable by performed by BeanStalk.
- Just the application code is responsibility of the developer.

## Deployment strategies:

There are three kinds of deployment strategies:

- **Single instance deployment:** This is good for Dev.
- **LB + ASG:** This is recommended for pre-prod and prod environments.
- **ASG:** Great for non-web apps.

## Components:
- Application
- Application version
- Environment

- We can also use the Golden AMi to launch the EC2 instances which comes with prepackaged software installed.
- We just need to deploy the application.