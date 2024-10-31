-- Create users table with roles, email (optional), and age (optional)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) DEFAULT NULL,
    -- Allow NULL
    age INT DEFAULT NULL,
    -- Allow NULL
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user' -- Role for admin or user
);
-- Create additional table and insert data
CREATE TABLE IF NOT EXISTS other_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
-- Insert default admin user (mehrnaz) into the users table
-- You must replace '${ADMIN_PASSWORD}' with the actual password or an environment variable if using envsubst
INSERT INTO users (username, email, age, password, role)
VALUES (
        '${MYSQL_USER}',
        NULL,
        NULL,
        '${MYSQL_PASSWORD}',
        'admin'
    );
-- Flush privileges (not necessary for app-level users, but keeping in case)
FLUSH PRIVILEGES