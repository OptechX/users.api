#!/bin/sh

# define the decryption key
SECRET_PASSWORD=X
#LARGE_SECRET_PASSPHRASE=$SECRET_PASSWORD

# find all files to decrypt
toDecrypt=`find . -name "*.cs.gpg"`

# iterate each file and decrypt using gpg
for file in ${toDecrypt[@]}
do
  # file to target
  f="$file"

  # output file
  g="${file%.cs.gpg}.cs"

  # remove exising cs file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # decrypt the file
  gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" --pinentry-mode loopback --output "$g" "$f"

  # remove old file
  rm -rf $f
done
