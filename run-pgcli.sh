#!/bin/bash

echo $POSTGRES_CLIENT_CERT | base64 --decode > client-cert.pem
echo $POSTGRES_CLIENT_KEY | base64 --decode > client-key.pem
echo $POSTGRES_SERVER_CA | base64 --decode > ca-cert.pem

chmod 0600 client-key.pem

pgcli "host=$POSTGRES_HOST sslmode=prefer sslrootcert=ca-cert.pem sslcert=client-cert.pem sslkey=client-key.pem user=$POSTGRES_USER dbname=$POSTGRES_DATABASE password=$POSTGRES_PASSWORD"