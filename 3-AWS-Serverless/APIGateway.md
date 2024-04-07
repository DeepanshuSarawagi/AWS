# Brief document on API Gateway

- It is a serverless offering by AWS to create REST APIs.
- This is going to be public and accessible to clients.
- When the user hits the API Gateway, APIGW will proxy the requests to Lambda function.
- Support for WebSocket protocol which makes the API stateful.
- Handles versioning.
- Traffic management.
- Req/Resp transformations.
- Handle different environments
- Create API Keys, handle request throttling
- Swagger / Open API import to define APIs.
- Handle security (Authentication and Authorization)
- Generate SDK and API specifications
- Cache API responses

Limits to know:

: 29 seconds timeout. Meaning, if API gateway is proxying requests to lambda function and if the lambda function takes more than
29 seconds to process the request then API gateway is going to timeout.

: 10 MB of max payload size.


## API Gateway Integrations:
- Lambda Function
- HTTP
- AWS Service

## Endpoint Types:
- ### Edge Optimized: (For Global clients)
  - Requests are routed through CloudFront Edge Locations
  - The API Gateway still lives in only one region

- ### Regional:
  - For clients within the same region.
  - Can be combined with CloudFront distribution (More control over the caching strategies and distributions)

- ### Private:
  - Can be accessible only from your VPC using an Interface Endpoint.

## API Gateway - Deployment stages:
- API Gateway are deployed to `Stages`.
- Use the naming you like for stages - (Dev, Test, Prod)
- Stages can be rolled back as history of deployments are kept.

## Caching API responses:
- You can cache API responses from your API Gateway.
- Caches reduces the number of calls made to the backend. 
- Default TTL of 300 seconds and max, 3600s.
- Possible to overwrite cache settings `per method (GET/PUT/POST)`
- Clients can invalidate the cache with Headers `Cache-Control: max-age=0` but with proper IAM credentials.
- Able to flush the entire cache immediately.
- Cache encryption option.
- Capacity between 0.5GB to 237GB.

## API Gateway - Security:

- Load SSL certificate and create CNAME record in Route53.
- Resource policy:
  - Define who can access the API.
  - Users from AWS Accounts, IP/CIDR ranges, VPC or VPC endpoints.
- IAM execution roles for API Gateway at API level.
- CORS - Cross Origin Resource Sharing
  - Control which domain can call your API.
  - Browser based security.

## API Gateway - Authentication:

### IAM based access:
- Good for providing access within your infrastructure.
- Pass IAM credentials in Headers through SigV4.

### Lambda Authorizer:
- Use lambda to verify custom OAuth/SAML/3rd party authentication.
- The lambda function would still need to be programmed.

### Cognito user pools:
- Client authenticates with Cognito.
- Client passes the token to API Gateway.
- API Gateway then verifies the token with the help of its deep integration with Cognito.

## Logging, Monitoring, Tracing:

### CloudWatch Logs:
- Enable CW logging at stage level.
- Can send API Gateway access logs.
- Can log full requests / responses data.
- Can send logs directly into Kinesis Data Firehose.

### CloudWatch Metrics:
- Metrics are by stage, possibility to log detailed metrics.
- Following metrics are integrated:
  - `IntegrationLatency, Latency, CacheHitCount, CacheMissCount`

### X-Ray:
- Enable tracing to get extra information about requests in API Gateway.
- X-Ray API Gateway + AWS Lambda gives you the full picture.