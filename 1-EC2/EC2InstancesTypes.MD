# Different types of EC2 instances

On-Demand instances:
  Short workload, predictable pricing

## Reserved Instance: (Minimum 1 year)
- Reserved Instances: Long Workloads
- Purchased for a set period of time for reduced cost
- **Convertible Reserved Instances:** Long workloads with flexible instances.
  - We can change the instance type. For e.g., from t2.micro to t2.large
- Scheduled Reserved Instances: Example, instance is required on every Thursday between 3PM and 6 PM
- Spot Instances: Short workloads, cheap and less reliable (Can lose instances)
- Dedicated hosts: Book and entire physical server, control instance placement

## EC2 On Demand:
- Pay for what you use.
- Linux - Billing per second after first minute.
- Other OS - Billing per hour
- has the highest cost but no upfront payment
- Recommended for short-term and uninterrupted workloads, where you cant predict how the application will behave.
- Capacity reservations allow us to reserve capacity based on different attributes such as
  instance type, platform, tenancy within a particular availability zone for any period of time.

## EC2 Reserved Instance:
- Upto 75% discount compared to On-Demand.
- Reservation period is 1-3 years.
- Maximum discount if an instance is reserved for 3 years.
- Payment options - No upfront, partial upfront and full upfront (again max discount)
- Reserve a specific instance type
- Steady state usage application - database application

**Convertible Reserved Instance:**

- Can change the EC2 instance type based on the requirement
- Upto 66% discount

**Scheduled Reserved Instance:**

- Runs only on a particular period.
- Even if we didn't use the instance, we will be charged.

## EC2 Spot Instance:
- Maximum discount upto 90% compared to on-demand.
- However, least reliable since you may end up losing the instance if the max price is less than the current spot price.
- Spot price is set by AWS and fluctuates based on demand and flow.
- Bid for large EC2 instances for a low cost.
- The MOST cost-efficient instances in AWS.
- If the current spot price goes more than your max price, then you can either choose to stop or terminate the EC2 instance
  with the grace period of two minutes.
- Use for workloads that are resilient to failures.
  - Batch jobs
  - Image Processing
  - Data Analysis
  - Any distributed Workloads

## EC2 Dedicated Hosts:
- An Amazon EC2 dedicated host is a physical server with EC2 instance fully dedicated to your use.
- Can help you address Compliance Requirements
- Allows to use existing Server Bound software licenses
- Allocated for a 3 year Reservation
- Per host billing

## EC2 Dedicated Instance:
- Instances running on hardware that's dedicated to you
- May share hardware with other instances running in the same account
- No control over instance placement (Can move hardware after Stop/Start)
- Per instance billing

## EC2 Graviton:

- AWS Graviton processors deliver the best price performance.
- Supports many Linux OS, RedHat, SUSE, Amazon Linux 2 etc
- Not supported on windows instance type.
- Graviton2 - 40% better performance over 5th Gen X86 instances
- Graviton3 - Upto 3X better performance compared to Graviton2.
- Use cases:
  - App servers
  - Microservices
  - HPC
  - CPU based ML
  - Video encoding, Gaming
  - in-memory caches
