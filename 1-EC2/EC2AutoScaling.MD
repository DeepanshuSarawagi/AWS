# EC2 Auto scaling

Auto scaling is a mechanism that automatically allows you to increase or decrease
the resources to meet the demand off of the customer defined metrics and thresholds.


## Amazon EC2 Auto Scaling:
- This automatically scales the EC2 resources
- Infrastructure can elastically provision the required resources preventing your
  operations team from manually deploying and removing resources.
- Greater customer satisfaction
- Cost reduction.
- Spot fleet support.

## Amazon Auto Scaling:
  Allows us to scale the Amazon ECS, DynamoDB, Amazon Aurora.

## Components of EC2 Auto Scaling:
- Creation of launch configuration or launch template
  - These define how the Auto Scaling group builds new EC2 Instances
  - Which AMI, Instance Type to use.
  - Whether public IP address can be used.
  - Any user data on first boot.
  - What storage volume configuration to use.
  - What security groups to be used.
  - If you would like spot instances.
  - VPC information.
  - ELB information.
  - SSH-Keys information.
  - Min size/ Max Size/Initial Size.

  A launch template is a newer and advanced version of launch configuration.
  Being a template, you can build a standard configuration on how to build your
  instances using the auto scaling group.

  Launch Templates gives the ability of versioning.
  Can create parameter subsets (partial configuration for re-use and inheritance)
  Provision using both on-demand and spot instances or mix of them.

- Creation of Auto Scaling group
  - You can configure the Auto Scaling Group to determine the EC2 instances' health based on Application
  - Load Balancer Health Checks instead of EC2 Status Checks (default). 
  - When an EC2 instance fails the ALB Health Checks, it is marked unhealthy and will be terminated
    while the ASG launches a new EC2 instance.

## Auto Scaling Group - Dynamic Scaling Policies:
- **Target Tracking Scaling**
  - Most simple and easy to setup
  - Example: If we want the average ASG group CPU utilization to be at 40%
  - These are the metrics you can monitor using Target Tracking Policy:
    - Average CPU Utilization
    - Average Network In / Average Network Out
    - Application Load Balancer request count per target
- **Simple / Step scaling:**
  - When a CloudWatch Alarm is triggered, example: CPU > 70% then add 2 EC2 instances.
  - When a CloudWatch Alarm is triggered, example: CPU <= 30% then remove 1 EC2 instance.
- **Scheduled Actions:**
  - Anticipate a scaling based on a known usage pattern
  - Example: Increase the minimum capacity to 10 at Fridays 5 PM.

## Auto Scaling Group - Predictive Scaling:
  - Continuously forecast load, and then Schedule scaling ahead.

## Auto Scaling Group: Scaling cooldowns:
- After a scaling activity happens, you are in a cooldown period (default 300 seconds)
- During this period, the ASG will not launch or terminate additional instances
  (to allow the metrics to stabilize after scaling activity)
- Use a ready to use AMI to reduce configuration time to serve reuests faster and
  reduce the cooldown period.

## ASG Default termination policy:
- If the scale-in event is triggered, ASG will find which AZ has most number of instances.
- If multiple instances are running in AZ, then ASG deletes the one with older launch
  configuration.
- ASG tries to balances the number of instances across all AZs.

## ASG Lifecyle Hooks:
- By default as soon as an instance is launched, in ASG its in service.
- We get the ability to perform extra steps before an instance goes into service. (Pending state)
- This is called as Lifecyle hook.
- We also get the ability to perform additional steps before instance is terminated. (Terminating state)

## Auto Scaling - Instance refresh:

- Helps to update the EC2 instances whenever a new launch template is created.
- For this we can use the native feature of instance refresh.
- We need to set the minimum healthy percentage:
  - This way the StartInstanceRefresh API call does not terminate all EC2 instance at once.
- Specify the warm-up time; which is after how long the EC2 is ready to be in use.
- 

## Exam Tip:
  - Amazon EC2 Auto Scaling chooses the policy that provides the largest capacity, so policy with the custom metric is
    triggered, and two new instances will be launched by the ASG