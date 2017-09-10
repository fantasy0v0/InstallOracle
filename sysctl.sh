#!/bin/sh
user=`whoami`
if [ "root" != $user ];then
    echo "The current user is not root."
    exit
fi

filePath="/etc/sysctl.d/99-oracle.conf"

touch $filePath
echo "kernel.sem=250 32000 100 128" >> $filePath
echo "fs.file-max=6515744" >> $filePath
echo "net.core.rmem_default=4194304" >> $filePath
echo "net.core.wmem_default=262144" >> $filePath
echo "net.core.wmem_max=1048576" >> $filePath
sysctl -p $filePath