#!/bin/sh

# define the decryption key
SECRET_PASSWORD=X
#LARGE_SECRET_PASSPHRASE=$SECRET_PASSWORD

# find all files to encrypt
toEncrypt=`find . -name "*.cs"`

# iterate each file and encrypt using gpg
for file in ${toEncrypt[@]}
do
  # file to target
  f="$file"

  # output file
  g="$f.gpg"

  # remove exising gpg file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # encrypt the file
  gpg --passphrase="$LARGE_SECRET_PASSPHRASE" --pinentry-mode loopback --symmetric --cipher-algo AES256 "$f"

  # remove old file
  rm -rf $f
done

# declare array of files to encrypt  <~ does NOT use comma between articles!
toEncrypt=(
  "appsettings.json"
  "appsettings.dev.json"
  "secrets/user_host_rsa"
)

# iterate each file and encrypt using gpg
for file in ${toEncrypt[@]}
do
  # file to target
  f="$file"

  # output file
  g="$f.gpg"

  # remove exising gpg file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # encrypt the file
  gpg --passphrase=$LARGE_SECRET_PASSPHRASE --pinentry-mode loopback --symmetric --cipher-algo AES256 "$f"

  # remove old file
  rm -rf $f
done
