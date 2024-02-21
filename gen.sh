rm *.pem
#1. Generate Certificate Authority (CA)'s private key and self-signed certificate
openssl req -x509 -newkey rsa:4096 -days 365 -keyout ca-key.pem -out ca-cert.pem -subj "/C=VI/ST=hue/L=hue/O=none/OU=none/CN=thanhquy/emailAddress=thanhquy1105@gmail.com"

echo "CA's self-signed certificate"
openssl x509 -in ca-cert.pem -noout -text
#2. Generate web server's private key and certificate signing request (CSR)
openssl req -newkey rsa:4096 -keyout server-key.pem -out server-req.pem -subj "/C=VN/ST=HCM/L=Thu Duc/O=PC Book/OU=Computer/CN=*.pcbook.com/emailAddress=phanvanthanhquy1@gmail.com"

#3. Use CA's private key to sign web server's CSR and get back the signed certificate
openssl x509 -req -in server-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile ./server-ext.cnf

echo "Server's signed certificate"
openssl x509 -in server-cert.pem -noout -text

#4. Verify the certificate
openssl verify -CAfile ca-cert.pem server-cert.pem