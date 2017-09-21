#!/bin/sh

filePath="/etc/sysctl.d/99-oracle.conf"

touch $filePath
echo "kernel.sem=250 32000 100 128" >> $filePath
echo "fs.file-max=6815744" >> $filePath
echo "net.core.rmem_default=262144" >> $filePath
echo "net.core.rmem_max=4194304" >> $filePath
echo "net.core.wmem_default=262144" >> $filePath
echo "net.core.wmem_max=1048576" >> $filePath
echo "kernel.shmall=18446744073692774399" >> $filePath
# echo "kernel.shmmax=18446744073692774399" >> $filePath
# echo "kernel.shmmni=4096" >> $filePath
echo "fs.aio-max-nr=1048576" >> $filePath
sysctl -p $filePath

echo "sysctl is Completed."