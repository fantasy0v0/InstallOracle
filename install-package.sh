#!/bin/sh

#需要在root下执行
user=`whoami`
if [ "root" != $user ];then
    echo "The current user is not root."
    exit
fi

# 默认情况下CentOS 7需要安装的程序包
package=(compat-libcap1 gcc-c++ ksh libaio-devel)

for line in $package
do
	echo "installing $line..."
    yum install $line -y
done

echo "install Packages is Completed."
