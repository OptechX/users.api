#!/bin/sh

# move the files to be decrypted to a temp folder
for x in ./Controllers/*.cs.gpg;
do
    mv $x ./_tmp_decrypt/
done

# decrypt and rename the files
for f in ./_tmp_decrypt/*.cs.gpg;
do
    NEW_NAME="${f%.cs.gpg}.cs"
    gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" --pinentry-mode loopback \
    --output $NEW_NAME $f
done

# remove the encrypted files
for z in ./_tmp_decrypt/*.cs.gpg;
do
    rm -rf $z
done

# move the decrypted files back
for x in ./_tmp_decrypt/*.cs;
do
    mv $x ./Controllers/
done
