TLS Names
---------
`build_correspondence_table.sh` is a script that find the correspondences
between IANA names for TLS ciphers, OpenSSL, GnuTLS and NSS.

`IANA_TLS_Names.csv` is a list of IANA TLS ciphers with associated HEX
values taken from www.iana.org/assignments/tls-parameters/tls-parameters.xhtml

`./convert_openssl_to_gnutls.sh` is a script that convert an OpenSSL ciphersuite
to GnuTLS format.

This script requires recent versions of OpenSSL and GnuTLS.
