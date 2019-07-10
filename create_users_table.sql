CREATE TABLE users (
    user_id SERIAL,
    email CITEXT UNIQUE NOT NULL,
    pass TEXT NOT NULL,
    token integer,
    PRIMARY KEY (user_id)
);

