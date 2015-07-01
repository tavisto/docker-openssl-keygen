#!/usr/bin/env bash
HOSTNAME=$1
IP=$2
echo "Setting /CN=$HOSTNAME"
echo subjectAltName = IP:$IP,IP:127.0.0.1 > keys/server-extfile.cnf
cat keys/server-extfile.cnf
openssl genrsa -out keys/server-key.pem 2048
openssl req -subj "/CN=$HOSTNAME" -new -key keys/server-key.pem -out keys/server.csr
openssl x509 -req -days 365 -in keys/server.csr -CA keys/ca.pem -CAkey keys/ca-key.pem -out keys/server-cert.pem -extfile keys/server-extfile.cnf
openssl x509 -text -in keys/server-cert.pem -noout
openssl rsa -in keys/server-key.pem -out keys/server-key.pem
