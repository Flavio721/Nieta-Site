<?php
include_once('database.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST['email'] ?? null;
    $senha = $_POST['senha'] ?? null;

    if (!$email || !$senha) {
        die("Preencha todos os campos");
    }

    // Preparar consulta para buscar o usuário pelo email
    $stmt = $conexao->prepare("SELECT senha FROM usuario WHERE email = ?");
    if (!$stmt) {
        die("Erro na preparação da consulta: " . $conexao->error);
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 0) {
        // Usuário não encontrado
        echo "Email ou senha incorretos";
        $stmt->close();
        exit;
    }

    $stmt->bind_result($hashArmazenado);
    $stmt->fetch();

    $stmt->close();

    // Verificar a senha
    if (password_verify($senha, $hashArmazenado)) {
        // Senha correta
        echo "Sucesso";
        // Aqui você pode iniciar a sessão, redirecionar, etc.
    } else {
        // Senha incorreta
        echo "Email ou senha incorretos";
    }
} else {
    echo "Método inválido";
}
?>