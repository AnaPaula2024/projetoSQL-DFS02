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
nome_Cli varchar(50) not null,
end_Cli varchar(100) not null,
renda_Cli decimal(9,2) not null default 0 check(renda_Cli >= 0),
sexo_Cli char(1) not null default 'F' check(sexo_Cli in('F','M')),
cod_Cli int not null auto_increment,
cod_Cid int not null,
primary key(cod_Cli), 
foreign key(cod_Cid) references tbCidades(cod_Cid));

create table tbConjuge(
nome_Conj varchar(50) not null,
renda_Conj decimal(9,2) not null default 0 check(renda_Conj >= 0),
sexo_Conj char(1) not null default 'F' check(sexo_Conj in('F','M')),
codConj int not null auto_increment,
cod_Cli int not null, 
primary key(codConj),
foreign key(cod_Cli) references tbClientes(cod_Cli));

create table tbDependentes(
nome_Dep varchar(100) not null,
sexo_Dep char(1) not null default 'F' check(sexo_Dep in('F','M')),
cod_Dep int not null auto_increment,
cod_Func int not null, 
primary key(cod_Dep),
foreign key(cod_Func) references tbFuncionarios(cod_Func));

create table tbTitulos(
nome_CD varchar(50) not null unique,
val_CD decimal(9,2) not null check(val_CD > 0),
QTD_ESTQ int not null check(QTD_ESTQ >= 0),
cod_Tit int not null auto_increment,
cod_Cat int not null, 
cod_Grav int not null,
primary key(cod_Tit), 
foreign key(cod_Cat) references tbCategorias(cod_Cat),
foreign key(cod_Grav) references tbGravadoras(cod_Grav));

create table tbPedidos(
data_Ped datetime not null,
val_Ped decimal(9,2) not null default 0 check(val_Ped >= 0),
num_Ped int not null auto_increment,
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
insert into tbArtistas(nome_Art)values('Legião Urbana');
insert into tbArtistas(nome_Art)values('The Beatles');
insert into tbArtistas(nome_Art)values('Rita Lee');

insert into tbGravadoras(nome_Grav)values('Polygram');
insert into tbGravadoras(nome_Grav)values('EMI');
insert into tbGravadoras(nome_Grav)values('Som Livre');
insert into tbGravadoras(nome_Grav)values('Som Music');

insert into tbCategorias(nome_Cat)values('MPB');
insert into tbCategorias(nome_Cat)values('Trilha Sonora');
insert into tbCategorias(nome_Cat)values('Rock Internacional');
insert into tbCategorias(nome_Cat)values('Rock Nacional');

desc tbArtistas;
desc tbFuncionarios;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbDependentes; 
desc tbTitulos;
desc tbPedidos;
desc tbTitulos_pedido;
desc tbTitulos_Artista;


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







