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

cd database

echo "Installing..."
# 开始安装
sh ./runInstaller -silent -waitforcompletion -noconfig -responseFile ~/oracle/db.rsp

echo "Installed"

$ORACLE_HOME/bin/netca /silent /responsefile /home/oracle/database/response/netca.rsp
$ORACLE_HOME/bin/dbca -silent -responseFile ~/oracle/dbca.rsp