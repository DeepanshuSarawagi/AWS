# Basic document on Amazon ECS

### Amazon ECS on EC2 launch type:
-  ECS is Elastic Container Service for managing Docker Containers
-  Launch Docker containers = Launch ECS tasks on EC2 instances
-  EC2 launch type: You must provision and maintain the EC2 instances.
-  Each EC2 instance must run the ECS agent to register with ECS Cluster.
-  AWS takes care of stopping and starting the containers.

### Amazon ECS - Fargate Launch Type:
-  You dont have to manage the EC2 instances to launch docker containers.
-  It is all serverless.
-  You just create the task definitions.
-  AWS just runs ECS tasks based on the RAM/CPU we need.
- To scale, just increase the number of tasks. Fargate will take care of the compute requirement.

### Amazon ECS - IAM Roles:
**EC2 Instance Profile (EC2 Instance launch type only):**
-  Used by the ECS agent
-  Makes API calls to ECS Service.
-  Sends container logs to CloudWatch.
-  Pull docker images from ECR (Elastic Container Registry)
-  Retrieve sensitive data from Secrets Manager or from SSM Parameter Store.

**ECS Task Role:**
-  Allows each task to have a role.
-  Use different roles for the different ECS services you run.
-  Task role is defined in the task definition.

### Amazon ECS Data Volumes:
-  Mount EFS on ECS tasks.
-  Works on both EC2 and Fargate launch types.
-  Tasks running in any AZ will share the same data using EFS.
-  AWS Fargate + EFS = Serverless.
-  S3 cannot be mounted as a file system on your ECS tasks.

### ECS Service Auto Scaling:
-  Automatically increase/decrease the desired number of ECS tasks.
-  It uses the ECS Application Auto Scaling.
- Scaling event can be performed based on the following metrics:
  - ECS Service Avg. CPU Utilization
  - ECS Service Avg. Memory Utilization
  - ALB Request Count per Target - Request coming from ALB

- Target tracking
- Step scaling based on CloudWatch Alarm
- Scheduled Scaling - Based on a specific date/time
- ECS Service Auto Scaling (ask level) is not equal to EC2 Scaling at EC2 instance level.

### EC2 Launch Type: Auto Scaling underlying EC2 instances:
- Auto Scaling Group Scaling: Scale your ASG based on CPU Utilization or add EC2 instances over time
- EC2 Cluster Capacity Provider:
  - Used to automatically scale the infrastructure for your ECS tasks.
  - It is paired with ASG.
  - Add EC2 instances when you are missing capacity

ECS tasks can be invoked by EventBridge

### Amazon ECR:
-  Store and manage docker images in ECR.
- Provides both private and public repository.
- Backed by S3.

### ECS - ALB Integration:

- We get dynamic port mapping.
- Allow you to run multiple instances of same application on same EC2 instances.
- The ALB finds the right port on your EC2 instance.

### Amazon EC2 - Security and Networking:

- You can just inject secrets and configurations as env variables into running docker containers.
  - Deep integration with Secrets Manager and SSM Parameter store.
- **ECS tasks networking:**
  - none: No network bridge, no port mapping.
  - bridge: Uses docker's virtual container-based network.
  - host: Bypass docker network and uses underlying host network interface.
  - awsvpc:
    - Every task launched on the instance gets its own private IP and ENI.
    - Simplified networking, enhanced networking, security groups.
    - Default mode for Fargate tasks.