drop database dbProdutos;
 
create database dbProdutos;
 
use dbProdutos;
 
CREATE TABLE PRODUTOS 
( 
CODIGO INT, 
NOME VARCHAR(50), 
TIPO VARCHAR(25), 
QUANTIDADE INT, 
VALOR DECIMAL(10,2) 
);
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 1,'IMPRESSORA', 'INFORMATICA', 200, 600.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 2,'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 3, 'DVD PLAYER', 'ELETRONICOS', 250, 500.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 4,'MONITOR', 'INFORMATICA', 400, 900.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 5,'TELEVISOR', 'ELETRONICOS', 350, 650.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 6,'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00 );
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 7,'CELULAR', 'TELEFONE', 450, 850.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 8,'TECLADO', 'INFORMATICA', 300, 450.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 9,'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00 ); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 10,'MOUSE', 'INFORMATICA', 400, 60.00 ); 


desc PRODUTOS;

select * from PRODUTOS;

select distinct tipo from produtos;

select * from PRODUTOS where tipo = 'INFORMATICA';

select distinct tipo from PRODUTOS order by tipo;

select * from PRODUTOS where VALOR > 600;
 
select * from produtos where valor >= 600;
 
select valor as 'Valor' from PRODUTOS where valor >= 600;
 
-- Busca por código
 
select * from PRODUTOS where CODIGO = 1;
 
-- Busca por nome
 
select * from produtos where tipo like '%a%'; --tem o a em tudo para busca
 
select * from produtos where tipo like 'a%'; --tudo que começa com a letra a porcetagem tras o campo
 
-- Tabela verdade AND, OR, IN, NOT IN, BETWEEM, NOT BETWEEN

select * from produtos where tipo like '%a'; --tudo que termina com a letra a porcetagem tras o campo

select * from produtos where tipo like '%o%' and valor <= 600;

select * from produtos where tipo like '%o%' or valor <= 600;

select * from produtos where tipo = 'INFORMATICA' or tipo = 'TELEFONE';

select * from produtos where tipo in('INFORMATICA','TELEFONE');

select * from produtos where not tipo in('INFORMATICA','TELEFONE');

select * from produtos where  valor >= 100 and valor <= 300;

select * from produtos where  valor between 100 and 300;

select * from produtos where  valor not between 100 and 300;

-- 1. Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F'

update Produtos set valor = valor * 1.12 where nome like 'f%';
	select * from produtos where nome like 'f%';

-- 2. Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a
-- 600

update Produtos set QUANTIDADE = QUANTIDADE + 50 where valor and 400 and 600;
select * from produtos where valor and 400 and 600;

-- 3. Aplicar um desconto de 50% (*0.5) em todos os produtos que as unidades de estoque
-- sejam maiores que 300 

update Produtos set valor = valor * 0.5 where QUANTIDADE > 300;
	select * from produtos where QUANTIDADE > 300;

-- 4. Exiba o produto de CODIGO = 4

select * from produtos where codigo = 4;