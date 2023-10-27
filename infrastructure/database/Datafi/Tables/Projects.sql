CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id VARCHAR(40) NOT NULL UNIQUE,
    project_time VARCHAR(40) NOT NULL,
    project_name VARCHAR(255) NOT NULL,
    project_description TEXT,
    project_client_name VARCHAR(255) NOT NULL,
    project_client_mail VARCHAR(255) NOT NULL,
    project_client_whatsapp VARCHAR(40) NOT NULL,
    project_account_id VARCHAR(255) NOT NULL,
    comunity_id VARCHAR(40) NOT NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci