#!/bin/sh

# define the decryption key
SECRET_PASSWORD=X
#LARGE_SECRET_PASSPHRASE=$SECRET_PASSWORD

# declare array of files to encrypt  <~ does NOT use comma between articles!
toDecrypt=(
  "appsettings.json.gpg"
  "appsettings.dev.json.gpg"
  "secrets/user_host_rsa.gpg"
)

# iterate each file and encrypt using gpg
for file in ${toDecrypt[@]}
do
  # file to target
  f="${PWD}/$file"

  # output file
  g="${PWD}/${file%.gpg}"

  # remove exising cs file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # decrypt the file
  gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" --pinentry-mode loopback --output "$g" "$f"

  # remove old file
  rm -rf $f
done