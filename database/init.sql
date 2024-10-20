-- https://cadu.dev/creating-a-docker-image-with-database-preloaded/

CREATE DATABASE goproject;

ALTER DATABASE goproject OWNER TO postgres;

\connect goproject

CREATE TABLE users (username text PRIMARY KEY, "password" text);
ALTER TABLE users OWNER TO postgres;


CREATE TABLE usersessions (username text PRIMARY KEY REFERENCES Users(username), token text);
ALTER TABLE usersessions OWNER TO postgres;


CREATE TABLE messages(uuid text PRIMARY KEY, created_at DATE, sender_username text REFERENCES Users(username), upvotes integer, downvotes integer, content VARCHAR(1024));
ALTER TABLE messages OWNER TO postgres;

-- Write the table shcema, and relations that you want so that you can preload the postgres images with the table. 
-- An example is given below.

-- CREATE TABLE Users (id text PRIMARY KEY, username text UNIQUE, hashed_password text);

-- CREATE TABLE Messages(id text, created_at DATE, sender_id text, upvotes integer, downvotes integer, content text, sender_name text, PRIMARY KEY(id));

-- ALTER TABLE Users OWNER TO postgres;
-- ALTER TABLE Messages OWNER TO postgres;

-- INSERT INTO Users VALUES
-- (101, 'user1', 'password'),
-- (102, 'user2', 'password'),
-- (103, 'user3', 'password'),
-- (104, 'user4', 'password'),
-- (105, 'user5', 'password'),
-- (106, 'user6', 'password'),
-- (107, 'user7', 'password'),
-- (108, 'user8', 'password');