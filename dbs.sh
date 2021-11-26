#!/bin/sh
DATE=`date "+%Y-%m-%d"`
DBPASS=`cat /root/.mysql-root-password`
HOST=`hostname`

rm -rf /backup/dbs
mkdir -p /backup/dbs
cd /backup/dbs
mysql -uroot -p${DBPASS} -N -e 'show databases' | while read dbname; do mysqldump -uroot p${DBPASS} "$dbname" > "$dbname".sql; done
gzip /backup/dbs/*
