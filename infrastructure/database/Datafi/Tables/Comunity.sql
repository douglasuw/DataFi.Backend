CREATE TABLE comunity (
    id INT IDENTITY(1,1) PRIMARY KEY,
    comunity_id VARCHAR(40) NOT NULL UNIQUE,
    comunity_time VARCHAR(40) NOT NULL,
    comunity_name VARCHAR(255) NOT NULL,
    comunity_user VARCHAR(255) NOT NULL,
    comunity_mail VARCHAR(255) NOT NULL,
    comunity_pass VARCHAR(255) NOT NULL
)


