# AWS Fault Injection Simulator

- A fully managed service for fault injection simulation on AWS workloads.
- Based on **Chaos Engineering** such as stressing an application by creating disruptive events.
  - Sudden increase in CPU or Memory
  - Abrupt termination of instances
  - Increase in workload.
- Helps you uncover hidden bugs and performance bottlenecks.
- Supports following AWS services:
  - EC2
  - EKS
  - ECS
  - RDS
- Use pre-built templates that generate the desired disruptions.

![Example Architecture for FIS](https://d2908q01vomqb2.cloudfront.net/fc074d501302eb2b93e2554793fcaf50b3bf7291/2021/08/10/Fig1-arch.png)

### Reference docs:

[Blog reference](https://aws.amazon.com/blogs/architecture/chaos-testing-with-aws-fault-injection-simulator-and-aws-codepipeline/)