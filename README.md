# Certificate Transparency Logs

## Google

https://certificate.transparency.dev/google/

To check whether Logs are currently pending inclusion in Chrome, check the Chromium inclusion bugs: https://issues.chromium.org/issues?q=status:open%20componentid:1456813

The list of CT Logs that are currently compliant with Chrome’s CT policy (or have been and were disqualified), and are included in Chrome:

(https://www.gstatic.com/ct/log_list/v3/log_list_schema.json)
(https://www.gstatic.com/ct/log_list/v3/log_list_pubkey.pem)

(https://www.gstatic.com/ct/log_list/v3/log_list.json)
(https://www.gstatic.com/ct/log_list/v3/log_list.sig)
(https://www.gstatic.com/ct/log_list/v3/log_list.zip)

```console
openssl dgst -sha256 -verify log_list_pubkey.pem -signature log_list.sig log_list.json
```

(https://www.gstatic.com/ct/log_list/v3/all_logs_list.json)
(https://www.gstatic.com/ct/log_list/v3/all_logs_list.sig)
(https://www.gstatic.com/ct/log_list/v3/all_logs_list.zip)

```console
openssl dgst -sha256 -verify log_list_pubkey.pem -signature all_logs_list.sig all_logs_list.json
```

## Apple

(https://valid.apple.com/ct/log_list/current_log_list.json)
(https://valid.apple.com/ct/log_list/schema_versions/log_list_schema_v4.json)

## Mozilla

(https://github.com/mozilla/gecko-dev/blob/master/taskcluster/docker/periodic-updates/scripts/getCTKnownLogs.py)
(https://searchfox.org/mozilla-central/source/security/ct)
(https://hg-edge.mozilla.org/mozilla-central/file/tip/security/ct/CTKnownLogs.h)
(https://hg-edge.mozilla.org/mozilla-central/raw-file/tip/security/ct/CTKnownLogs.h)

# Windows CTL