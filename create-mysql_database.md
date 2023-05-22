## How Create Database, Table and Insert Record
-- Create the database

	CREATE DATABASE database_name;

-- Switch to the newly created database

	USE database_name;

-- Create the table
```CREATE TABLE table_name (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);
```
-- Insert a row into the table

	INSERT INTO table_name (name) VALUES ('Entry 1');

-- Grant SELECT permissions to holberton_user on the table

	GRANT SELECT ON database_name.table_name TO 'holberton_user'@'localhost';

-- Flush privileges to apply the changes

	FLUSH PRIVILEGES;

-- Exit the MySQL prompt

	EXIT;
