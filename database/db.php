<?php
$servername = "localhost";
$username = "leitor";
$password = "f56sd4g5df64g56f4gb56d4b65g46h";
$dbname = "datafi";

// Cria conexão com o banco de dados
$conn = new mysqli($servername, $username, $password);

// Verifica conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Criação do banco de dados
$sql_db = "CREATE DATABASE ".$dbname."
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
";
$conn->query($sql_db);

// Encerra conexão
$conn->close();
?>
