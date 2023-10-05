#!/bin/bash

# req -x509: X.509 certificate data management.
# -nodes: Don't encrypt the output key.
# -days: The number of days to certify the certificate for.
# -newkey: Generate a new certificate request and a new private key.
# -keyout: File to write the newly created private key to.
# -out: Output file to write certificate to.
# -subj: Sets certificate subject.

# Check if the environment variables are set
if [ -z "$CERT_KEY_PATH" ] || [ -z "$CERT_PATH" ] || [ -z "$CERT_SUBJECT" ]; then
  echo "One or more required environment variables are not set."
  exit 1
fi

# Generate the certificate using environment variables
openssl req -newkey rsa:2048 -nodes -keyout "$CERT_KEY_PATH" -x509 -days 365 \
 -out "$CERT_PATH" -subj "$CERT_SUBJECT"

echo "Certificate created successfully"
