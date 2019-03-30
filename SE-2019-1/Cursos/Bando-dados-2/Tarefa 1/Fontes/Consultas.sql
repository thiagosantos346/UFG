select * from cargos where 1 = 1;
select * from departamentos where 1 = 1;
select * from equipe where 1 = 1;
select * from funcionarios where 1 = 1;
select * from projetos where 1 = 1;

insert into equipe
values( 7, 148, 'Projeto1');

insert into equipe
values( 8, 22, 'Projeto2');

insert into funcionarios
values (12, 'Thiago Silva', to_date('02062015', 'DDMMYYYY'), 'M', 'C8', 'D7');


insert into funcionarios
values (13, 'Marlom Silva', to_date('12072014', 'DDMMYYYY'), 'M', 'C8', 'D7');

insert into projetos 
values ('projeto4', 'Operação');

insert into projetos
values ('projeto5', 'Integração');


insert into funcionarios
values (201705644, 'Thiago', to_date('05062017', 'DDMMYYYY'), 'M', 'C9', 'D1');

insert into funcionarios
values (201705645, 'dos', to_date('05062017', 'DDMMYYYY'), 'M', 'C9', 'D1');

insert into funcionarios
values (201705646, 'Santos', to_date('05062017', 'DDMMYYYY'), 'M', 'C9', 'D1');

insert into funcionarios
values (201705647, 'Silva', to_date('05062017', 'DDMMYYYY'), 'M', 'C9', 'D1');


	
--1) Mostre todos os regitros da tabela funcionarios
--[ FROM item_do_from [, ...] ]
	select * from funcionarios;

--2)Mostre todos os funcionarios que ganham mais de 2000; 
--[ WHERE condição ou predicado ]
	select * from funcionarios natural join cargos where cargos.vlrsalario > 2000;

--3) Mostre o numero funcionarios agrupados por projetos: 
--[ GROUP BY expressão de atributos de agrupamento [, ...] ]

	select
		count(*), descricaoprojeto
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		group by descricaoprojeto

--4)Mostre todos os funcionarios agrupados por projetos que possuem mais de 2 funcionarios
-- [ HAVING condição para agrupamentos [, ...] ]

	select
		count(*) as qtd, descricaoprojeto
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		group by descricaoprojeto
		having count(*) > 2;
	
-- 5)Os funcionarios do projetos 1 e 2 estarão juntos para uma premiação,
--mostre uma lista com a união de ambos;
	
	--UNION Begin;
	(select
		*
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		where 
		pj.codigoprojeto = 'Projeto1')
		union all
			(select
		*
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		where 
		pj.codigoprojeto = 'Projeto2');
		
--UNION end;

-- Estas consultas a baixo, mostram somente as diferença entre operadores deconjuntos.

--Except begin
	
		
			(select
		*
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		where 
		pj.codigoprojeto = 'Projeto1')
		except 
			(select
		*
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		where 
		pj.codigoprojeto = 'Projeto2');
		
--Except end;

--INTERSECT begin
		(select
		*
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		where 
		pj.codigoprojeto = 'Projeto1')
		INTERSECT 
			(select
		*
	from
		(
			funcionarios inner join  equipe
			on
			equipe.numeroregistrofuncionario = funcionarios.numeroregistro
		) as fq
		inner join projetos as pj
		on fq.codigoprojeto = pj.codigoprojeto
		where 
		pj.codigoprojeto = 'Projeto2') ;


--INTERSECT begin end;
	
	
--[ { UNION | INTERSECT | EXCEPT } [ ALL ] seleção ]

--6)Por favor me traga todos os funcionarios ordenados pelo salario do maior para o menor.
--[ ORDER BY expressão [ ASC | DESC | USING operador ] [, ...] ]

	select 
		nomefuncionario, vlrsalario
	from
		funcionarios fa natural join cargos ca 
	order by vlrsalario desc

 -- 7)Estou desenvolvendo um app para android, e este posui uma tela pequena, para
--melhorar a usabilidade foi solicitado que me mostre somente 5 registros por vez.
--[ LIMIT { contador | ALL } ]
	
	select 
		nomefuncionario, vlrsalario
	from
		funcionarios fa natural join cargos ca 
	order by vlrsalario desc
	limit 5
	
--8) Abra um bloco de transação e bloquei a linha que contem o funcionario silva, altere
-- e tente alterar o seu sexo para F
	
	
	
	
	BEGIN;
		SELECT * FROM funcionarios WHERE nomefuncionario = 'Silva' FOR UPDATE;
		SAVEPOINT s;
		UPDATE funcionarios SET sexo = 'F' WHERE nomefuncionario = 'Silva';
	ROLLBACK TO s;
	SELECT * FROM funcionarios WHERE nomefuncionario = 'Silva';
	commit;
--[ -FOR UPDATE [ OF nome_da_tabela [, ...] ] ]

--(9) LEFT JOIN
	
	select 
		*
	from 
		funcionarios fp left join equipe eq
	on eq.numeroregistrofuncionario = fp.numeroregistro;
	
--(10)RIGHT JOIN
	select 
		*
	from 
		funcionarios fp right join equipe eq
	on eq.numeroregistrofuncionario = fp.numeroregistro;

--(11)CROSS JOIN

	select 
		*
	from 
		funcionarios fp cross join equipe eq
	where eq.numeroregistrofuncionario = fp.numeroregistro;