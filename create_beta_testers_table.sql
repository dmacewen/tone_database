CREATE TABLE beta_testers (
    user_id INTEGER,
    signed_nda BOOLEAN NOT NULL,
    nda_path TEXT,
    PRIMARY KEY user_id,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
