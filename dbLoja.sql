-- apagando bd se existir
drop database dbLoja;

-- criando bd
create database dbLoja;

-- acessando bd
use dbLoja;

-- visualizando banco de dados
show databases;

-- criando as tabelas no bd
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar (100) not null,
email varchar (100),
cpf char(14) not null unique,
telCel char(10),
logradouro varchar(100),
numero varchar(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
cnpj char(16) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int auto_increment,
nome varchar(50),
senha varchar(20),
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProduto(
codProd int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
data date,
hora time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

-- visualizando as tabelas criadas
show tables;

-- visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;

-- inserindo registros nas tabelas
insert into tbFuncionarios(nome,email,cpf,telCel, logradouro, 
	numero, cep, bairro, cidade, estado)
	values('Maria Gabrielly Benjamin',
		'mariagabyvidas2024@outlook.com', '524.298.712-35','98562-2563', 'Rua Dr. Antonio Bento', '355',
		'04750-000', 'Santo Amaro', 'Sao Paulo', 'SP');	

	insert into tbFuncionarios(nome,email,cpf,telCel, logradouro, 
	numero, cep, bairro, cidade, estado)
	values('Ana Frios Delgado Matarazzo',
		'ana.fdMatarazzo@hotmail.com', '278.857.764-74','92384-4785', 'Rua da Alegria', '135',
		'04654-000', 'Santo Amaro', 'Sao Paulo', 'SP');	

	insert into tbUsuarios(nome,senha,codFunc)
	values('maria.gabrielly','deximbranco',1);
	insert into tbUsuarios(nome,senha, codFunc)
	values('ana.fdmatarazzo','123456',2);

-- visualizando os registros nos campos das tabelas

select * from tbFuncionarios;
select * from tbUsuarios;
