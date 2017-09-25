#!/bin/sh
user=`whoami`
if [ "root" != $user ];then
    echo "The current user is not root."
    exit
fi

# 增加虚拟内存
sh add-swap.sh

# 安装程序包
sh install-package.sh

# 修改内核参数
sh sysctl.sh

# 修改限制
sh limits.sh

# 新增用户与用户组
sh create-group-user.sh

# 创建Oracle目录
sh make-dir.sh

# 修改属主为oracle
chown -R oracle:oinstall oracle
# 并移动到oracle家目录下
mv -v oracle /home/oracle
mv -v silent.sh /home/oracle

# 修改oracle安装文件压缩包的属主
chown oracle:oinstall linuxx64_12201_database.zip
# 移动到oracle家目录
mv linuxx64_12201_database.zip /home/oracle

# 执行静默安装
su - oracle -c "sh silent.sh"

# 安装后的配置
/u01/app/oraInventory/orainstRoot.sh
/u01/app/oracle/product/12.2.0/dbhome_1/root.sh

# 配置监听和安装数据库，这一步是下面步骤的整合
# 根据之前的db.rsp来执行的，所以可以不用单独编写响应文件
# /home/oracle/database/runInstaller -executeConfigTools -responseFile /home/oracle/oracle/db.rsp -silent
# 数据库的安装比较慢，需要tailf日志来查看是否安装完成 /u01/app/oraInventory/logs
# 配置默认监听
# $ORACLE_HOME/bin/netca /silent /responsefile /home/oracle/database/response/netca.rsp
# 安装数据库
# $ORACLE_HOME/bin/dbca -silent -responseFile /home/oracle/database/response/dbca.rsp

su - oracle -c "/home/oracle/database/runInstaller -executeConfigTools -responseFile /home/oracle/oracle/db.rsp -silent"
# 判断安装程序是否结束
while true
do
	count=$(ps -ef | grep '/runInstaller' | grep -v grep | awk '{print $2}' | wc -l)
	if [ $count -eq 0 ]; then
		break
	fi
	sleep 5
done
while true
do
	count=$(ps -ef | grep 'oracle.installer' | grep -v grep | awk '{print $2}' | wc -l)
	if [ $count -eq 0 ]; then
		break
	fi
	sleep 5
done

echo "Installed"