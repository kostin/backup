rm -rf /backup/dbs
mkdir -p /backup/dbs
cd /backup/dbs
mysql -uroot -p`cat /root/.mysql-root-password` -N -e 'show databases' | while read dbname; do mysqldump -uroot -p`cat /root/.mysql-root-password` "$dbname" > "$dbname".sql; done
gzip /backup/dbs/*
