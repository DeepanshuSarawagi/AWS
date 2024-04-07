# Application Load Balancers

- Application Load Balancer operates at the application layer of the OSI model.
- The application layers serves as the interface to the user and the application processes to access the network services.
- Before setting up ALB, it is recommended to setup the target groups.
- This is a layer 7(HTTP) only load balancer.
- Load balancing to applications across machines using different target groups.
- Load balancing to multiple applications on same EC2 instance (ex. containers)
- Supports redirect from HTTP to HTTPS.
- Routing based on URI.
- Routing based on hostname in URL.
- Routing based on Query String, Headers
- ALB are a great for containers and micro-services application.
- Has a port mapping feature to redirect to a dynamic port in ECS.

- Target Groups:
  - A target group is a set a resources that you want your ELB to route requests to.
  - You can configure your ELB with a number of different target groups, each associated with different listener 
    configuration and associated rules.
    - EC2 instances which are managed by an ASG (Auto Scaling Group). 
    - ECS tasks.
    - Lambda functions.
    - IP addresses - and it must be a private IP address.