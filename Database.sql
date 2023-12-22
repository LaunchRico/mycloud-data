CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Documents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE DocumentVersions (
    id SERIAL PRIMARY KEY,
    document_id INTEGER,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    route VARCHAR(100),
    FOREIGN KEY (document_id) REFERENCES Documents(id) ON DELETE CASCADE
);

-- Seed script for Users table
INSERT INTO Users (name, email, password, username)
VALUES
    ('John Doe', 'john@example.com', 'password123', 'johndoe'),
    ('Alice Smith', 'alice@example.com', 'pass456', 'alicesmith'),
    ('Bob Johnson', 'bob@example.com', 'bobjohnsonpass', 'bobby');

-- Seed script for Documents table
INSERT INTO Documents (name, user_id)
VALUES
    ('Document 1', 1),
    ('Document 2', 2),
    ('Document 3', 1);

-- Seed script for DocumentVersions table
INSERT INTO DocumentVersions (document_id, route)
VALUES
    (1, '/path/to/document1'),
    (2, '/path/to/document2'),
    (3, '/path/to/document3');
