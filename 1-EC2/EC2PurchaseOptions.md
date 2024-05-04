# Different types of EC2 instances

## On-Demand instances:

  Short workload, predictable pricing

## Reserved Instance: (Minimum 1 year)

* Reserved Instances: Long Workloads
* Purchases for a set period of time for reduced cost
* Convertible Reserved Instances: Long workloads with flexible instances
* (We can change the instance type. For e.g., from t2.micro to t2.large)
* Scheduled Reserved Instances: Example, instance is required on every Thursday between 3PM and 6 PM
* Spot Instances: Short workloads, cheap and less reliable (Can lose instances)
* Dedicated hosts: Book and entire physical server, control instance placement

## EC2 On Demand:

* Pay for what you use.
* Linux - Billing per second after first minute.
* Other OS - Billing per hour
* has the highest cost but no upfront payment
* Recommended for short-term and uninterrupted workloads, where you cant predict
* how the application will behave.
* Capacity reservations allows us to reserve capacity based on different attributes such as
* instance type, platform, tenancy within a particular availability zone for any period of time.

## EC2 Reserved Instance:

* Upto 75% discount compared to On-Demand.
* Reservation period is 1 or 3 years.
* Maximum discount if an instance is reserved for 3 years.
* Payment options - No upfront, partial upfront and full upfront (again max discount)
* Reserve a specific instance type
* Steady state usage application - database application

### Convertible Reserved Instance:

- Can change the EC2 instance type based on the requirement
- Upto 66% discount

  **Scheduled Reserved Instance:**
    - Runs only on a particular period.
    - Even if we didn't use the instance, we will be charged.

### EC2 Savings Plans:

* Commitment to amount of usage and long workloads
* Savings plans range from 1-3 years.
* Locked to a specific family of instances and region.
* Maximum discount upto 72%.

### Compute savings plan:

- Upto 66% discount, same as convertible reserved instances.
- Ability between instance family, region, compute type, OS and family.

### Capacity Reservations:
* Reserve capacity in specific AZ for any duration.
* You have to pay for the duration regardless of whether you use it or not.
* Manual or planned end-date for the reservation.
* Capacity reservation is immediate, you get billed as soon as it starts.
* Combined with reserved instances and savings plan for cost benefits.

### EC2 Spot Instance:
* Maximum discount upto 90%
* However, least reliable since you may end up losing the instance if the max price
* is less than the current spot price.
* Spot price is set by AWS and fluctuates based on demand and flow.
* Bid for large EC2 instances for a low cost.
* The MOST cost-efficient instances in AWS.
* Use for workloads that are resilient to failures.
  - Batch jobs
  - Image Processing
  - Data Analysis
  - Any distributed Workloads

### EC2 Spot Fleets:
* Spot Fleets = set of spot instances + optional on-demand Instances.
* Set the maximum price you are willing to pay.
* The spot fleet will try to meet the target capacity with price constraints.
* Can have mix of instance types.
  - Target capacity for per spot fleet is 10,000 EC2 instances.
  - Target capacity for Spot fleet in a region is 100,000 EC2 instances.
- Define possible launch pools based on instance type, OS type, AZs.
- Can have multiple launch pools so that the fleet can choose.
- Spot fleet stops launching instances when reaching capacity or max cost.

**Strategies to allocate spot instances:**

- **lowestPrice:** From the pool with lowest price (Cost optimization and workload)
- **diversified:** Distributed across all pools; great work long workloads and availability.
- **capacityOptimized:** Pool with optimal capacity for number of instances.
- **priceCapacityOptimized: (Recommended)** Pools with highest capacity available then select pool with the lowest price.

### EC2 Dedicated Hosts:

* An Amazon EC2 dedicated host is a physical server with EC2 instance
* fully dedicated to your use.
* Can help you address Compliance Requirements
* Allows to use existing Server Bound software licenses
* Allocated for a 3 year Reservation
* Per host billing
* Most expensive option

### EC2 Dedicated Instance:

* instances running on hardware that's dedicated to you
* May share hardware with other instances running in the same account
* No control over instance placement (Can move hardware after Stop/Start)
* Per instance billing
