#!/bin/sh
# 建立产品清单管理组
groupadd oinstall
# 建立数据库安装组
groupadd dba
# 建立ASM管理组
groupadd asmadmin
# 建立Grid管理组
groupadd asmdba
# oinstall 为主要组，并且要确保目录 /home/oracle 不存在
useradd -g oinstall -G dba,asmdba oracle -d /home/oracle