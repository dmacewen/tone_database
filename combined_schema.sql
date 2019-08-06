--Case Insensitive Strings
CREATE EXTENSION citext;
CREATE TABLE users (
    user_id SERIAL,
    email CITEXT UNIQUE NOT NULL,
    pass TEXT NOT NULL,
    token integer,
    PRIMARY KEY (user_id)
);

-- NOTE: Keeping user settings in seperate table to try and ease the eventual transition to a managed user authentication down the road
-- Settings stored as JSON because we never need to query them, only return the values to the users on login
CREATE TABLE user_settings (
    user_id INTEGER,
    settings JSON,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
CREATE TABLE beta_testers (
    user_id INTEGER,
    acknowledge_confidentiality BOOLEAN NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
CREATE TABLE capture_sessions (
    session_id SERIAL,
    user_id INTEGER NOT NULL,
    skin_color_id INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    out_of_date BOOL NOT NULL,
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
-- Capture ids should increase sequentially for each user....
-- ^Changed my mind. Capture ids should reflect ordering, but since changes to the server might change which captures
--  We care about, the actual numbers dont matter.... I dont think. Might think this over a little more...
CREATE TABLE captures (
    capture_id SERIAL,
    session_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    app_version TEXT NOT NULL,
    device_info JSON NOT NULL,
    capture_date TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    capture_metadata JSON NOT NULL,
    PRIMARY KEY (capture_id),
    FOREIGN KEY (session_id) REFERENCES capture_sessions (session_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
-- If there is not a calibrated skin color, then the processing failed...
CREATE TABLE capture_results (
    capture_id INTEGER,
    user_id INTEGER NOT NULL,
    backend_version TEXT NOT NULL,
    processed_date TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    calibrated_skin_color FLOAT [],
    matched_skin_color_id INTEGER,
    PRIMARY KEY (capture_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
