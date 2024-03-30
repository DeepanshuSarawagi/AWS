# AWS Certificate Manager

- To host public SSL certificates in AWS, you can
  - Buy your own and import them using CLI.
  - Have ACM provision and renew public SSL certificates
- ACM loads public SSL certificates on the following integrations:
  - Load Balancers (including the ones created by Elastic BeanStalk)
  - CloudFront distributions
  - APIs in API Gateways
- ACM is a regional service.
  - To use the global application, you need to issue and import SSL certificate in each region where your application is running.
  - You cannot copy certs across regions.