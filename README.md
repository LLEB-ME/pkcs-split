# pkcs-split

**You will need OpenSSL installed.** This tool is intended for use with Keychain Access (55296.40.3).

Clone this repository (`git clone https://github.com/LLEB-ME/pkcs-split.git`) and mark the shell script as executable (`chmod +x pkcs-split.sh`).

### Usage
`$ pkcs-split <PKCS #12 file> <pem|key|rsa>`

**Do not surround variables in `<>`.** These are used as a placeholder to show variables.
- `<PKCS #12 file>`— the location of your PKCS #12 certificate.
- `<pem|key|rsa>`— select any of the options.
  + `PEM` will provide 2 PEM files: `private.pem` and `public.pem`
  + `KEY` will provide 1 KEY and 1 CER: `private.key` and `public.cer`
  + `RSA` will provide 1 RSA and 1 CER: `private.rsa` and `public.cer`

### Acknowledgements
This project is [licensed under the 3-Clause BSD License.](/LICENSE)
