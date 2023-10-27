CREATE TABLE templates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    template_id VARCHAR(40) NOT NULL UNIQUE,
    template_time VARCHAR(40) NOT NULL,
    template_name VARCHAR(255) NOT NULL,
    template_description TEXT,
    template_parameters VARCHAR(4000) NOT NULL,
    template_active BOOLEAN,
    comunity_id VARCHAR(40) NOT NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci