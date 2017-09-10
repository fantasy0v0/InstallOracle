#!/bin/sh

filePath="/etc/security/limits.conf"

echo "oracle soft nproc 3415" >> $filePath
echo "oracle hard nproc 16384" >> $filePath
echo "oracle soft nofile 1024" >> $filePath
echo "oracle hard nofile 65536" >> $filePath
echo "oracle - stack 10240" >> $filePath

echo "limits is Completed."