#!/bin/sh
user=`whoami`
if [ "oracle" != $user ];then
    echo "The current user is not oracle."
    exit
fi

# 设置环境变量
sh ~/oracle/set-env.sh

# 解压
unzip linuxx64_12201_database.zip