# Centralized Budget Management and Cost Explorer

## AWS Budgets:

- Create budget and send alarms when costs exceeds the budget.
- 4 types of budgets: Usage, Cost, Reservation, Savings Plans For Reserved Instances (RI)
  - Track utilization
  - Supports EC2, ElastiCache, RDS, Redshift 
- Up to 5 SNS notifications per budget
- Can filter by: Service, Linked Account, Tag, Purchase Option, Instance Type, Region, Availability Zone, API Operation, etc...
- Same options as AWS Cost Explorer!
- 2 budgets are free, then $0.02/day/budget

### Budget Actions:

- Run actions on your behalf when a budget exceeds a certain cost or usage threshold
- Supports 3 action types:
  - Applying an IAM Policy to a user, group, or IAM role
  - Applying Service Control Policy (SCP) to an OU
  - Stop EC2 or RDS Instances
- Actions can be executed automatically or require a workflow approval process
- Reduces unintentional overspending in your account

## Centralized Budget Management:

Here is the solution architecture of centralized budget management.

![Centralized Budget Management](https://d2908q01vomqb2.cloudfront.net/972a67c48192728a34979d9a35164c1295401b71/2021/04/30/Picture5-6.png)

[Blog](https://aws.amazon.com/blogs/mt/manage-cost-overruns-part-1/) for reference.

## Decentralized Budget Management:

![Decentralized Budget Pattern](https://d2908q01vomqb2.cloudfront.net/972a67c48192728a34979d9a35164c1295401b71/2021/05/03/Picture2_1.png)

[Decentralized Budget pattern blog](https://aws.amazon.com/blogs/mt/manage-cost-overruns-part-2/)