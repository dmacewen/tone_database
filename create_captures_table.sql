-- Capture ids should increase sequentially for each user....
-- ^Changed my mind. Capture ids should reflect ordering, but since changes to the server might change which captures
--  We care about, the actual numbers dont matter.... I dont think. Might think this over a little more...
CREATE TABLE captures (
    capture_id SERIAL,
    session_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    app_version TEXT NOT NULL,
    device_id TEXT NOT NULL,
    capture_date TIMESTAMP NOT NULL,
    capture_data JSON NOT NULL,
    capture_path TEXT NOT NULL,
    PRIMARY KEY (capture_id),
    FOREIGN KEY (session_id) REFERENCES capture_sessions (session_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
