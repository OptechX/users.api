#!/bin/sh

# define the encryption key
DECRYPT_PASSWORD=X
LARGE_SECRET_PASSPHRASE=$DECRYPT_PASSWORD

# declare array of files to encrypt  <~ does NOT use comma between articles!
toEncrypt=("appsettings.json.gpg" "appsettings.dev.json.gpg" "secrets/user_host_rsa.gpg")

# iterate each file and encrypt using gpg
for file in ${toEncrypt[@]}
do
  # file to target
  f="${PWD}/$file"

  # output file (removes the .gpg extension)
  g="${file%.gpg}"

  # remove exising gpg file if found
  if [ -f "${PWD}/$g" ]; then
    rm -rf "${PWD}/$g"
  fi

  # new file name
  NEW_NAME="${PWD}/$g"

  # decrypt the file
  gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" --pinentry-mode loopback \
    --output $NEW_NAME $f
done
