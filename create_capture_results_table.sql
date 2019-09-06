-- If there is not a calibrated skin color, then the processing failed...
CREATE TABLE capture_results (
    capture_id INTEGER,
    user_id INTEGER NOT NULL,
    backend_version TEXT NOT NULL,
    processed_date TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,
    calibrated_skin_color FLOAT [],
    dev_calibrated_skin_color FLOAT [],
    matched_skin_color_id INTEGER,
    successful BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (capture_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
