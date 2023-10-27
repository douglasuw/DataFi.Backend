

CREATE TABLE sessions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    session_id VARCHAR(40) NOT NULL UNIQUE,
    session_time VARCHAR(40) NOT NULL,
    session_expire VARCHAR(40) NOT NULL,
    comunity_id VARCHAR(40) NOT NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
)
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci