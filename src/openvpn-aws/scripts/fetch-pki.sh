#!/bin/bash

set -e
set -o pipefail

fetch_file_from_s3 \
    "${S3_BUCKET_REGION}" \
    "${OPENVPN_CA_CERT_FILE_S3_OBJECT_PATH}" \
    /etc/openvpn/pki/ca.crt
fetch_file_from_s3 \
    "${S3_BUCKET_REGION}" \
    "${OPENVPN_SERVER_CERT_FILE_S3_OBJECT_PATH}" \
    /etc/openvpn/pki/server.crt
fetch_file_from_s3 \
    "${S3_BUCKET_REGION}" \
    "${OPENVPN_SERVER_KEY_FILE_S3_OBJECT_PATH}" \
    /etc/openvpn/pki/server.key
fetch_file_from_s3 \
    "${S3_BUCKET_REGION}" \
    "${OPENVPN_DH_PARAMS_FILE_S3_OBJECT_PATH}" \
    /etc/openvpn/pki/dh2048.pem
fetch_file_from_s3 \
    "${S3_BUCKET_REGION}" \
    "${OPENVPN_CRL_FILE_S3_OBJECT_PATH}" \
    /etc/openvpn/pki/crl.pem
