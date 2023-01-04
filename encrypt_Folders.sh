#!/bin/sh

# define the encryption key
ENCRYPT_PASSWORD=Errant-Patchwork-Scoop5-Subsiding

# declare array of files to encrypt  <~ does NOT use comma between articles!
toEncrypt=("appsettings.json" "appsettings.dev.json" "secrets/user_host_rsa")

# iterate each file and encrypt using gpg
for file in ${toEncrypt[@]}
do
  # file to target
  f="${PWD}/$file"

  # output file
  g="$f.gpg"

  # remove exising gpg file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # encrypt the file
  gpg --passphrase=$ENCRYPT_PASSWORD --pinentry-mode loopback --symmetric --cipher-algo AES256 "$f"
done


# encrypt Controllers directory
yourfilenames=`ls ${PWD}/Controllers/*.cs`
for eachfile in $yourfilenames
do
  #file to target
  f="$eachfile"

  # output file
  g="$f.gpg"

  # remove exising gpg file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # encrypt the file
  gpg --passphrase=$ENCRYPT_PASSWORD --pinentry-mode loopback --symmetric --cipher-algo AES256 "$f"
done
