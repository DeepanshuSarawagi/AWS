# Brief document on AWS Shield services

- AWS Shield has been designed to protect your infrastructure against Distributed
  Denial of Service attacks.
- The attack targets web host and it simultaneously receives a huge number of requests
  from multiple distributed sources.
- DDoS attacks prevents legitimate requests going through and it severely hinders the
  performance of the website/application at the same time.
-  Types of DDoS attacks:
  - SYN flood
  - DNS query flood
  - HTTP flood/Cache-busting

# AWS Shield Standard:
- Free to everyone
- Offers DDoS protection against Network layer and Transport layer.
- It can be integrated with CloudFront and Route53.

# AWS Shield Advanced:
- Offers protection against EC2, ELB, CloudFront, AWS Global Accelerator, Route53 with $3000 per month
- Enhanced level of DDoS protection
- View real-time metrics of any attacks against your resources.
- Protection from DDoS attacks against Network layer, Transport layer and Application
  layer.
- You must associate an EIP to your EC2 instance to protect it from DDoS attacks using
  AWS Shield.
- Protect against higher fees during usage spikes due to DDoS attacks.
