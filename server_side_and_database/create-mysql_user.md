## How to Create User in Mysql Database
-- Create the user with the specified username, password, and host

	CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';

-- Grant replication client privileges to the user

	GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';

-- If necessary, grant additional privileges to the user for accessing the databases
-- Example: GRANT SELECT, INSERT, UPDATE, DELETE ON database_name.* TO 'holberton_user'@'localhost';

-- Flush privileges to apply the changes

	FLUSH PRIVILEGES;

-- Exit the MySQL prompt

	EXIT;
