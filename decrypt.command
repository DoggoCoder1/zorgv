#!/bin/bash

DIR="./Library/ZorgV/Cache"
PASSWORD="1234"
chmod u+w "$DIR"
find "$DIR" -type f -name "*.encrypted" | while read -r enc_file; do
    # Remove the .encrypted extension
    orig_file="${enc_file%.encrypted}"
    openssl enc -aes-256-cbc -d -salt -in "$enc_file" -out "$orig_file" -pass pass:"$PASSWORD"
    
    if [ $? -eq 0 ]; then
        echo "Decrypted: $enc_file → $orig_file"
        rm -f "$enc_file"
        echo "Deleted encrypted file: $enc_file"
    else
        echo "Failed to decrypt: $enc_file"
    fi
done

clear
echo "All .encrypted files in $DIR have been decrypted and encrypted versions deleted."
