--Case Insensitive Strings
CREATE EXTENSION citext;

CREATE TABLE users (
    user_id SERIAL,
    email CITEXT NOT NULL,
    pass TEXT NOT NULL
    PRIMARY KEY (user_id)
    SECONDARY KEY (email)
);

