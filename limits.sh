#!/bin/sh

filePath="/etc/security/limits.conf"

echo "oracle soft nofile 1024" >> $filePath
echo "oracle hard nofile 65536" >> $filePath
echo "oracle soft stack 8192" >> $filePath
echo "oracle hard stack 10240" >> $filePath