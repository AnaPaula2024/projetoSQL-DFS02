drop database dbBoteco;

create database dbBoteco;

use dbBoteco;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar (100),
email varchar (100),
telefone char (12),
endereco varchar (100),
numero varchar (100),
cep char (9),
bairro varchar (100),
cidade varchar (100),
estado char (9),
primary key (codFunc)
);



insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) values ('Ana Paula', 'aninhappv2024@gmail.com', '1195385-7812', 'Rua viva la vida',
 '854','08657-120', 'Tempero bom', 'Sao Paulo' 'SP');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) values ('Oscar Olheiro Freire','oscarvrt@outlook.com', '128572-8599',	'Avenida pequena morte',
'casa B', '08592-458', 'Vem em Mim', 'Minas Gerais', 'MG');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) values ('Astrogildo Vivencio','astrogildotemposeco@outlook.com', '248598-2323', 'Trinta e 3 mentes',
'Viela direita', '89578-895', 'Numeros inteiros', 'Manaus', 'Am');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) values ('Zilmar Sronger', 'zilmarsronger@uol.com','328598-5577', 'Viela corre que da tempo','Apt35 Bloco 3',
	'04578-986', 'Viela magali', 'Rondonia', 'Ac');
insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado) values ('Antonino menghtd', 'antoninokiko@yahoo.com', '568795-2587', 'Estrada pra que chorar', 'Chacara 3', 
'03389-222', 'Todos por todos', 'Fortaleza', 'Ce');

update tbFuncionarios set nome = 'Delfina Torres mendes' where codFunc = 3;
update tbFuncionarios set endereco = 'Amantes tem jeito', email = 'atitudealtitude@gmail' where codFunc = 1;
update tbFuncionarios set bairro = 'Amigas e rivais', numero = '5A', cep = '05555-895' where codFunc = 5;

delete from tbFuncionarios where codFunc = 1;

select codFunc, nome, 12345689727 as 'CPF', email, telefone, endereco, numero, cep, bairro, cidade, estado from tbFuncionarios;

select codFunc as 'Código', nome as 'Nome',email as 'E-mail', endereco as 'Endereço', bairro as 'Bairro', cidade as 'Cidade', estado as 'Estado' from tbFuncionarios;

select * from tbFuncionarios;


