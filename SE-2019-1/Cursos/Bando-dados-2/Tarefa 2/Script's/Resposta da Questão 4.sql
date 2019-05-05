--Resposta da Questão 4 Begin;

insert into turma values ('408','1','CurInverno','2019','Power','972','D');
-- Foi preciso inserir essa linha acima deste comentario;
insert into faz_pertence values('11201', '408', '1', 'CurInverno', 2019, 'D ');
insert into faz_pertence values('89132', '408', '1', 'CurInverno', 2019, 'C ');
insert into faz_pertence values('24010', '408', '1', 'CurInverno', 2019, 'A ');

UPDATE
	faz_pertence
	SET  nota =  'C' 
where 
	matricula = '11201' and
	disciplina_id = '408' and
	cod_id = '1' and
	semestre = 'CurInverno' and
	ano = 2019;

UPDATE
	faz_pertence
	SET  nota =  'A' 
where 
	matricula = '89132' and
	disciplina_id = '408' and
	cod_id = '1' and
	semestre = 'CurInverno' and
	ano = 2019;

UPDATE
	faz_pertence
	SET  nota =  'A' 
where 
	matricula = '24010' and
	disciplina_id = '408' and
	cod_id = '1' and
	semestre = 'CurInverno' and
	ano = 2019;
--Resposta da Questão 4 End;