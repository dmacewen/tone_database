CREATE TABLE capture_sessions (
    user_id INTEGER,
    session_id INTEGER,
    skin_color_id INTEGER,
    start_date TIMESTAMP,
    PRIMARY KEY (session_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
)
