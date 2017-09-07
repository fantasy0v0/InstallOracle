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

# 新增用户与用户组
sh make-group-user.sh

# 创建Oracle目录
sh make-dir.sh

# 修改属主为oracle
chown oracle:oinstall set-env.sh
# 并移动到oracle家目录下
mv set-env.sh /home/oracle

# 添加环境变量
su - oracle -c "sh ~/set-env.sh"

# 修改oracle安装文件压缩包的属主
chown oracle:oinstall linuxx64_12201_database.zip
# 移动到oracle家目录
mv linuxx64_12201_database.zip /home/oracle
# 解压
su - oracle -c "unzip linuxx64_12201_database.zip"
