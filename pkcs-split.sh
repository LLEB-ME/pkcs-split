#!/bin/bash

curwd=$(pwd)

# Check if impromper conversion
if $2 == "PEM"
elif $2 == "KEY"
elif $2 == "RSA"
else
  echo "Unrecognised conversion format: $2"
  return 1
fi

# Convert
echo "Converting $1 into $2"
if $2 == "PEM"
  openssl pkcs12 -provider default -provider legacy -in $1 -nocerts -out $curwd/private.pem
  openssl pkcs12 -provider default -provider legacy -in $1 -clcerts -nokeys -out $curwd/public.pem
elif $2 == "KEY"
  openssl pkcs12 -provider default -provider legacy -in $1 -nocerts -out $curwd/private.key
  openssl pkcs12 -provider default -provider legacy -in $1 -clcerts -nokeys -out $curwd/public.cer
elif $2 == "RSA"
  openssl pkcs12 -provider default -provider legacy -in $1 -nocerts -out $curwd/private.rsa
  openssl pkcs12 -provider default -provider legacy -in $1 -clcerts -nokeys -out $curwd/public.cer
else
  echo "Unexpected error."
  return 1
fi

echo "Conversion complete. See folder where certificates are for result.
