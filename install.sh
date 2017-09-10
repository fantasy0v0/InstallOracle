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
sh make-group-user.sh

# 创建Oracle目录
sh make-dir.sh

# 修改属主为oracle
chown -R oracle:oinstall oracle
# 并移动到oracle家目录下
mv -rv oracle /home/oracle

# 修改oracle安装文件压缩包的属主
chown oracle:oinstall linuxx64_12201_database.zip
# 移动到oracle家目录
mv linuxx64_12201_database.zip /home/oracle

# 执行静默安装
su - oracle -c "silent.sh"

# 由于不知道oracle什么时候安装完成，所以要手动执行以下脚本
# /u01/app/oraInventory/orainstRoot.sh
# /u01/app/oracle/product/12.2.0/dbhome_1/root.sh
# sh orainstRoot.sh

# 配置监听和安装数据库
# /home/oracle/database/runInstaller -executeConfigTools -responseFile /home/oracle/db.rsp

# 配置默认监听
# $ORACLE_HOME/bin/netca /silent /responsefile /home/oracle/database/response/netca.rsp