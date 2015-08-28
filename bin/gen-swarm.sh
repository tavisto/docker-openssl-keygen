#!/usr/bin/env sh

echo extendedKeyUsage = clientAuth,serverAuth > keys/swarm-extfile.cnf
cat keys/swarm-extfile.cnf
openssl genrsa -out keys/swarm-key.pem 2048
openssl req -subj '/CN=swarm' -new -key keys/swarm-key.pem -out keys/swarm.csr
openssl x509 -req -days 1825 -in keys/swarm.csr -CA keys/ca.pem -CAkey keys/ca-key.pem -out keys/swarm-cert.pem -extfile keys/swarm-extfile.cnf
openssl x509 -text -in keys/swarm-cert.pem -noout
openssl rsa -in keys/swarm-key.pem -out keys/swarm-key.pem
