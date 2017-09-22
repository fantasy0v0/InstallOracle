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

# 开始安装
sh ./runInstaller -silent -force -noconfig -responseFile ~/oracle/db.rsp

echo "Installing..."

# 判断安装程序是否结束
while true
do
	count=$(ps -ef | grep '/runInstaller -silent' | grep -v grep | awk '{print $2}' | wc -l)
	if [ $count = 0 ] then
		break
	fi
	sleep 5
done

echo "Installed"