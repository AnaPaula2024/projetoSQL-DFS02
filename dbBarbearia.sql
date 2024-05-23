drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;


create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal(9,2),
primary key(codProd)
);

insert into tbProdutos(descricao,marca,preco)
	values('Shampoo', 'nivea', 30.0);
insert into tbProdutos(descricao,marca,preco)
	values('Sabonete', 'phebo', 50.0);
insert into tbProdutos(descricao,marca,preco)
	values('Creme de barbear', 'Barbers', 70.0);
insert into tbProdutos(descricao,marca,preco)
	values('Gel para cabelos', 'Salao line', 25.0);


select * from tbProdutos;

--delete from tbProdutos where codProd = 2;

select * from tbProdutos;

select codProd as 'Código',
	descricao as 'Descrição',
	marca as 'Marca',
	preco as 'Preço' from tbProdutos;

--colunas virtuais

select codProd, descricao, marca, preco,'promoção' as 'promo'  from tbProdutos;
select codProd, descricao,'promoção' as 'promo', marca, preco  from tbProdutos;
select codProd as 'Código', descricao as 'Descrição','promoção' as 'promo', marca as 'Marca', 'Sim' as 'Vendido', preco as 'Preço'  from tbProdutos;

-- utilizando calculos no SQL

update tbProdutos set preco = preco * 1.10 where codProd = 3;

select * from tbProdutos;