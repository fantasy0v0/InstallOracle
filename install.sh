#!/bin/sh
user=`whoami`
if [ "root" != $user ];then
    echo "The current user is not root."
    exit
fi

# 进入脚本所在目录
cd `dirname $0`

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

# 设置环境变量
su - oracle -c "sh ~/oracle/set-env.sh"

# 执行静默安装
su - oracle -c "sh ~/silent.sh"

# 安装后的配置
/u01/app/oraInventory/orainstRoot.sh
/u01/app/oracle/product/12.2.0/dbhome_1/root.sh

echo "End."