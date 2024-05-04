# AWS Trusted Advisor

## Introduction:

- Analyzes your AWS accounts and provides recommendations:
  - Cost Optimization
  - Security
  - Performance
  - Fault tolerance
  - Service limits
  - Operational excellence
- All customers have access to core checks and recommendations.
- Can enable weekly email notifications from console.
- Full Trusted Advisor only for business and enterprise support plans.
  - Ability to set CW Alarm when limits are reached.
  - Enables programmatic access to TrustedAdvisor API.
- Can check if S3 buckets are public.
  - But cannot check of the objects in the buckets are public.
  - Use EventBridge / S3 Events / AWS Config to check the compliance of objects.
- Service Limits can be monitored.