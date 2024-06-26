# Brief document on AWS HSM service

- HSM stands for Hardware Security Module.
- A physical tamper resistant hardware appliance that is used to protect and safeguard cryptographic
  materials and encryption keys.
- CloudHSM is a physical device and is not a multi-tenant device i.e., that is not shared with
  any other customer.
- Following operations are performed using Cloud HSM service:
  - Creation, storage and management of cryptographic keys.
  - The ability to use cryptographic hash functions - HMACs - Hash Based Message Authentication Codes.
  - Cryptographic data signing and signature verification.
  - Ability to generate cryptographically secure data.
  - **Asymmetric encryption:**
    - A public and private key is used to encrypt and decrypt the data.
    - Private key is not shared with the client.
    - Common algorithms are RSA, DSA.
  - **Symmetric Encryption:**
    - Same key to encrypt and decrypt the data.
    - The key must be sent securely between the two parties.
    - Commonly used symmetric cryptographic algorithms are AES, DES, Triple DES, Blowfish

## Architecture and components of CloudHSM

- To implement CloudHSM, we need to create a cluster.
- This cluster is a grouping of different HSMs together which will act as a single unit when configured
  and deployed.
- Having multiple HSMs provides high availability as you are able to select multiple different
  subnet one from each AZ that your VPC operates in.
- Any requests to your CloudHSM cluster will load balance automatically between different
  HSM clusters.
- When HSM is deployed, a HSM ENI is placed in the VPC you select within your subnet.
- HSM itself resides in a AWS owned VPC and is located in the same AZ.
- When a HSM is deployed, a new service-linked role will be created AWSServiceRoleForCloudHSM.
- This will add the permission to send log data to CloudWatch logs.
- CloudHSM will also create a new security group for the HSM cluster. This will decide which
  resources can communicate with the HSM cluster.
- The security group itself will allow both inbound and outbound connectivity on port 2223-2225.
- Once the cluster is created, it will be in uninitialized state.
- From here on, we can create HSMs in each availability zone and initialize the cluster.
- Once the cluster is initialized, you can then connect to the cluster network interfaces
  and it can be done by an EC2 instance provisioned in the same VPC.
- Following is a 2-step process is required for your cluster to communicate with CloudHSM ENIs.
  - configure a security group.
    Firstly we must add the EC2 instance to the CloudHSM security group which got created earlier
    while creating cluster.
  - Install the CloudHSM client software on the EC2 instance.

## Using HSM as a custom keystore in KMS

- HSM cluster can be used to maintain the security and control of key material created for CMKs.
- The key material is a resource managed within your KMS, however, it allows you to store it
  within your CloudHSM cluster.
- CMKs created from your custom key store are 256 bit Non-exportable AES Symmetric key which
  never leaves the HSM unencrypted.
- All cryptographic operations made with the CMK happens within the HSM cluster.
- Each HSM Cluster can only be associated with one custom key store for KMS and must be within the
  same region.
- As a part of the process to create the custom key store, you must upload the trust anchor certificate
  for the cluster to the KMS and this certificate is generated when cluster is first initialized.
- Also we must create a dedicated crypto user called kmsuser without MFA enabled.

## SSL offloading using CloudHSM:

CloudHSMM can be used for SSL offloading. The cloudHSM device at the backend will be the one performing SSL acceleration.
The benefit of using this solution is that the SSL private key will never your CloudHSM device.

To make this work, one must setup the Cryptographic User (CU) on the device and have EC2 instance use that user for all operations.