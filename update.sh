#!/bin/bash

#set -x

#Exit on Error
set -e

# Google
curl -s https://www.gstatic.com/ct/log_list/v3/log_list.json -o google/log_list.json
curl -s https://www.gstatic.com/ct/log_list/v3/log_list.sig -o google/log_list.sig
openssl dgst -sha256 -verify google/log_list_pubkey.pem -signature google/log_list.sig google/log_list.json && echo "Valid signature" || exit 1

curl -s https://www.gstatic.com/ct/log_list/v3/all_logs_list.json -o google/all_logs_list.json
curl -s https://www.gstatic.com/ct/log_list/v3/all_logs_list.sig -o google/all_logs_list.sig
openssl dgst -sha256 -verify google/log_list_pubkey.pem -signature google/all_logs_list.sig google/all_logs_list.json && echo "Valid signature" || exit 1

# Apple
curl -s https://valid.apple.com/ct/log_list/current_log_list.json -o apple/current_log_list.json

# Mozilla
curl -s https://hg-edge.mozilla.org/mozilla-central/raw-file/tip/security/ct/CTKnownLogs.h -o mozilla/CTKnownLogs.h

# Check if anything relevant changed and ignore build times, version and timestamps
git diff -I'"version":' -I'"log_list_timestamp":' -I'kCTExpirationTime'