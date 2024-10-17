CREATE DATABASE IF NOT EXISTS `docker_mysql`;
USE `docker_mysql`;

-- You can add any initial table creation or data insertion here
-- Create a sample 'users' table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a sample 'posts' table
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data into the 'users' table
INSERT INTO users (username, email) VALUES
    ('john_doe', 'john@example.com'),
    ('jane_smith', 'jane@example.com'),
    ('bob_johnson', 'bob@example.com');

-- Insert sample data into the 'posts' table
INSERT INTO posts (user_id, title, content) VALUES
    (1, 'First Post', 'This is the content of the first post.'),
    (1, 'Second Post', 'Another post by John Doe.'),
    (2, 'Hello World', 'Jane Smith says hello to the world.'),
    (3, 'Interesting Topic', 'Bob Johnson shares his thoughts on an interesting topic.');

-- You can now query this data, for example:
-- SELECT * FROM users;
-- SELECT * FROM posts;
-- SELECT u.username, p.title, p.content FROM users u JOIN posts p ON u.id = p.user_id;
