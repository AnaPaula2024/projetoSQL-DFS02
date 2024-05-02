-- apagando bd se existir
drop database dbLoja;

-- criando bd
create database dbLoja;

-- acessando bd
use dbLoja;

-- visualizando banco de dados
show databases;

-- criando as tabelas no bd
create table tbUsuarios(
codUsu int,
nome varchar(50),
senha varchar(20)
);

create table tbFuncionarios(
codfunc int,
nome varchar(100),
email varchar (100),
cpf char(14),
telCel char(10)
);

-- visualizando as tabelas criadas
show tables;

-- visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;

-- inserindo registros nas tabelas

insert into tbUsuarios(codUsu,nome,senha)
	values(1,'ana.paula','deximbranco');

	insert into tbFuncionarios(codfunc,nome,email,cpf,telCel)
	values(1,'Ana Paula Pereira Viana',
		'paulinhapv22@gmail.com', '524.298.712-35','98562-2563');

-- visualizando os registros nos campos das tabelas
select * from tbUsuarios;
select * from tbFuncionarios;