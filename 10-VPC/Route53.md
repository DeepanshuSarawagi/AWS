# Brief document on AWS Route 53

- This is a DNS service by AWS.
- Provides secure and reliable routing of requests.
- Provides this service through its global network of authoritative DNS servers
  that reduce latency and can be managed via the console or API.
- Alias Records: Acts like a CNAME record allowing you to route your traffic to
  other AWS resources such as ELBs, VPC interface endpoints etc.
- Get support for DNSSEC.
  - A protocol for securing DNS traffic and verifies Data DNS integrity and origin.
  - Protects against MITM attacks.
  - Route53 supports both DNSSEC for Domain Registration and DNSSEC signing.
  - Works only with public hosted zone.
- 

## Hosted Zones:
  - Hosted Zones is a container that holds information about how you route traffic
    for a domain such a Google.com
  ### Public Hosted Zone:
  - This zone determines how traffic is routed on the internet and can be created
      when you register your domain with Route 53.
  - Target can be public IP of
    - EC2 instance
    - ALB
    - CloudFront distribution
    - S3 bucket
  ### Private Hosted Zone:
  - This zone determines how traffic is routed within your Amazon VPC. If your resources
    are not accessible outside of your VPC, you can use any domain name of your wish.
  - For private hosted zones, you must enable the following VPC settings:
    - `enableDnsHostnames`
    - `enableDnsSupport`

## Route 53 Records:
  Each record contains:
   - Domain/Sub-domain name: example.com
   - Record Type: A or AAAA or CNAME
   - Value: 12.34.56.78
   - Routing Policies: How Route53 responds to queries
   - TTL: The amount of time the record is cached at DNS servers.
     - Except for Alias records, TTL is mandatory for each DNS record.

## Route53 Record Types:
  - A: maps a hostname to IPV4
  - AAAA: Maps a hostname to IPv6
  - CNAME: maps a hostname to another hostname
      - The target is a hostname which must have an A or AAAA record.
      - Cant create a CNAME record for the top node of the DNS namespace (Zone apex)
  - NS: Name servers for the hosted zone.

## Route53 CNAME vs Alias:
  - CNAME only works for non-root domain.
  - Alias points a hostname to an AWS resource and it works for both root and non-root domains.
  - Alias is free of charge.
  - Alias record is always of type A/AAAA for AWS resources.
  - Alias Records can have following Record targets:
    - ELB
    - CloudFront Distribution
    - API Gateway
    - Elastic BeanStalk environments
    - S3 website
    - VPC Interface endpoints
    - Global Accelerator
    - Route53 record in the same hosted zone
    - You cannot set an Alias for EC2 DNS name.

## Domain Types:
  ### Generic Top-Level Domains:
  - TLDs are used to determine what information you can expect when you access a
    website. For eg; .watch domain can be used by websites related to streaming.
    .clothing domain can be used by fashion industry.

  ### Geographic Domains:
  - .com.au for Australia
  - .com.uk for United Kingdom

## Routing Policies:

### Simple routing policy:

- This is the default policy and is for single resource which performs a given function.
- Can specify multiple values in the same record.
- When Alias enabled, specify only one AWS resource.
- Can't be associated with health checks.

### Failover routing policy:
- This allows you to route traffic to different resources based on the resource health.
- It is mandatory to associate the health check with primary record and if resource is unhealthy then it will failover
  to secondary record.

### Geolocation routing policy:
- This lets you route traffic based on the geographic location of your users.
- Can be associated with health checks.
- You can also use geolocation routing to restrict the distribution of content to only the locations in which you
  have distribution rights.

### Geo-Proximity routing policy:
- This policy is based upon on the location of both your users and your resources.
- Ability to shift more traffic to resource based on defined bias.
- If you want a resource to receive more traffic then define the bias between 1 to 99
- If you want to shrink the resource traffic then bias has to be between -1 to -99
- Resources can be AWS and Non-AWS resources

### Latency routing policy:
- This is suitable when you have resources in multiple regions and want low latency.
- Redirect to the resource which has the lowest latency close to us.
- Latency is measured on traffic between users and AWS resources.
- Can be associated with health checks.

### Multivalue answer routing policy:
- This allows you to get a response from a DNS request from up to 8 records at once
  that are picked at random.
- Upto 8 healthy records are returned for a Multi-Value query.
- Multi-Value is not a substitute for having an ELB.
- Can be associated with health checks.

### IP based routing:
- Routing is based on client's IP address.
- You provide a list of CIDRs for your clients and the corresponding endpoints or location.
  - User-IP to endpoint mapping.
- optimize performance, reduce network cost.

### Weighted routing policy:
- This is suitable when you multiple resource records that perform the same function.
- DNS records must have the same name and type.
- Can be associated with health checks.
- Use cases: load balancing between regions or testing of a specific version of application.

## Route53 Health Checks:
- HTTP health checks for public resources
- It gives the ability for automated failover.
- Health checks that monitor an endpoint (AWS resources, application, servers)
- Health checks that monitor other health checks (Calculated Health Checks)
  - Monitor the combined health checks. Can monitor upto 256 child health checks.
  - You can specify how many health checks are passed for Parent health checks to pass.
- Health checks that monitor CloudWatch Alarms (throttles on DynamoDb, alarms on RDS, helpful on private resources)
  - Helpful in monitoring health check of private resources.
- Health checks monitor an endpoint:
  - Healthy/unhealthy threshold - 3 seconds
  - Interval - 30 sec (can be 10 sec at additional costs)
  - Upto 15 global health checkers
  - if > 18% health checkers report the endpoint healthy, then Route53 will mark it as healthy.
  - Health checks can also be setup for text based response upto 5120 bytes of text.
  - For health checks to be healthy, configure your routes/firewall to allow incoming requests from Route53 health
    checkers.

### Health checks - Private hosted zones:
- Route53 health checkers are outside the VPC.
- They can't access private endpoints.
- **So, how do we monitor the private endpoints or resources?**
  - Create a CloudWatch Metric of the private resource, create a CloudWatch alarm out of it.
  - Then create the healthcheck that checks the alarm itself.
