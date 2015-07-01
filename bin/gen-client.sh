#!/usr/bin/env sh

echo extendedKeyUsage = clientAuth > keys/client-extfile.cnf
cat keys/client-extfile.cnf
openssl genrsa -out keys/client-key.pem 2048
openssl req -subj '/CN=client' -new -key keys/client-key.pem -out keys/client.csr
openssl x509 -req -days 1825 -in keys/client.csr -CA keys/ca.pem -CAkey keys/ca-key.pem -out keys/client-cert.pem -extfile keys/client-extfile.cnf
openssl x509 -text -in keys/client-cert.pem -noout
openssl rsa -in keys/client-key.pem -out keys/client-key.pem
