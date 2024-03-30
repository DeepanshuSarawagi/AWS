# Brief document on AWS KMS service

## Table of contents:

1. [Data Encryption](#1-data-encryption)
2. [KMS](#2-kms)
   1. [KMS Key types](#2a-kms---key-types)
   2. [KMS Key origin](#2b-kms-key-material-origin)
3. [Key Components](#3-key-components-of-kms)
4. [Data Encryption Keys](#4-data-encryption-keys)
5. [S3 SSe-KMS](#5-s3-sse-kms)
   1. [Encryption Process](#5a-encryption-process)
   2. [Decryption Process](#5b-decryption-process)
6. [Key policies](#6-key-policies)
7. [Grants](#7-grants)

## 1. Data Encryption:
- Information is altered rendering plain text data unreadable through mathematical algorithms and encryption keys.
- An encryption key is required to revert the text to plain text.
- This encryption is categorized into two types:
  - Symmetric cryptography:
  
    A single key is used to both encrypt and decrypt the data.
    If the data was read by a different person then the key has to be shared with that person to decrypt the data.
    If the key is intercepted is during the transmission, then the data can be compromised.

  - Asymmetric cryptography:
  
    Two separate keys are used. One to encrypt the data and the other to decrypt the data.
    Both the keys are created at the same time.
    Private keys should be kept by a party and should never be shared.
    Public keys can be shared with anyone.
    Both the private and public key is required to decrypt the data.


## 2. KMS:
- KMS is a managed service used to store and generate encryption keys that are used by other AWS services
  and applications.
- The KMS service is for encryption at rest only.
- KMS works with CloudTrail to audit and track how your encryption keys are being used and by whom.
- It is a region specific service.
- Seamless integration with other services such as:
  - S3
  - RDS
  - SSM
  - EBS
  - RedShift

### 2a. KMS - Key types:

**Symmetric Keys: (AES 256 keys)**

- First offering of KMS, single encryption key is used to encrypt and decrypt.
- AWS Services that are integrated with KMS use Symmetric KMS keys.
- Necessary for envelope encryption.
- You never get access to KMS key unencrypted.

**Asymmetric Keys: (RSA and ECC key pair)**

- Public (Encrypt) and Private key (Decrypt) pair.
- Used for sign/verify operation.
- Public key is downloadable, however, we can't access the private key.
- Use case: For AWS users who cant perform encryption using KMS Encrypt API calls.

### 2b. KMS Key material origin:

Identifies the source of the key material KMS key.

Can't be changed once it is created.

#### KMS (AWS_KMS) default:
- AWS KMS creates and manages the key material in its own key store.

#### External (EXTERNAL):
- You import the key material into the KMS key.
- You are responsible for securing and managing this key material outside of AWS.

#### Custom key store (AWS_CLOUDHSM):
- AWS KMS creates the KMS key material in the CloudHSM cluster.

## 3. Key components of KMS:

Customer Master Key:
- This is the main key type within KMS.
- This can encrypt data upto 4KB in size.
- It is typically used in relation to your Data Encryption Keys (DEKs).
- The CMK can generate, encrypt and decrypt these DEKs.
- There are two types of CMKs:
  - **AWS Managed CMKs:**
    - These are used by other AWS services that interact with KMS to encrypt the data.
    - They can only be used by the service that created them within a particular region.
    - They are created on the first time that you implement encryption using that service.
  - **Customer managed CMKs:**
    - These provide the ability to implement greater flexibility.
    - You can perform rotation, governing access and key policy configuration.
    - You are able to enable and disable the key when it is no longer required.
    - AWS services can also be configured to use your own customer CMKs.

## 4. Data Encryption Keys:
- DEKs are created by CMKs and are used to encrypt data of any size.
- Whenever a request to generate a key is issued, the CMK specified in the request will create a plain text
  data encryption key and an encrypted version of same plain text data encryption key.
- Both of these are then used to complete the encryption process.
- As a part of this process, your plain text data is encrypted using plain text data encryption key.
- Once encrypted, plain text data is deleted from the memory and the encrypted data key
  is stored along side the encrypted data key.
- This process of one key having encrypted by another key is called as envelope encryption.
- Even if the encrypted data along with encrypted key is compromised, the outsider will not
  be able to decrypt it since the key was encrypted by the CMK which remains within the
  KMS service.
- The only way you will be able to decrypt the object is if you have the relevant decrypt
  permission for that CMK that the data keys are associated to.

## 5. S3 SSE-KMS:

### 5a. Encryption Process:
- User stores the object in S3 bucket with SSE-KMS enabled.
- When the object is uploaded, the S3 invokes the KMS to generate the data keys.
- At this point, the KMS then uses the CMK to generate two keys.
- The first key is the plain text data key and the second key is the encrypted version
  of the plain text data key.
- Both these keys are sent back to S3 to encrypt the object.
- S3 will then encrypt the object using the plain text data key using an encryption algorithm.
- This will then generate the encrypted version of uploaded object in S3.
- S3 will now store the encrypted version of the object alongside its encrypted data key.
- Post encryption of data, the plain text data key is deleted from the memory.

### 5b. Decryption Process:
- The user will request the object from S3.
- At this point, S3 knows that the data is encrypted and it has the associated encrypted
  data key with it.
- S3 sends the encryption data key to KMS requesting to generate the plain text data key.
- KMS uses the encrypted data key using CMK to generate the plain text data key.
- Once the plain text data key is generated, it is then sent back to S3.
- S3 then accesses the encrypted object, then uses the plain text data key and performs
  encryption algorithm to decrypt the object.
- The decrypted object is then sent back to user to access it.
- S3 deletes the plain text data key from its memory.

## 6. Key Policies:
- The key policies allow you to define who can use and access a key in the KMS.
- These key polices are tied to the CMK which makes them resource based policies.
- Different key policies can be created for each CMK.

## 7. Grants:
- Grants are another method of controlling access and use of the CMKs held within KMS.
- They are again resource based policies that allow you to delegate a subset of your own
  access to a CMK for principals such as another AWS service within your AWS account.
- Benefit of this is there is less risk of someone altering the access control permissions
  for that CMK.
- If anyone has the KMS put key policy permission, they could simply replace the existing
  policy with different one.
- Using Grants eliminates this possibility of anyone using this permission kms:putKeyPolicy
  as a grant is created and applied to the CMK for each principal requiring access.
