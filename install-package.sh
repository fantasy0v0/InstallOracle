#!/bin/sh

# 默认情况下CentOS 7需要安装的程序包
package=(compat-libcap1 gcc-c++ ksh libaio-devel unzip)

for line in ${package[@]}
do
    echo "installing $line..."
    yum install $line -y
done

echo "install Packages is Completed."
