#!/usr/bin/env sh
echo 01 > keys/ca.srl
openssl genrsa -out keys/ca-key.pem
openssl req -subj '/CN=docker' -new -x509 -days 365 -key keys/ca-key.pem -out keys/ca.pem
