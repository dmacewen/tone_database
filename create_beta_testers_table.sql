CREATE TABLE beta_testers (
    user_id INTEGER,
    acknowledge_confidentiality BOOLEAN NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
