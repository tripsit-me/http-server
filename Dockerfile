FROM nginx:alpine

RUN apk add openssl
RUN openssl req \
	-x509 \
	-nodes \
	-days 365 \
	-subj "/C=CA/ST=QC/O=TripSit, Inc./CN=beta.tripsit.me" \
	-addext "subjectAltName=DNS:beta.tripsit.me" \
	-newkey rsa:2048 \
	-keyout "/etc/ssl/private/nginx-tripsit-beta.key" \
	-out "/etc/ssl/certs/nginx-tripsit-beta.crt"
