-- Capture ids should increase sequentially for each user....
CREATE TABLE captures (
    capture_id INTEGER,
    session_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    app_version TEXT NOT NULL,
    device_id TEXT NOT NULL,
    capture_date TIMESTAMP NOT NULL,
    capture_data JSON NOT NULL,
    capture_path TEXT NOT NULL,
    PRIMARY KEY (capture_id),
    FOREIGN KEY session_id REFERENCES capture_sessions (session_id),
    FOREIGN KEY user_id REFERENCES users (user_id)
)
