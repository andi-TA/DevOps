#!/bin/sh

SSL_FOLDER="${PWD}"/secrets

mkdir -p "$SSL_FOLDER"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$SSL_FOLDER"/ssl.key \
    -out "$SSL_FOLDER"/ssl.crt \
    -subj "/C=XX/ST=Analamanga/L=Antananarivo/O=Antananarivo/OU=Antananarivo/CN=DevOps-atahiry-" 1>/dev/null  2>/dev/null

chmod 644 "$SSL_FOLDER"/ssl.key
chmod 644 "$SSL_FOLDER"/ssl.crt