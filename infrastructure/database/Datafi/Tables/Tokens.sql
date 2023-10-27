CREATE TABLE tokens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    token_id VARCHAR(40) NOT NULL UNIQUE,
    token_time VARCHAR(40) NOT NULL,
    token_name VARCHAR(255) NOT NULL,
    token_value VARCHAR(255) NOT NULL,
    comunity_id VARCHAR(40) NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci