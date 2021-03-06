CREATE TABLE capture_sessions (
    session_id SERIAL,
    user_id INTEGER NOT NULL,
    skin_color_id INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    out_of_date BOOL NOT NULL,
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
