# EC2 basics
## Shared Tenancy:
  - EC2 instance is launched on any available host with the required resources.
  - AWS Security mechanisms prevent one EC2 instance accessing another in the same host.

## Dedicated instances:
  - Hosted on hardware that no customer can access.
  - Maybe required to meet compliance.
  - Dedicated instances incur additional charges.

## Dedicated Hosts:
  - Additional visibility and control on the physical hosts.
  - Allows to use the same host for any number of instances.
  - Maybe required to meet compliance.

## User Data:
  - User Data allows you to run the commands during the first boot cycle of the instance.

## Storage Types:
  - EC2 instances can have two types of storage.
    - Persistent Storage - Available by attaching the EBS (Elastic Block Storage) Volumes
    - Ephemeral Storage - Local storage

  ### EBS Volumes:
    - EBS volumes are separated from the EC2 instances. They are network attached storage devices.
    - These volumes are logically attached using AWS Network.
    - The data on EBS volumes are replicated on the other EBS volumes in the same availability Zone for data resiliency which is managed by AWS.
    - You can disconnect the EBS volume with the EC2 instance thereby maintaining the data.
    - We can take the backup of the EBS volumes and store it in S3.
    - We can implement backup encryption on the EBS volumes.

  ### Ephemeral Storage:
    - Physically attached to the underlying host.
    - When the instance is stopped or terminated, all the data is lost.

## Security:
  - Security group - We will be asked to select a security group for that instance.
  - Instance level firewall by specifying both Ingress and Egress level traffic thereby controlling both incoming and outgoing traffic on EC2 instance.
  - We will also be asked to create a new Key-Pair which allows us to SSH into the instances.
