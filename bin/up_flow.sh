#!/bin/sh

DOWNLOAD_URL=https://github.com$(wget "https://github.com/facebook/flow/releases/latest" -qO- | sed -n 's/.*href[ ]*\=[ ]*\"\([^"]*linux.*zip\)\".*/\1/p')

wget -c $DOWNLOAD_URL


rm -rf flow
7z x -y flow-*.zip
mv flow flow1
mv flow1/flow flow
rmdir flow1
rm -f flow-*.zip
