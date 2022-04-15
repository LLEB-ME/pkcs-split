#!/bin/bash

curwd=$(pwd)

# Check if impromper conversion
case $2 in
        "PEM"|"KEY"|"RSA") echo "Valid input; continuing...";;
        *) echo "Unrecognised conversion format: $2" && return 1;;
esac

# Convert
echo "Converting $1 into $2"
if [ "$2" == "PEM" ]; then
  openssl pkcs12 -provider default -provider legacy -in "$1" -nocerts -nodes -out "$curwd/private.pem"
  openssl pkcs12 -provider default -provider legacy -in "$1" -clcerts -nokeys -out "$curwd/public.pem"
elif [ "$2" == "KEY" ]; then
  openssl pkcs12 -provider default -provider legacy -in "$1" -nocerts -nodes -out "$curwd/private.key"
  openssl pkcs12 -provider default -provider legacy -in "$1" -clcerts -nokeys -out "$curwd/public.cer"
elif [ "$2" == "RSA" ]; then
  openssl pkcs12 -provider default -provider legacy -in "$1" -nocerts -nodes -out "$curwd/private.rsa"
  openssl pkcs12 -provider default -provider legacy -in "$1" -clcerts -nokeys -out "$curwd/public.cer"
else
  echo "Unexpected error."
  return 1
fi

echo "Conversion complete. See folder where certificates are for result."
