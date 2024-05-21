drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGeneros(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);

create table tbAutores(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);

create table tbClientes(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idCliente)
);



create table tbLivros(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal (9,2),
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGeneros(idGenero)
);

create table tbVendas(
idVenda int not null auto_increment,
data date,
total decimal (9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbClientes(idCliente)
);

create table tbItens_Das_Vendas(
idVenda int not null,
idLivro int not null,
quantidade int,
subTotal decimal(9,2),
foreign key(idVenda) references tbVendas(idVenda),
foreign key(idLivro) references tbLivros(idLivro)
);

create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivros(idLivro),
foreign key(idAutor) references tbAutores(idAutor)
);


desc tbLivros;
desc tbAutores;
desc tbClientes;
desc tbGeneros;
desc tbEscreve;
desc tbVendas;
desc tbItens_Das_Vendas;

-- cadastrando os registros nas tabelas
insert into tbGeneros(descricao)values('Acao');
insert into tbGeneros(descricao)values('Ficcao');
insert into tbGeneros(descricao)values('Aventura');
insert into tbGeneros(descricao)values('Terror');
insert into tbGeneros(descricao)values('Comedia');
insert into tbGeneros(descricao)values('Romance');
insert into tbGeneros(descricao)values('Documentario');


insert into tbAutores(nome, email)values('Colleen Hoover', 'colleenhover14@gmail.com');
insert into tbAutores(nome, email)values('Daniel Goleman', 'danielgoleman@gmail.com');
insert into tbAutores(nome, email)values('Lori Gottlieb', 'lorigottlieb@hotmail.com');
insert into tbAutores(nome, email)values('DR. Julie Smith', 'dr.julie.smith@hotmail.com');
insert into tbAutores(nome, email)values('Ryan Holiday', 'ryanholiday58@gmail.com');
insert into tbAutores(nome, email)values('Michael Losier', 'michaellosierkk@hotmail.com');
insert into tbAutores(nome, email)values('Heni Ozi Cukier', 'heniozicukier@gmail.com');


insert into tbClientes(nome, telefone)values('Ana Paula Alves Barreto', '9526-4579');
insert into tbClientes(nome, telefone)values('Paulo Sergio Goveia', '9364-5748');
insert into tbClientes(nome, telefone)values('Viviane Teixeira', '5829-4529');


insert into tbLivros(titulo, preco, estoque, idGenero)values('E Assim que acaba', 46.10, 5, 6);
insert into tbLivros(titulo, preco, estoque, idGenero)values('Inteligencia emocional', 63.90, 10, 7); 
insert into tbLivros(titulo, preco, estoque, idGenero)values('Talvez Voce deva conversar com alguem', 59.93, 2, 5);
insert into tbLivros(titulo, preco, estoque, idGenero)values('Porque ninguem me disse isso antes', 34.55, 6, 3);

insert into tbVendas(data,total,idCliente)values('2024-05-16', 150.50,2);
insert into tbVendas(data,total,idCliente)values('2024-05-16', 267.80,3);
insert into tbVendas(data,total,idCliente)values('2024-05-16', 523.70,1);

insert into tbItens_Das_Vendas(idVenda,idLivro,quantidade,subTotal)values(1,4,5, 150.50);
insert into tbItens_Das_Vendas(idVenda,idLivro,quantidade,subTotal)values(2,3,8, 128.80);
insert into tbItens_Das_Vendas(idVenda,idLivro,quantidade,subTotal)values(3,1,20, 347.90);

insert into tbEscreve(idLivro,idAutor)values(4,7);
insert into tbEscreve(idLivro,idAutor)values(3,5);
insert into tbEscreve(idLivro,idAutor)values(1,6);


-- Pesquisar os campos das tabelas
select * from tbGeneros;
select * from tbAutores;
select * from tbClientes;
select * from tbLivros;
select * from tbVendas;
select * from tbItens_Das_Vendas;
select * from tbEscreve;

-- Alterando registros das tabelas

update tbClientes set nome = 'Delfina Delgado' where idCliente = 2;
update tbClientes set nome = 'Arlindo Esmeraldo',
	telefone = '9995-5278' where idCliente = 1;


select * from tbClientes;

update tbLivros set titulo = 'E Assim que acaba', preco = 39.90, estoque = 10, idGenero = 4
	where idLivro = 1;

update tbLivros set titulo = 'Inteligencia emocional', preco = 109.30, estoque = 7, idGenero = 7
	where idLivro = 2;

update tbLivros set titulo = 'O Iluminado', preco = 89.45, estoque = 3, idGenero = 2 where idLivro = 4;

select * from tbLivros;

--Apagando o registro da tabela

delete from tbItens_Das_Vendas where idVenda = 2;

delete from tbVendas where idCliente = 1;

delete from tbClientes where idCliente = 1;

select * from tbItens_Das_Vendas;
select * from tbVendas;
select * from tbClientes

