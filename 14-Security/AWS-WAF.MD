# Brief document on AWS Web Application Firewall service

- This is a service which prevents websites and web applications from being
  maliciously attacked on layer 7.
- Two flavours of AWS WAF:
  - AWS WAF New - Used for resources created after November 2019
  - AWS WAF Classic - Used for resources created before November 2019
- AWS WAF communicates with following services:
  - Amazon API Gateway
  - Cloudfront Distributions
  - Application Load Balancers
  - AWS AppSync GraphQL API
- AWS WAF helps in filtering HTTP and HTTPS requests.
- A user would initiate the request.
- The request will be received by the CloudFront distribution/ALB/API Gateway/AWS AppSync first.
- The request is forwarded to WAF Web ACL.
- The Web ACL would filter the incoming traffic based upon rules or rules groups.
  - Rules can include IP address, HTTP headers, HTTP Body or URI strings.
  - Protects from common attacks - (SQL injection attacks and Cross-Site-Scripting)
  - Size constraints - (Such as any request greater than 20 MB)
  - Rate based rules - to count occurrences of events.

## Understanding Rules and Rules Groups
- These rules are used to define the inspection criteria to determine whether the
  traffic can be allowed or blocked.
- Managed rule groups are set of rules preconfigured by AWS and AWS marketplace.
- Managed Rule groups allows us to protect the web application from set of vulnerabilities.
- Example for managed rule groups are by Fortinet (Threat information) and
  GeoGuard (Based on IP Fraud detection).
- When creating own set of Rules and Rule groups - We need to select one of the either
  options - Rules based on IP set, Rule Builder, Rule Group.
- To use IP set in Web ACLs, we need to first create IP set with set of IPs which we
  need to allow using WACL. The IP addresses should be in the form of CIDR ranges.
- When creating a Rule group based on Rule-Builder, we can create it using two
  options. Either using Rule Visual Editor or Rule JSON Editor.
- When using the Rule Visual Editor, we need to specify type if its Regular or Rate-Based.
- Rate based rules, count the number of requests over a 5-min period based on the
  source or Header IP address.
- When selected Rate based option, we asked to specify the maximum number of requests
  a IP address can send request over a 5 min timeframe. Rate limit must be between
  100 and 20,000,000.
- The only actions allowed on rate based requests are count or block.
- Rule Groups: We cant create rule groups from within Web ACL. it has to be created
  outside of it. Rule Group can be region specific or Global region.
- We need to specify the Rules and maximum capacity a rule can have measured in WCU.
- A web ACL can have a maximum of 1500 WCU.
- We also need to set the Rule priority. The Rules are executed in the order they
  are listed. The general priority should be Allow, Deny/Block and Bad Signatures.

## AWS WAF - Managed rules:

- Library of over 190 managed rules
- There are different kinds of rule groups:
  - Baseline rule group - general protection from common threats.
    - AWSManagedRulesCommonRuleSet, AWSManagedRulesAdminProtectionRuleSet
  - Use-case specific rule groups - Protection for many AWS WAF use cases
    - SQLiRuleSet, WindowsRuleSet, PHPRuleSet, WordPressRuleSet
  - IP Reputation rule groups - block requests based on source IP.
    - AWSManagedRulesAmazonIpReputationList, AWSManagedRulesAnonymousIpList
  - Bot control managed rule group - block and manage requests from Bots
    - AWSManagedRulesBotControlRuleSet

## AWS WAF - Web ACL - Logging:

- You can send WAF logs to:
  - Cloudwatch logs log group - 5 MB per second
  - S3 buckets with 5 minutes interval
  - Amazon Kinesis Data Firehose.

## Example Solution Architecture - Enhance CloudFront origin security with AWS WAF with AWS Secrets Manager:

**Use case:**

We have an application running on EC2 instances front ended with ALB. We want to allow incoming traffic only originated from
CloudFront. All other direct site access should be blocked/rejected.

**Solution:**

- Setup WAF with some Web ACLs on CloudFront level.
- On Amazon CloudFront create a custom HTTP Header with a secret string - `X-Origin-Verify:xxxxxxxx`. This will be added to every request that
  goes through CloudFront.
- Result of this, we can create WAF at ALB level and create a filtering rule.
  - This filtering rule will allow only traffic which has the above custom HTTP Header to route to ALB.
  - All other traffic will be blocked.
- We can then setup rotation of this secret string in http header to have maximum security using SecretsManager.
- The lambda function will rotate this secret string once in a while and update the AWS WAF at both CloudFront level
  and filter rule of WAF at ALB level.