<?php
$servername = "localhost";
$username = "leitor";
$password = "f56sd4g5df64g56f4gb56d4b65g46h";
$dbname = "datafi";

// Cria conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Criação da tabela 'comunity'
$sql_comunity = "CREATE TABLE comunity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comunity_id VARCHAR(40) NOT NULL UNIQUE,
    comunity_time VARCHAR(40) NOT NULL,
    comunity_name VARCHAR(255) NOT NULL,
    comunity_user VARCHAR(255) NOT NULL,
    comunity_mail VARCHAR(255) NOT NULL,
    comunity_pass VARCHAR(255) NOT NULL
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci";
$conn->query($sql_comunity);

// Criação da tabela 'sessions'
$sql_sessions = "CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id VARCHAR(40) NOT NULL UNIQUE,
    session_time VARCHAR(40) NOT NULL,
    session_expire VARCHAR(40) NOT NULL,
    comunity_id VARCHAR(40) NOT NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci";
$conn->query($sql_sessions);

// Criação da tabela 'tokens'
$sql_tokens = "CREATE TABLE tokens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    token_id VARCHAR(40) NOT NULL UNIQUE,
    token_time VARCHAR(40) NOT NULL,
    token_name VARCHAR(255) NOT NULL,
    token_value VARCHAR(255) NOT NULL,
    comunity_id VARCHAR(40) NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci";
$conn->query($sql_tokens);

// Criação da tabela 'projects'
$sql_projects = "CREATE TABLE projects (
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
COLLATE utf8mb4_unicode_ci";
$conn->query($sql_projects);

// Criação da tabela 'templates'
$sql_templates = "CREATE TABLE templates (
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
COLLATE utf8mb4_unicode_ci";
$conn->query($sql_templates);

// Criação da tabela 'signatures'
$sql_signatures = "CREATE TABLE signatures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    signature_id VARCHAR(40) NOT NULL UNIQUE,
    signature_period VARCHAR(40) NOT NULL,
    signature_method VARCHAR(40) NOT NULL,
    signature_status VARCHAR(40) NOT NULL,
    comunity_id VARCHAR(40) NOT NULL,
    FOREIGN KEY (comunity_id) REFERENCES comunity(comunity_id)
) ENGINE=MyISAM
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci";
$conn->query($sql_signatures);

// Encerra conexão
$conn->close();
?>
