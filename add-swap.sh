#!/bin/sh

#需要在root下执行
user=`whoami`
if [ "root" != $user ];then
    echo "The current user is not root."
    exit
fi

# oracle需要4G的swap，但CentOS7默认下只有2G
dd if=/dev/zero of=/swap_4G bs=1024 count=4194304
mkswap /swap_4G
chown root:root /swap_4G
# user 可读写权限
chmod 0600 /swap_4G
swapon /swap_4G

# 追加进fstab，保证重启后依然有效
echo "/swap_4G swap swap defaults 0 0" >> /etc/fstab

echo "Swap Completed."
