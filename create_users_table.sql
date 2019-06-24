--Case Insensitive Strings
CREATE EXTENSION citext;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email CITEXT SECONDARY KEY,
    pass TEXT NOT NULL
);

