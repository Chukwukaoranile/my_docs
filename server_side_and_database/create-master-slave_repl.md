
	sudo ufw allow from replica_server_ip to any port 3306

	sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```
server-id	= 1
log_bin		= /var/log/mysql/mysql-bin.log
binlog_do_db	= db

Restart Mysql

	sudo systemctl restart mysql

	sudo mysql

	mysql -u sammy -p

	CREATE USER 'replica_user'@'replica_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';

	GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'replica_server_ip';

	FLUSH PRIVILEGES;

	FLUSH TABLES WITH READ LOCK;

	SHOW MASTER STATUS;

This is the position from which the replica will start copying database events. Record the File name and the Position value, as you will need these later when you initiate replication.

	UNLOCK TABLES;

	CREATE DATABASE db;

Add Records to the database

```
CREATE TABLE table_name (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255)
);

```
If you have data on your source MySQL instance that you want to migrate to your replicas, you can do so by creating a snapshot of the database with the mysqldump utility. However, your database should still be currently locked. If you make any new changes in the same window, the database will automatically unlock. Likewise, the tables will automatically unlock if you exit the client.

Unlocking the tables could lead to problems since it would mean that clients could again change the data in the database. This could potentially lead to a mismatch between your data snapshot and the binary log coordinates you just retrieved.

For this reason, you must open a new terminal window or tab on your local machine so you can create the database snapshot without unlocking MySQL.

From the new terminal window or tab, open up another SSH session to the server hosting your source MySQL instance:

	ssh sammy@source_server_ip

Then, from the new tab or window, export your database using mysqldump. The following example creates a dump file named db.sql from a database named db, but make sure you include the name of your own database instead. Also, be sure to run this command in the bash shell, not the MySQL shell:

	sudo mysqldump -u root db > db.sql

	UNLOCK TABLES;

	exit

	scp db.sql sammy@replica_server_ip:/tmp/

Be sure to replace sammy with the name of the administrative Ubuntu user profile you created on your replica server, and to replace replica_server_ip with the replica server’s IP address. Also, note that this command places the snapshot in the replica server’s /tmp/ directory.

After sending the snapshot to the replica server, SSH into it:

	ssh sammy@replica_server_ip

Then open up the MySQL shell:

	sudo mysql

From the prompt, create the new database that you will be replicating from the source:

	CREATE DATABASE db;

You don’t need to create any tables or load this database with any sample data. That will all be taken care of when you import the database using the snapshot you just created. Instead, exit the MySQL shell:

	exit

Then import the database snapshot:

	sudo mysql db < /tmp/db.sql

Your replica now has all the existing data from the source database. You can complete the final step of this guide to configure your replica server to begin replicating new changes made on the source database.

	sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

	server-id	= 2
	log_bin		= /var/log/mysql/mysql-bin.log
	binlog_do_db	= db
	relay-log	= /var/log/mysql/mysql-relay-bin.log

Restart Mysql

	sudo systemctl restart mysql
At this point, both of your MySQL instances are fully configured to allow replication. To start replicating data from your source, open up the the MySQL shell on your replica server:

	sudo mysql

From the prompt, run the following operation, which configures several MySQL replication settings at the same time.
```
CHANGE MASTER TO
SOURCE_HOST='source_server_ip',
SOURCE_USER='replica_user',
SOURCE_PASSWORD='password',
SOURCE_LOG_FILE='mysql-bin.000001',
SOURCE_LOG_POS=899;
```
Following that, activate the replica server:

	START SLAVE;

SHOW SLAVE STATUS\G;
This command returns a lot of information which can be helpful when troubleshooting:
