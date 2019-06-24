-- NOTE: Keeping user settings in seperate table to try and ease the eventual transition to a managed user authentication down the road
-- Settings stored as JSON because we never need to query them, only return the values to the users on login
CREATE TABLE user_settings (
    user_id INTEGER,
    settings JSON,
    PRIMARY KEY user_id
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
