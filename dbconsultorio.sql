drop database dbConsultorio;

create database dbConsultorio;

use dbConsultorio;

create table tbMedicos(
idMedico int not null auto_increment,
nome varchar(100),
telefone char(10) unique,
primary key(idMedico)
);


create table tbPacientes(
idPaciente int not null auto_increment,
nome varchar(100),
telefone char(10) unique,
convenio varchar(100),
primary key(idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not	null auto_increment,
descricao varchar(100),
primary key(idReceitaMedica)
);

create table tbConsultas(
idConsulta int not null auto_increment,
data datetime,
idMedico int not null,
idPaciente int not null,
idReceitaMedica int not null,
primary key	(idConsulta),
foreign key(idMedico) references tbMedicos(idMedico),
foreign key(idPaciente) references tbPacientes(idPaciente),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedicos;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsultas;

-- inserindo registros

insert into tbMedicos(nome, telefone)values('Divaldo Antunes', '97523-4258');
insert into tbMedicos(nome, telefone)values('Marieta Regina', '97896-8741');
insert into tbMedicos(nome, telefone)values('Zenilda Fernandez', '92414-8596');

insert into tbPacientes(nome, telefone, convenio)values('Regina Marques Sampaio', '98525-7458','Porto Saude');
insert into tbPacientes(nome, telefone, convenio)values('Tatiana Valverde', '91525-7452','Amil');
insert into tbPacientes(nome, telefone, convenio)values('Amalia Cardoso', '91267-9874','Intermedica');
insert into tbPacientes(nome, telefone, convenio)values('Zilmar Da Silva Marques', '94562-3217','Notredame');
insert into tbPacientes(nome, telefone, convenio)values('Paulo Sergio Teixeira', '92589-9632','Sulamerica');

insert into tbReceitaMedica(descricao)values('Fazer exercicio fisico diariamente');
insert into tbReceitaMedica(descricao)values('Andar de bicicleta');
insert into tbReceitaMedica(descricao)values('Tomar suco');
insert into tbReceitaMedica(descricao)values('Brincar');
insert into tbReceitaMedica(descricao)values('Correr duas vezes na semana');

insert into tbConsultas(data, idMedico, idPaciente, idReceitaMedica)values('2024/06/18', 2, 5, 3);
insert into tbConsultas(data, idMedico, idPaciente, idReceitaMedica)values('2024/06/01', 1, 2, 1);
insert into tbConsultas(data, idMedico, idPaciente, idReceitaMedica)values('2024/06/10', 3, 1, 2);
insert into tbConsultas(data, idMedico, idPaciente, idReceitaMedica)values('2024/04/12', 2, 4, 5);

select med.nome as 'Medico', pac.nome as 'Paciente', rec.descricao as 'Receita' from tbConsultas as con inner join tbMedicos as med on con.idMedico = med.idMedico
inner join tbPacientes as pac on con.idPaciente = pac.idPaciente inner join tbReceitaMedica as rec on con.idReceitaMedica = rec.idReceitaMedica
where med.nome like '%z';


select med.nome as 'nome do medico',  pac.nome as 'nome do paciente' from tbMedicos as med inner join tbPacientes as pac on med.idMedico = pac.idPaciente;



--Pesquisando registros

select * from tbMedicos;
select * from tbPacientes;
select * from tbReceitaMedica;
select * from tbConsultas;




