-- In Terminal

mysqldump --flush-logs articles > articles_backup.sql -u root -p

-- In MySQL

Create Database restored;

-- In Terminal

mysql restored < articles_backup.sql -u root -p

-- In MySQL

Use restored;
Show tables;
