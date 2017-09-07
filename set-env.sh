#!/bin/sh
user=`whoami`
if [ "oracle" != $user ];then
    echo "The current user is not oracle."
    exit
fi


echo "" >> ~/.bash_profile
echo "export ORACLE_HOSTNAME=ORCL" >> ~/.bash_profile
echo "export ORACLE_BASE=/u01/app/oracle" >> ~/.bash_profile
echo "export ORACLE_HOME=\$ORACLE_BASE/product/11.2.0/dbhome_1" >> ~/.bash_profile
echo "export ORACLE_SID=ORCL" >> ~/.bash_profile
echo "export PATH=.:\$ORACLE_HOME/bin:\$ORACLE_HOME/OPatch:\$ORACLE_HOME/jdk/bin:\$PATH" >> ~/.bash_profile
echo "export LC_ALL=\"en_US\"" >> ~/.bash_profile
echo "export LANG=\"en_US\"" >> ~/.bash_profile
echo "export NSL_LANG=\"AMERICAN_AMERICA.ZHS16GBK\"" >> ~/.bash_profile
echo "export NLS_DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS\"" >> ~/.bash_profile
echo "export DISTRIB=/u01/database" >> ~/.bash_profile
echo "" >> ~/.bash_profile

. ~/.bash_profile
