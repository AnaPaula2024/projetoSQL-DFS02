-- Laboratório

-- Utilizando o banco de dados DB_CDS: 


--  1.Selecione o nome dos CDs e o nome da gravadora de cada CD.
DROP VIEW IF EXISTS nomes_CDSeGRAV;
CREATE VIEW nomes_CDSeGRAV AS

select tit.nome_CD as 'Nome do CD', grav.nome_Grav as 'Nome das gravadoras' from tbTitulos as tit inner join tbGravadoras as grav on tit.cod_Grav = grav.cod_Grav;

 -- 2.Selecione o nome dos CDs e o nome da categoria de cada CD. 
DROP VIEW IF EXISTS nomes_CDSeCAT;
CREATE VIEW nomes_CDSeCAT AS

select tit.nome_CD as 'Nome do CD', cat.nome_Cat as 'Nome das categorias' from tbTitulos as tit inner join tbCategorias as cat on tit.cod_Cat = cat.cod_Cat;

 -- 3.Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.
DROP VIEW IF EXISTS nomes_CDS_Grav_Cat;
CREATE VIEW nomes_CDS_Grav_Cat AS

select tit.nome_CD as 'Nome do CD', grav.nome_Grav as 'Nome das gravadoras', cat.nome_Cat as 'Nome das categorias' from tbTitulos as tit inner join tbGravadoras as grav on tit.cod_Grav = grav.cod_Grav 
inner join tbCategorias as cat on tit.cod_Cat = cat.cod_Cat;

 -- 4.Selecione  o  nome  dos  clientes  e  os  títulos  dos  CDs vendidos  em  cada  pedido  que  o cliente fez.
DROP VIEW IF EXISTS nomes_CDSeTit_ped;
CREATE VIEW nomes_CDSeTit_ped AS

select  cli.nome_Cli as 'Nome dos Clientes', tit.nome_CD as 'Nome do CD' from tbPedidos as ped inner join tbClientes as cli on ped.cod_Cli = cli.cod_Cli inner join tbFuncionarios as func on ped.cod_Func = func.cod_Func
inner join tbTitulos_pedido as ti_pe on ped.num_Ped = ti_pe.num_Ped inner join tbTitulos as tit on ti_pe.cod_Tit = tit.cod_Tit;

--  5.Selecione  o  nome  do  funcionário,  número,  data  e  valor   dos  pedidos  que  este funcionário registrou, além do nome do cliente que está fazendo o pedido.
DROP VIEW IF EXISTS nomeFunc_e_Cli_num_dat_val_ped;
CREATE VIEW nomeFunc_e_Cli_num_dat_val_ped AS

select func.nome_Func as 'Nome  dos  funcionários', ped.num_Ped as 'Número dos pedidos', date_format(ped.data_Ped, '%y/%m/%d') as 'Data do Pedido', ped.val_Ped as 'Valor dos pedidos', cli.nome_Cli as 'Nome dos Clientes' from tbPedidos as ped 
inner join tbFuncionarios as func on ped.cod_Func = func.cod_Func inner join tbclientes as cli on ped.cod_Cli = cli.cod_Cli;

-- 6.Selecione  o  nome  dos  funcionários  e  o  nome  de  todos  os  dependentes  de  cada funcionário. 
DROP VIEW IF EXISTS nomesfunc_e_dep;
CREATE VIEW nomesfunc_e_dep AS

select func.nome_Func as 'Nome dos funcionários', dep.nome_Dep as 'Nome dos dependentes' from tbFuncionarios as func left join tbDependentes as dep on func.cod_func = dep.cod_Dep order by func.nome_Func;

-- 7.Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.  
DROP VIEW IF EXISTS nomeCli_e_conj;
CREATE VIEW nomeCli_e_conj AS

select cli.nome_Cli as 'Nome dos Clientes', conj.nome_Conj as 'Nome dos Conjuges' from tbClientes as cli inner join tbConjuge as conj on cli.cod_Cli = conj.codConj;

-- 8.Selecione  o  nome  de  todos  os  clientes.  Se  estes  possuem  cônjuges,  mostrar  os  nomes de seus cônjuges também.
DROP VIEW IF EXISTS nometodosCli_e_conj;
CREATE VIEW nometodosCli_e_conj AS

select cli.nome_Cli as 'Nome dos Clientes', conj.nome_Conj as 'Nome dos Conjuges' from tbClientes as cli left join tbConjuge as conj on cli.cod_Cli = conj.codConj;

-- 9.Selecione  nome  do  cliente,  nome  do  cônjuge,  número do  pedido  que  cada  cliente  fez, valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada pedido. 
DROP VIEW IF EXISTS  nomeCli_conj_num_val_codfunc;
CREATE VIEW nomeCli_conj_num_val_codfunc AS

select cli.nome_Cli as 'Nome dos Clientes', conj.nome_Conj as 'Nome dos Conjuges', ped.num_Ped as 'Número dos pedidos', ped.val_Ped as 'Valor dos pedidos', func.cod_func from tbPedidos as ped inner join tbClientes as cli on ped.cod_Cli = cli.cod_Cli
left join tbConjuge as conj on ped.num_Ped = conj.codConj inner join tbFuncionarios as func on ped.cod_Func= func.cod_Func;

USE DB_CDS;

SELECT table_name AS 'Exercicicios das pag 88 a 89'
FROM information_schema.views
WHERE table_schema = 'DB_CDS'
AND table_name IN ('nomes_CDSeGRAV', 'nomes_CDSeCAT', 'nomes_CDS_Grav_Cat', 'nomes_CDSeTit_ped', 'nomeFunc_e_Cli_num_dat_val_ped', 'nomesfunc_e_dep', 'nomeCli_e_conj', 'nometodosCli_e_conj', 'nomeCli_conj_num_val_codfunc');


SELECT * FROM nomes_CDSeGRAV;
SELECT * FROM nomes_CDSeCAT;
SELECT * FROM nomes_CDS_Grav_Cat;
SELECT * FROM nomes_CDSeTit_ped;
SELECT * FROM nomeFunc_e_Cli_num_dat_val_ped;
SELECT * FROM nomesfunc_e_dep;
SELECT * FROM nomeCli_e_conj;
SELECT * FROM nometodosCli_e_conj;
SELECT * FROM nomeCli_conj_num_val_codfunc;