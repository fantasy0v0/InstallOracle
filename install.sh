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

# 由于不知道oracle什么时候安装完成，所以要手动执行以下脚本
# /u01/app/oraInventory/orainstRoot.sh
# /u01/app/oracle/product/12.2.0/dbhome_1/root.sh

# 配置监听和安装数据库，这一步是下面步骤的整合
# 根据之前的db.rsp来执行的，所以可以不用单独编写响应文件
# 数据库的安装比较慢，需要tailf日志来查看是否安装完成 /u01/app/oraInventory/logs
# /home/oracle/database/runInstaller -executeConfigTools -responseFile /home/oracle/oracle/db.rsp -silent

# 配置默认监听
# $ORACLE_HOME/bin/netca /silent /responsefile /home/oracle/database/response/netca.rsp
# 安装数据库
# $ORACLE_HOME/bin/dbca -silent -responseFile /home/oracle/database/response/dbca.rsp