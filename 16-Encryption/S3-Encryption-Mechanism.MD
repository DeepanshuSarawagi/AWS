# Overview of S3 Encryption mechanism

## Server Side Encryption with S3 managed keys (SSE-S3):
- Requires minimal configuration
- Management of encryption keys managed by AWS
- We just need to upload the data and S3 will handle the encryption for us.
- **Encryption process:**
  - Client uploads object data to S3.
  - S3 then encrypts this data with plain text S3 data key.
  - This creates an encrypted version of the object data.
  - Next, the S3 Plain text data key is then encrypted with S3 master key.
  - This creates an encrypted version of S3 Plain text data key which is then stored in S3.
  - S3 Plain text data key is then deleted from the memory.
- **Decryption process:**
  - Request is made by the client to retrieve the object data.
  - S3 takes the encrypted S3 Data key and decrypts it with S3 Master key.
  - This S3 Plain text data key is then used to decrypt the object data and sent back to client.

## Server Side Encryption with KMS managed keys (SSE-KMS):
- Allows S3 to use KMS to generate data encryption keys.
- Gives greater flexibility of key management: disable, rotation and access policies to CMKs.
- **Encryption Process:**
  - Client uploads object data to S3.
  - S3 then requests data-keys from KMS' CMK.
  - Using the specified CMK, KMS then generates two data keys, a plain text data key and
    an encrypted version of plain text data key.
  - These two keys are then sent back to S3 for encryption of Object data.
  - S3 performs the encryption of object data using the plain text data key.
  - This creates an encrypted version of object data which is then stored in S3 along with
    encrypted data key.
  - The plain text data key is then removed from the memory.
- **Decryption Process:**
  - Request is made by the client to retrieve the object data.
  - S3 sends the associated encrypted data key of the Object data to KMS.
  - KMS then uses the correct CMK to decrypt it and creates a plain text data key.
  - This plain text data key is then sent back to S3.
  - S3 decrypts the data using this Plain text data key.
  - The decrypted object data is then sent back to the user/client who requested it.

## Server Side Encryption with Customer provided keys (SSE-C):
- Gives you the opportunity to provide your own master key.
- Your customer provided key would be sent with data to S3 and S3 would perform the
  encryption of your data for you.
- **Encryption Process:**
  - Client uploads object data and a customer provided key for an HTTPS connection.
  - S3 will then use the customer provided key to encrypt the object data.
  - S3 will also create a salted HMAC value of the customer provided key for future validation.
  - The encrypted object data along with HMAC value of customer provided key is then stored
    in S3
  - The Customer provided key is then removed from the memory.
- **Decryption Process:**
  - A request is made by the client via an HTTPS connection to retrieve the object data.
  - At the same time, the Customer provided key is also sent with the request.
  - S3 uses the HMAC value of the same key to confirm its validity of the requested data.
  - The Customer provided key is then used to decrypt the encrypted object.
  - The decrypted object is then sent back to customer.

## Client Side Encryption with KMS (CSE-KMS):
- Uses the KMS to generate the data encryption keys.
- KMS is called upon via the client, not the S3.
- Encryption takes place at client side and encrypted data is then sent to S3.
- **Encryption Process:**
  - Using an AWS SDK such as JAVA client, a request is made to KMS for Data keys.
  - The Data keys are generated from a specific CMK.
  - This CMK is defined by providing the CMK-ID in the request.
  - KMS will then generate two Data keys using the specified CMK.
  - One will be a Plain text data key and other will be a cipher blob of same plain text data key.
  - Both keys are then sent back to the client.
  - The client will then combine Object data with Plain text data key to create the
    encrypted version of Object data.
  - The client will then upload the Object data along with cipher blob version of the Data key
    to S3.
  - S3 will then store the Object data and the cipher blob of encrypted Data key as metadata of
    encrypted Object data.
- **Decryption Process:**
  - Request is made by the client to retrieve the object data.
  - S3 sends back the encrypted object data along with cipher blob back to the client.
  - Using the AWS SDK Java client, the cipher blob Data key is then sent to KMS.
  - KMS combines the cipher blob data key with the corresponding CMK to generate the
    plain text Data key.
  - This plain text data is then sent back to the client to decrypt the encrypted data.

## Client Side Encryption with Customer provided keys (CSE-C):
- You are able to utilize your own provided keys.
- Use AWS SDK client to encrypt your data before sending it to S3 for storage.
- **Encryption Process:**
  - Using the AWS SDK such as Java client, it will randomly generate a plain text data key.
  - This Plain text data is used to encrypt the Object data.
  - The customer provided CMK is then used to encrypt the client-generated data key.
  - The encrypted Object data and encrypted data key are then sent to S3.
  - S3 will then store the encrypted data and associate the encrypted data key as metadata.
- **Decryption Process:**
  - Request is made by the client to retrieve the object data.
  - S3 sends both the encrypted object data and encrypted data key back to the client.
  - The customer provided CMK is then used to decrypt the encrypted data key.
  - This will produce the plain text data key.
  - This Plain text data key is then used to decrypt the Object data.

## Encryption in transit:

- S3 exposes HTTPS endpoint which is used for encryption in flight.
- HTTPS endpoint is mandatory for SSE-C.
- To enforce HTTPS, a bucket policy with `aws:SecureTransport` must be configured.