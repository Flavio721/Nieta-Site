create database nieta;
use nieta;
create table usuario(
	id int primary key auto_increment,
    nome varchar(45),
    email varchar(60),
    senha varchar(12)
);

select * from usuario;