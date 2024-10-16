# Brief document on AWS Global Accelerator

## Introduction:

- Allows you to get TCP and UDP traffic from your end user clients to your applications
  faster, quicker and more reliably using the global endpoints and infrastructure/
- It uses two static Anycast IP addresses associated with a DNS name which is used a fixed
  source to gain access to your application.
- These IP addresses can be mapped to different multiple endpoints.
- Global Accelerator intelligently routes customer requests across the most
  optimized path.
- Proxying packets at the Edge location to the applications running in one or more AWS regions.
- **An ENA provides high speed performance for your instance whereas AWS Global
  Accelerator provides high speed performance from end client to your application.**
- Global Accelerator is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP, as well
  as for HTTP use cases that specifically require static IP addresses or deterministic, fast regional failover.

### How does Global Accelerator work?
- 2 Anycast IP are created for your application.
- The Anycast IP send traffic directly to Edge location.
- Then the Edge locations send traffic to your application.
- Works with following services:
  - EIP
  - EC2
  - ALB and NLB public or private
- Supports client IP preservation except for NLBs and EIPs.
- **Consistent Performance:**
  - Intelligent routing to lowest latency and fast regional failover.
  - Uses AWS internal network.
  - No issues with client cache because IP doesn't change.
- **Health checks:**
  - Performs health checks for your applications.
  - Provides faster failover with less than 1 minute.
  - Great for DR.
- **Security:**
  - Only 2 IPs needs to be whitelisted.
  - Protection against DDoS attacks.

## 4 steps to setup AWS Global Accelerator:
  - Create your global Accelerator by selecting 2 IP addresses.
  - Create a listener to receive and process incoming requests based on protocol
    and ports.
  - Associate a listener with an endpoint group. Each endpoint group is associated
    with a different region and within each group there are multiple endpoints.
  - Associate and register your endpoints for your applications. ALB, NLB, an EC2
    instance or an EIP.


## AWS Global Accelerator vs CloudFront Distribution:
- They both use AWS Global Network and Edge locations all around the world..
- They both are protected from DDoS attacks using AWS Shield.

### CloudFront:
  - Improves performance for both cacheable content (images and videos)
  - Dynamic content such as API delivery
  - Content is served at Edge Location (content is cached at edge location)

### AWS Global Accelerator:
  - Proxying packets at the Edge location to the applications running in one or more AWS regions.
  - Hence, Region is still serving the content instead of Edge Locations.
  - Improves performance for wide variety of applications over TCP or UDP.
  - Good for HTTP use cases that require static IP address.