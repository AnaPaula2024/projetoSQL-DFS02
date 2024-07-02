drop database DB_CDS;

create database DB_CDS;

use DB_CDS;

create table tbArtistas(
cod_Art int not null auto_increment, 
nome_Art varchar(100) not null unique,
primary key(cod_Art));

create table tbFuncionarios(
cod_Func int not null auto_increment,
nome_Func varchar(50) not null,
end_Func varchar(100) not null,
sal_Func decimal(9,2) not null default 0 check(sal_Func >= 0),
sexo_Func char(1) not null default 'F' check(sexo_Func in('F','M')), 
primary key(cod_Func));

create table tbGravadoras(
cod_Grav int not null auto_increment,
nome_Grav varchar (50) not null unique,
primary key(cod_Grav));

create table tbCategorias(
cod_Cat int not null auto_increment,
nome_Cat varchar(50) not null unique,
primary key(cod_Cat));

create table tbEstados(
sigla_Est char(2) not null,
nome_Est varchar(50) not null unique,
primary key(sigla_Est));

create table tbCidades(
cod_Cid int auto_increment not null,
nome_Cid varchar(50) not null,
sigla_Est char(2) not null,
primary key(cod_Cid),
foreign key(sigla_Est) references tbEstados(sigla_Est));

create table tbClientes(
cod_Cli int not null auto_increment,
nome_Cli varchar(50) not null,
end_Cli varchar(100) not null,
renda_Cli decimal(9,2) not null default 0 check(renda_Cli >= 0),
sexo_Cli char(1) not null default 'F' check(sexo_Cli in('F','M')),
cod_Cid int not null,
primary key(cod_Cli), 
foreign key(cod_Cid) references tbCidades(cod_Cid));

create table tbConjuge(
codConj int not null auto_increment,
nome_Conj varchar(50) not null,
renda_Conj decimal(9,2) not null default 0 check(renda_Conj >= 0),
sexo_Conj char(1) not null default 'F' check(sexo_Conj in('F','M')),
cod_Cli int not null, 
primary key(codConj),
foreign key(cod_Cli) references tbClientes(cod_Cli));

create table tbDependentes(
cod_Dep int not null auto_increment,
nome_Dep varchar(100) not null,
sexo_Dep char(1) not null default 'F' check(sexo_Dep in('F','M')),
cod_Func int not null, 
primary key(cod_Dep),
foreign key(cod_Func) references tbFuncionarios(cod_Func));

create table tbTitulos(
cod_Tit int not null auto_increment,
nome_CD varchar(50) not null unique,
val_CD decimal(9,2) not null check(val_CD > 0),
QTD_ESTQ int not null check(QTD_ESTQ >= 0),
cod_Cat int not null, 
cod_Grav int not null,
primary key(cod_Tit), 
foreign key(cod_Cat) references tbCategorias(cod_Cat),
foreign key(cod_Grav) references tbGravadoras(cod_Grav));

create table tbPedidos(
num_Ped int not null auto_increment,
data_Ped datetime not null,
val_Ped decimal(9,2) not null default 0 check(val_Ped >= 0),
cod_Cli int not null, 
cod_Func int not null,
primary key(num_Ped), 
foreign key(cod_Cli) references tbClientes(cod_Cli),
foreign key(cod_Func) references tbFuncionarios(cod_Func));

create table tbTitulos_pedido(
QTD_CD int not null check(QTD_CD >= 1),
val_CD decimal(9,2) not null check(val_CD > 0),
num_Ped int not null, 
cod_Tit int not null, 
foreign key(num_Ped) references tbPedidos(num_Ped),
foreign key(cod_Tit) references tbTitulos(cod_Tit));


create table tbTitulos_Artista(
cod_Tit int not null, 
cod_Art int not null, 
foreign key(cod_Tit) references tbTitulos(cod_Tit),
foreign key(cod_Art) references tbArtistas(cod_Art));


insert into tbArtistas(nome_Art)values('Marisa Monte');
insert into tbArtistas(nome_Art)values('Gilberto Gil');
insert into tbArtistas(nome_Art)values('Caetano Veloso');
insert into tbArtistas(nome_Art)values('Milton Nascimento');
insert into tbArtistas(nome_Art)values('Legiao Urbana');
insert into tbArtistas(nome_Art)values('The Beatles');
insert into tbArtistas(nome_Art)values('Rita Lee');

insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Vania Gabriela Pereira','Rua A', 2500.00, 'F');
insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Norberto Pereira Da Silva','Rua B', 300.00, 'M');	
insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Olavo Linhares','Rua C', 580.00, 'M');
insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Paula Da Silva','Rua D', 3000.00, 'F');
insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Rolando Rocha','Rua E', 2000.00, 'M');
insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Paulo Sergio Da Silva','Rua F', 1000.00, 'M');
insert into tbFuncionarios(nome_Func, end_Func, sal_Func, sexo_Func)values('Zilmar Pereira Rocha','Rua G', 6000.00, 'M');

insert into tbGravadoras(nome_Grav)values('EMI');
insert into tbGravadoras(nome_Grav)values('Som Livre');
insert into tbGravadoras(nome_Grav)values('Som Music');
insert into tbGravadoras(nome_Grav)values('Polygram');

insert into tbCategorias(nome_Cat)values('MPB');
insert into tbCategorias(nome_Cat)values('Trilha Sonora');
insert into tbCategorias(nome_Cat)values('Rock Internacional');
insert into tbCategorias(nome_Cat)values('Rock Nacional');

insert into tbEstados(sigla_Est, nome_Est)values('SP', 'Sao Paulo');
insert into tbEstados(sigla_Est, nome_Est)values('MG','Minas Gerais');
insert into tbEstados(sigla_Est, nome_Est)values('RJ','Rio de Janeiro');
insert into tbEstados(sigla_Est, nome_Est)values('ES','Espirito Santo');

insert into tbCidades(nome_Cid, sigla_Est)values('Sao Paulo','SP');
insert into tbCidades(nome_Cid, sigla_Est)values('Sorocaba', 'SP');
insert into tbCidades(nome_Cid, sigla_Est)values('Jundiai', 'SP');
insert into tbCidades(nome_Cid, sigla_Est)values('Americana', 'SP');
insert into tbCidades(nome_Cid, sigla_Est)values('Araraquara', 'SP');
insert into tbCidades(nome_Cid, sigla_Est)values('Ouro Preto', 'MG');
insert into tbCidades(nome_Cid, sigla_Est)values('Cachoeira do Itapemirim', 'ES');

insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Jose Nogueira', 'Rua A', 1500.00, 'M', 1);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Angelo Pereira','Rua B', 2000.00, 'M', 1);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Alem Mar Paranhos','Rua C', 1500.00, 'M',1);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Catarina  Souza', 'Rua D', 829.00, 'F',1);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Vagner Costa','Rua E', 950.00, 'M',1);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Antenor Da Costa','Rua F', 1582.00, 'M',2);	
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Maria Amelia De Souza','Rua G', 1152.00, 'F',2);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Paulo Roberto Silva','Rua H', 3250.00, 'M',2);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Fatima Souza','Rua I', 1632.00, 'F',3);
insert into tbClientes(nome_Cli, end_Cli, renda_Cli, sexo_Cli, cod_Cid)values('Joel Da Rocha','Rua J', 2000.00, 'M',3);

insert into tbConjuge(nome_Conj, renda_Conj, sexo_Conj,cod_Cli)values('Carla Nogueira', 2500.00, 'F',1);	
insert into tbConjuge(nome_Conj, renda_Conj, sexo_Conj,cod_Cli)values('Emilia Pereira', 5500.00, 'F',2);
insert into tbConjuge(nome_Conj, renda_Conj, sexo_Conj,cod_Cli)values('Altiva Da Costa', 3000.00, 'F',6);
insert into tbConjuge(nome_Conj, renda_Conj, sexo_Conj,cod_Cli)values('Carlos De Souza', 3250.00, 'M',7);

insert into tbDependentes(nome_Dep, sexo_Dep,cod_Func)values('Ana Pereira', 'F',1);
insert into tbDependentes(nome_Dep, sexo_Dep,cod_Func)values('Roberto Pereira', 'M',1);	
insert into tbDependentes(nome_Dep, sexo_Dep,cod_Func)values('Celso Pereira', 'M',1);
insert into tbDependentes(nome_Dep, sexo_Dep,cod_Func)values('Brisa Linhares','F',3);
insert into tbDependentes(nome_Dep, sexo_Dep,cod_Func)values('Mari Sol Linhares','F',3);
insert into tbDependentes(nome_Dep, sexo_Dep,cod_Func)values('Sonia Da Silva','F',4);

insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Tribalistas', 30.00, 1500,1, 1);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Tropicalia', 50.00, 500,1, 2);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Aquele Abraco',50.00, 600,1, 1);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Refazenda', 60.00, 1000,1, 2);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Totalmente Demais', 50.00, 2000,1, 3);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Travessia', 55.00, 500,1, 3);	
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Courage', 30.00, 200,1, 2);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Legiao Urbana', 20.00, 100,4, 3);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('The Beatles', 30.00, 300,3, 2);
insert into tbTitulos(nome_CD, val_CD, QTD_ESTQ, cod_Cat, cod_Grav)values('Rita Lee', 30.00, 500,4, 1);

insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/05/02', 1500.00, 1, 2);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/05/02', 50.00, 3, 4);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/06/02', 100.00, 4, 7);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/02/03', 200.00, 1, 4);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/03/03', 300.00, 7, 5);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/03/03', 100.00, 4, 4);	
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/03/03', 50.00, 5, 5);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/03/03', 50.00, 8, 2);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/03/03', 2000.00, 2, 2);
insert into tbPedidos(data_Ped, val_Ped,cod_Cli, cod_Func)values('02/03/03', 3000.00, 7, 1);

insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(2, 30.00, 1, 1);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(3, 20.00, 1, 2);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(1, 50.00, 2, 1);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(2, 30.00, 2, 3);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(2, 40.00, 3, 1);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(3, 20.00, 4, 2);	
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(2, 25.00, 5, 1);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(3, 30.00, 6, 2);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(1, 35.00, 6, 3);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(2, 55.00, 7, 4);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(4, 60.00, 8, 1);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(3, 15.00, 9, 2);
insert into tbTitulos_pedido(QTD_CD, val_CD, num_Ped, cod_Tit)values(2, 15.00, 10, 7);

insert into tbTitulos_Artista(cod_Tit, cod_Art)values(1,1);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(2,2);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(3,2);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(4,2);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(5,3);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(6,4);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(7,4);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(8,5);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(9,6);
insert into tbTitulos_Artista(cod_Tit, cod_Art)values(10,7);


select * from tbArtistas order by cod_Art asc;
select * from tbGravadoras order by cod_Grav asc;
select * from tbCategorias order by cod_Cat asc;
select * from tbEstados order by sigla_Est desc limit 3;
select cod_cid, nome_cid,sigla_Est from tbCidades;

-- desc tbArtistas;
-- desc tbFuncionarios;
-- desc tbGravadoras;
-- desc tbCategorias;
-- desc tbEstados;
-- desc tbCidades;
-- desc tbClientes;
-- desc tbConjuge;
-- desc tbDependentes; 
-- desc tbTitulos;
-- desc tbPedidos;
-- desc tbTitulos_pedido;
-- desc tbTitulos_Artista;


select * from tbArtistas;
select * from tbFuncionarios;
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbDependentes; 
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulos_pedido;
select * from tbTitulos_Artista;





-- Laboratório

-- Utilizando o banco de dados DB_CDS: 


--  1.Selecione o nome dos CDs e o nome da gravadora de cada CD.


select nome_CD as 'Nome do CD', nome_Grav as 'Nome da gravadora' from tbTitulos as tit inner join tbGravadoras as grav on tit.cod_Tit = grav.cod_Grav;



 -- 2.Selecione o nome dos CDs e o nome da categoria de cada CD. 



 -- 3.Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.



 -- 4.Selecione  o  nome  dos  clientes  e  os  títulos  dos  CDs vendidos  em  cada  pedido  que  o cliente fez.

select  cli.nome from tbPedidos on ped.cod_Func = func.cod_Func inner join tbClientes as cli on ped.cod_Cli = cli.cod_Cli



--  5.Selecione  o  nome  do  funcionário,  número,  data  e  valor   dos  pedidos  que  este funcionário registrou,
--   além do nome do cliente que está fazendo o pedido.



-- 6.Selecione  o  nome  dos  funcionários  e  o  nome  de  todos  os  dependentes  de  cada funcionário. 



-- 7.Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.  



-- 8.Selecione  o  nome  de  todos  os  clientes.  Se  estes  possuem  cônjuges,  mostrar  os  nomes 
-- de seus cônjuges também.



-- 9.Selecione  nome  do  cliente,  nome  do  cônjuge,  número do  pedido  que  cada  cliente  fez, 
-- valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada pedido. 

select cli.nome, conj.nome, numero, valor from tbPedidos as ped inner join tbClientes as cli on ped.cod_Cli = cli.cod_Cli
right join tbConjuge as conj on ped.num_Ped = conj.codConj