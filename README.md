# the certificate authority(CA) and the certificate applicant.

## what we're gonna do:

1. In the first step, we will generate a private key and its self-signed certificate for the CA. They will be used to sign the certificate signing request (CSR) later.
2. In the second step, we will generate a private key and its paired CSR for the web server that we want to use TLS.
3. Then finally we will use the CA’s private key to sign the web server’s CSR and get back the signed certificate.
4. Verify the certificate