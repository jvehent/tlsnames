#!/usr/bin/env bash
gtlsciphersuite=""
unknown=""
IFS=$'\n'
if [ -z "$(which gnutls-cli)" ] ; then echo "GnuTLS is missing"; exit 1;fi
if [ -z "$(which openssl)" ] ; then echo "OpenSSL is missing"; exit 1;fi
if [ -z "$1" ]; then echo -e "$0 '<openssl ciphersuite>'\n$0 converts an openssl ciphersuite to gnutls format\n";fi
for cipher in $(openssl ciphers -V "$1")
do
    hexval=$(echo $cipher|awk '{print $1}')
    hexsval="$(echo $hexval|cut -d ',' -f1), $(echo $hexval|cut -d ',' -f2)"
    openssl=$(echo $cipher | awk '{print $3}')
    gnutls=$(gnutls-cli -l |grep -i $hexsval|awk '{print $1}')
    echo "$hexval openssl:$openssl gnutls:$gnutls"
    if [ ! -z $gnutls ]
    then
        gtlsciphersuite="$gtlsciphersuite:$gnutls"
    else
        unknown="$unknown:$openssl"
    fi
done
echo
echo "GnuTLS ciphersuite:"
echo $gtlsciphersuite|sed 's/^://'
echo
echo "Unknown ciphers not present in GnuTLS"
echo $unknown|sed 's/^://'
echo
