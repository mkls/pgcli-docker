#!/bin/bash

echo $POSTGRESQL_CLIENT_CERT | base64 --decode > client-cert.pem
echo $POSTGRESQL_CLIENT_KEY | base64 --decode > client-key.pem
echo $POSTGRESQL_SERVER_CA | base64 --decode > ca-cert.pem

chmod 0600 client-key.pem

export PGSSLCERT=client-cert.pem
export PGSSLKEY=client-key.pem

pgcli $POSTGRESQL_URL
