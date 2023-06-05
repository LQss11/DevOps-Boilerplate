#!/bin/bash

# Create a certificate authority
openssl genrsa -out ca.key 2048 
openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr 
openssl x509 -req \
-in ca.csr \
-signkey ca.key \
-CAcreateserial \
-out ca.crt \
-days 365 



# Generate Client signed certificate by the ca above 
openssl genrsa -out client.key 2048
openssl req -new -key client.key -subj "/CN=client/O=system:masters" -out client.csr
openssl x509 -req \
-in client.csr \
-CA ca.crt \
-CAkey ca.key \
-CAcreateserial \
-out client.crt \
-extensions v3_req  \
-days 365