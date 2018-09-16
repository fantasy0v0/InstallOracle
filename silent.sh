#!/bin/sh
user=`whoami`
if [ "oracle" != $user ];then
    echo "The current user is not oracle."
    exit
fi

# 解压
unzip linuxx64_12201_database.zip

cd database

echo "Installing..."
# 开始安装
sh ./runInstaller -silent -showProgress -waitforcompletion -responseFile ~/oracle/db.rsp
echo "Installed"

# 安装数据库
$ORACLE_HOME/bin/dbca -silent -createDatabase -responseFile ~/oracle/dbca.rsp

# 配置监听
$ORACLE_HOME/bin/netca /silent /responsefile ~/database/response/netca.rsp