-- Create the database
CREATE DATABASE tyrell_corp;

-- Switch to the newly created database
USE tyrell_corp;

-- Create the table
CREATE TABLE nexus6 (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Insert a row into the table
INSERT INTO nexus6 (name) VALUES ('Entry 1');

-- Grant SELECT permissions to holberton_user on the table
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;

-- Exit the MySQL prompt
EXIT;
