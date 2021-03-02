---
title: Using TLS (Transport Layer Security)
keywords:
  - https
  - tls
  - ssl
  - certificate
  - self signed
---

Before you keep going, if you are considering using a self signed certificate, do consider using a free CA signed certificate from [Let's Encrypt](https://letsencrypt.org) instead. It will save you a lot of hassle configuring self signed certificates everywhere you connect to the Pact Broker.

## Connecting to a Pact Broker running over TLS

### With a CA signed certificate

You shouldn't need to do anything, as the certificate authority's certificate should already be loaded into the store of your system.

### With a self signed certificate

#### For JVM

Search for "Specifying a custom trust store" in the search bar and select the results for the appropriate tool.

#### For non-JVM

Set the `SSL_CERT_FILE` environment variable to point to a local file containing the certificate in PEM format. It will look something like this:

```
-----BEGIN CERTIFICATE-----
MIIDUjCCAjqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlsb2Nh
bGhvc3QwIBcNMjAwOTI5MjI1NDQ0WhgPMjEyMDA5MDUyMjU0NDRaMBQxEjAQBgNV
BAMMCWxvY2FsaG9zdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKwQ
mGF9zXSkw93HUlpMxR/aLCTPjKMxc37iNRUBMSz6qVcs3Ue9mJChn9SK98aH3/at
R2+YBSdRqlqO5gOvkZyG0aMUMLx+vTXeZBJyR1qSSReKwxGtXmVPQRThUnKwDq6a
chjyH3PujWfF3ouMdLqixrxBEZd0E1b0Nqv939KurRSO3QkLGeEFr4U+WuMKowGG
lGMtE2Yhcm9LZUeXYay8XZpBvxHhnqv08+oIujUOgJ2oSD4q6Lg+lPUCH5SrMiIw
SShbI9NcmeTgBFAmd0qu2OgsRG9Io1W0z2V1tkb3y58GO/R93R4Te4MjnsVFH8u2
RWnpr65BqDQ1jXaGPXUCAwEAAaOBrDCBqTAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud
DgQWBBSFm/ooxd2VawosFUyUTV2Y0Z+KhDA8BgNVHSMENTAzgBSFm/ooxd2Vawos
FUyUTV2Y0Z+KhKEYpBYwFDESMBAGA1UEAwwJbG9jYWxob3N0ggEBMDkGA1UdEQQy
MDCCCWxvY2FsaG9zdIILcGFjdC1icm9rZXKCFnBhY3QtYnJva2VyLXdpdGgtbmdu
aXgwDQYJKoZIhvcNAQELBQADggEBAC7powMNMXBi/qRNaPE/PCkoaA7eUGOWawkF
793TB6C1Z2Q6c5adbOAbRqr1CIM2MWZqCrvUbTSTIx5J8lvVwgkhfLYFlubpZd7o
XK++6gT1uzN8V992n43GU21R0C9YSq2ZX7Vt+T5O53R5+cdS60g5o722LUin2a4d
bTk5fOGqTBqgzp1BgJKIKhI9CIUeAUYwggCWOeZnq4dpMkXH1xbsk4MMSOTimWbe
2DMNyKGDRC744i/ejQqnnj+lvycgp9gVPaSRDVRz1Nd224Qd+9UAgAZUwMBsK9Zp
7goJryZdGS3/LJ6RUyXDBIsL93gvgrOIWRbZoVVjqhMQeL1TAwQ=
-----END CERTIFICATE-----
```

You'll need to configure the certificate both your development environment and your CI. It's a bit of a hassle, so again, do consider a CA signed certificate from [Let's Encrypt](https://letsencrypt.org) instead.

You can use this [Docker Compose](https://github.com/DiUS/pact_broker-docker/blob/master/docker-compose.yml) file to spike and troubleshoot connecting to a broker with a self signed certificate. Once you have run `docker-compose up` once and seen it work with the built in files, replace the certificate and key files with your own and run `docker-compose down` and `docker-compose up`.

##### Extracting a copy of the certificate from a running Pact Broker

If you do not already have a copy of the certificate, you can extract it from Firefox.

* Open a page in the Pact Broker in Firefox
* Click on the lock icon next to the address bar
* Click on the ">" (Show connection details) button
* Click "More information"
* Click "View Certificate"
* Scroll down to Miscellaneous
* Click "PEM (chain)" in the Download section

