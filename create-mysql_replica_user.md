## How to Create User in Mysql Database
-- Create the replica user with the desired username, password, and host

	CREATE USER 'replica_user'@'%' IDENTIFIED BY 'your-password';

-- Grant replication slave privileges to the replica user

	GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';

-- Grant SELECT privileges on the mysql.user table to holberton_user

	GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';

-- Flush privileges to apply the changes

	FLUSH PRIVILEGES;

-- Exit the MySQL prompt
	EXIT;
