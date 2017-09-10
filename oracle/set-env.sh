#!/bin/sh
user=`whoami`
if [ "oracle" != $user ];then
    echo "The current user is not oracle."
    exit
fi

filePath=~/.bash_profile

echo "" >> $filePath
echo "export ORACLE_BASE=/u01/app/oracle" >> $filePath
echo "export ORACLE_HOME=\$ORACLE_BASE/product/12.2.0/dbhome_1" >> $filePath
echo "export ORACLE_SID=ORCL" >> $filePath
echo "export PATH=.:\$ORACLE_HOME/bin:\$ORACLE_HOME/OPatch:\$ORACLE_HOME/jdk/bin:\$PATH" >> $filePath
echo "export LC_ALL=\"en_US\"" >> $filePath
echo "export LANG=\"en_US\"" >> $filePath
echo "export NSL_LANG=\"AMERICAN_AMERICA.ZHS16GBK\"" >> $filePath
echo "export NLS_DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS\"" >> $filePath
echo "export DISTRIB=/u01/database" >> $filePath
echo "" >> $filePath

. $filePath

echo "set env is Completed."
