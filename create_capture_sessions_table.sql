CREATE TABLE capture_sessions (
    session_id INTEGER,
    user_id INTEGER NOT NULL,
    skin_color_id INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL,
    PRIMARY KEY (session_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
)
