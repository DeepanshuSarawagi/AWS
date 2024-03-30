# SSL and SNI

## SSL encryption - How it works?

- Client sends a message to server.
- Server responds with server random and SSL certificate (Public key)
- Client verifies SSL certificate and its authenticity.
- Master (symmetric) key generated and sent using the public key.
- Server verifies client SSL cert.
- Server decrypts the symmetric key using its private key.
- Secure symmetric communication in place.

## SSL - SNI (Server Name Indication):

- SNI solves the problem of loading multiple SSL certificates onto one web server. (To serve multiple sites)
- Its a newer protocol and requires client to specify the hostname of the target server for the initial SSL handshake.
- The server will then find the correct certificate or return the default one.
- It is applicable only on ALB, CloudFront and new gen NLB.

## SSL - MITM - How to prevent?

- Always communicate with server which is HTTPS enabled.
- Use a DNS that has DNSSEC
  - When a DNS server is hacked, DNS response can be forged to send the client to a private server.
  - This can be protected by using DNSSEC.
  - Route53 uses DNSSEC for domain registration.
  - As of Dec 2020, Route53 uses DNSSEC for DNS service using KMS.