-- Laboratório

-- Para realizar esse laboratório, utilize o banco de dados DB_CDS.



-- 1. Exiba quantos pedidos cada cliente fez. 

CREATE VIEW Quantos_pedidos AS

select count(ped.num_Ped) as 'Total de Pedidos' from tbClientes as cli left join tbPedidos as ped on cli.cod_Cli = ped.cod_Cli group by cli.cod_Cli;

-- 2. Exiba quantos CDs possui cada categoria. 

CREATE VIEW Quantos_CDs_categoria AS

select count(tit.cod_Tit) as 'Total de CDs' from tbCategorias as cat left join tbTitulos as tit on cat.cod_Cat = tit.cod_Cat group by cat.cod_Cat;

-- 3. Exiba quantos CDs possui cada gravadora. 

CREATE VIEW Quantos_CDs_gravadora AS 

select count(tit.cod_Tit) as 'Total de CDs' from tbGravadoras as grav left join tbTitulos as tit on grav.cod_Grav = tit.cod_Grav group by grav.cod_Grav;

-- 4. Exiba quantos pedidos cada funcionário atendeu. 

CREATE VIEW Quantos_pedidos_funcionarios AS

select count(ped.num_Ped) as 'Total de Pedidos' from tbFuncionarios as func left join tbPedidos as ped on func.cod_Func = ped.cod_Func group by func.cod_Func limit 5;

-- 5. Exiba quantos dependentes tem cada funcionário. 

CREATE VIEW Quantos_dependentes_funcionarios_new AS

select count(dep.cod_Dep) as 'Total de dependentes' from tbFuncionarios as func left join tbDependentes as dep on func.cod_Func = dep.cod_Func group by func.cod_Func limit 5;

-- 6. Exiba quantos pedidos cada cliente fez, mostrando o nome dos clientes. 

CREATE VIEW v_pedidos_por_cliente AS 

select cli.nome_Cli as 'Nome dos clientes', count(ped.num_Ped) as 'Total de Pedidos' from tbPedidos as ped left join tbClientes as cli on ped.cod_Cli = cli.cod_Cli
group by cli.nome_Cli order by 'Total de Pedidos' desc;

-- 7. Exiba quantos CDs possui cada categoria, mostrando o nome das mesmas. 

CREATE VIEW v_cds_por_categoria AS

select cat.nome_Cat as 'Nome das categorias', count(tit.cod_Tit) as 'Total de CDs' from tbCategorias as cat left join tbTitulos as tit on cat.cod_Cat = tit.cod_Cat
group by cat.nome_Cat order by 'Total de CDs' desc;

-- 8. Exiba quantos CDs possui cada gravadora, mostrando o nome das mesmas. 

CREATE VIEW v_cds_por_gravadora AS

select grav.nome_Grav as 'Nome das gravadoras', count(tit.cod_Tit) as 'Total de CDs' from tbGravadoras as grav left join tbTitulos as tit on grav.cod_Grav = tit.cod_Grav
group by grav.nome_Grav order by 'Total de CDs' desc;

-- 9. Exiba quantos pedidos cada funcionário atendeu, mostrando o nome dos funcionários. 

CREATE VIEW v_pedidos_por_funcionario AS

select func.nome_Func as 'Nome dos funcionários', count(ped.num_Ped) as 'Total de Pedidos' from tbFuncionarios as func left join tbPedidos as ped on func.cod_Func = ped.cod_Func
group by func.nome_Func order by 'Total de Pedidos' desc limit 5;

-- 10. Exiba quantos dependentes cada funcionário possui, mostrando seus nomes. 

CREATE VIEW v_dependentes_por_funcionario_new AS

select func.nome_Func as 'Nome dos funcionários', count(dep.cod_Dep) as 'Total de dependentes' from tbFuncionarios as func left join tbDependentes as dep on func.cod_Func = dep.cod_Func
group by func.nome_Func order by 'Total de dependentes' desc limit 5;

use DB_CDS;

select table_name as 'Exercicicios das pag 101 a 102' from information_schema.views where table_schema = 'DB_CDS';

SELECT * FROM Quantos_pedidos;
SELECT * FROM Quantos_CDs_categoria;
SELECT * FROM Quantos_CDs_gravadora;
SELECT * FROM Quantos_pedidos_funcionarios;
SELECT * FROM Quantos_dependentes_funcionarios_new;
SELECT * FROM v_pedidos_por_cliente;
SELECT * FROM v_cds_por_categoria;
SELECT * FROM v_cds_por_gravadora;
SELECT * FROM v_pedidos_por_funcionario;
SELECT * FROM v_dependentes_por_funcionario_new;