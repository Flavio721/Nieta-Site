<?php 
include_once('database.php'); // codigo com as informações do database

if ($_SERVER["REQUEST_METHOD"] === "POST") { // verifica se o metodo de requisição é POST
    $nome  = $_POST['nome'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $hash = password_hash($senha, PASSWORD_DEFAULT); // criptografar a senha

    $stmt = $conexao->prepare("SELECT id FROM usuario WHERE email = ?"); // prepara a conexao para inserir os dados
    if (!$stmt) {
        die('Erro na preparação da consulta: ' . $conexao->error); // se tiver algum erro ja retorna
    }
    $stmt->bind_param("s", $email); // verificando se o email ja existe
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo 'Email já cadastrado'; // se ja tiver 1 email retorna isso
        $stmt->free_result();  // libera o resultado
        $stmt->close();
        exit;
    }

    $stmt->free_result();  // libera o resultado
    $stmt->close();

    $sql = $conexao->prepare("INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)"); // faz a inserção de dados (codigo SQL normal)
    if (!$sql) {
        die('Erro na preparação da consulta: ' . $conexao->error);
    }
    $sql->bind_param("sss", $nome, $email, $hash);

    if ($sql->execute()) {
        echo 'Sucesso'; // mensagem se tiver tudo certo
    } else {
        echo 'Erro ao cadastrar: ' . $sql->error; // mensagem se der errado
    }

    $sql->close();
} else {
    echo 'metodo_invalido'; // se vier como metodo GET
}
?>