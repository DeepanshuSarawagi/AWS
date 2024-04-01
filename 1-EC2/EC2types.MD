# We have different types of EC2 instances

##  General Purpose
t2:micro
t: instance class
2: generation (AWS improves them over time)
micro: Instance size within the instance class

Great diversity of workloads such as web servers or code repositories
Balance between
  Compute
  Memory
  Networking
Eligible for free tier

## Compute Optimized
  Batch processing workloads
  Media Transcoding
  High performance webservers
  Scientific modeling and machine learning
  Dedicated webservers for gaming
  Naming convention: c5, c6, c6g

## Memory Optimized

Fast performance for workloads that process huge data sets using in-Memory (RAM)
  High performance, relational/non-relational databases
  Distributed web scale cache stores
  In-memory databases for Business Intelligence
  Applications performing real time processing of big unstructured data
Naming convention: R6g, R5a, R5b, R5n

## Storage Optimized

Great for Storage-incentive tasks that require high R/W operations to large data
sets in local memory
  High Frequency Online Transaction Processing System
  Relational and NoSQL databases
  Redis
  Data warehousing
  Naming convention: i3, D2, D3, H1

## General or Web app:
    
These are used for general web applications. Example, m5.xlarge, m6.xlarge.
