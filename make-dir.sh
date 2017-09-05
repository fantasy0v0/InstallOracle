#!/bin/sh
# Oracle基础目录
mkdir -p /u01/app/oracle/

# 设置目录属主
chown -R oracle:oinstall /u01

# 设置目录权限
chmod -R 755 /u01