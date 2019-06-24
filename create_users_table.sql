--Case Insensitive Strings
CREATE EXTENSION citext;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email CITEXT SECONDARY KEY,
    pass TEXT NOT NULL
);

