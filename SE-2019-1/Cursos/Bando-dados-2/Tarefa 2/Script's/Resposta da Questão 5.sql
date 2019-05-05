--Matricula 201705644 - Claúsula 4 : Limit, Tabela 4  Faz_pertence;
select est20171.matricula, est20171.matricula
from
	( 	select distinct *  
		from faz_pertence 
		where ano = 2019 and semestre = 'Semestre_2'
		and  disciplina_id = '604' ) as est2192 
	left join
	(
		select distinct *  
		from faz_pertence 
		where ano = 2017 and semestre = 'Semestre_1'
		and  disciplina_id in ('603')
	) as  est20171
	 on est2192.matricula = est20171.matricula
	where  est2192.matricula is null Limit 6;
	
select est20171.matricula, est20171.matricula
from
	( 	select distinct *  
		from faz_pertence 
		where ano = 2019 and semestre = 'Semestre_2'
		and  disciplina_id = '604' ) as est2192
	right join
	(
		select distinct *  
		from faz_pertence 
		where ano = 2017 and semestre = 'Semestre_1'
		and  disciplina_id in ('603')
	) as  est20171
	 on est2192.matricula = est20171.matricula
	where est20171.matricula is not null limit 100;
	--   Verificando se todos os alunos matriculados em 
	-- st-2019-2 também estão em st-2017-1, estes são alunos de
	-- um curso de estatística.;
	--   As duas consutlas fazem o mesmo, infelizmente todos 
	-- os alunos estavam matriculados, por isso não é retorado
	-- nehuma tupula. Caso seja retirado a claúsula where da para
	-- notar que não é retornado valores nulos em colunas alguma.;
	-- É feito o uso da claúsula [limit], para reduzir a quantidade 
	-- de linhas;