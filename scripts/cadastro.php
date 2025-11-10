<?php 
include_once('database.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nome  = $_POST['nome'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $hash = password_hash($senha, PASSWORD_DEFAULT);

    $stmt = $conexao->prepare("SELECT id FROM usuario WHERE email = ?");
    if (!$stmt) {
        die('Erro na preparação da consulta: ' . $conexao->error);
    }
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo 'Email já cadastrado';
        $stmt->free_result();  // libera o resultado
        $stmt->close();
        exit;
    }

    $stmt->free_result();  // libera o resultado
    $stmt->close();

    $sql = $conexao->prepare("INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)");
    if (!$sql) {
        die('Erro na preparação da consulta: ' . $conexao->error);
    }
    $sql->bind_param("sss", $nome, $email, $hash);

    if ($sql->execute()) {
        echo 'Sucesso';
    } else {
        echo 'Erro ao cadastrar: ' . $sql->error;
    }

    $sql->close();
} else {
    echo 'metodo_invalido';
}
?>