create table sala
	(predio		varchar(15),
	 nr_sala		varchar(7),
	 capacidade		numeric(4,0),
	 primary key (predio, nr_sala)
	);

create table curso_unid_acad
	(nome_curso_unid_acad		varchar(20), 
	 predio		varchar(15), 
	 orcamento		        numeric(12,2) check (orcamento > 0),
	 primary key (nome_curso_unid_acad)
	);

create table disciplina
	(disciplina_id		varchar(8), 
	 nome_disc			varchar(50), 
	 nome_curso_unid_acad		varchar(20),
	 creditos		numeric(2,0) check (creditos > 0),
	 primary key (disciplina_id),
	 foreign key (nome_curso_unid_acad) references curso_unid_acad
		on delete set null
	);

create table instrutor
	(matricula			varchar(5), 
	 nome		varchar(40) not null, 
	 nome_curso_unid_acad		varchar(20), 
	 salario_anual			numeric(8,2) check (salario_anual > 29000),
	 primary key (matricula),
	 foreign key (nome_curso_unid_acad) references curso_unid_acad
		on delete set null
	);

create table turma
	(disciplina_id		varchar(8), 
         cod_id			varchar(8),
	 semestre		varchar(10)
		check (semestre in ('Semestre_1', 'CurInverno', 'Semestre_2', 'CurVerao')), 
	 ano			numeric(4,0) check (ano > 1701 and ano < 2020), 
	 predio		varchar(15),
	 nr_sala		varchar(7),
	 duracao_id		varchar(4),
	 primary key (disciplina_id, cod_id, semestre, ano),
	 foreign key (disciplina_id) references disciplina
		on delete cascade,
	 foreign key (predio, nr_sala) references sala
		on delete set null
	);

create table professor
	(matricula			varchar(9), 
	 disciplina_id		varchar(8),
	 cod_id			varchar(8), 
	 semestre		varchar(10),
	 ano			numeric(4,0),
	 primary key (matricula, disciplina_id, cod_id, semestre, ano),
	 foreign key (disciplina_id,cod_id, semestre, ano) references turma
		on delete cascade,
	 foreign key (matricula) references instrutor
		on delete cascade
	);

create table estudante
	(matricula			varchar(9), 
	 nome		varchar(40) not null, 
	 nome_curso_unid_acad		varchar(20), 
	 tot_cred		numeric(3,0) check (tot_cred >= 0),
	 primary key (matricula),
	 foreign key (nome_curso_unid_acad) references curso_unid_acad
		on delete set null
	);

create table faz_pertence
	(matricula			varchar(9), 
	 disciplina_id		varchar(8),
	 cod_id			varchar(8), 
	 semestre		varchar(10),
	 ano			numeric(4,0),
	 nota		        varchar(2),
	 primary key (matricula, disciplina_id, cod_id, semestre, ano),
	 foreign key (disciplina_id,cod_id, semestre, ano) references turma
		on delete cascade,
	 foreign key (matricula) references estudante
		on delete cascade
	);

create table orientador
	(mat_est			varchar(9),
	 mat_inst			varchar(9),
	 primary key (mat_est),
	 foreign key (mat_inst) references instrutor (matricula)
		on delete set null,
	 foreign key (mat_est) references estudante (matricula)
		on delete cascade
	);

create table duracao
	(duracao_id		varchar(4),
	 dia			varchar(1),
	 inicio_hr		numeric(2) check (inicio_hr >= 0 and inicio_hr < 24),
	 inicio_min	numeric(2) check (inicio_min >= 0 and inicio_min < 60),
	 fim_hr			numeric(2) check (fim_hr >= 0 and fim_hr < 24),
	 fim_min		numeric(2) check (fim_min >= 0 and fim_min < 60),
	 primary key (duracao_id, dia, inicio_hr, inicio_min)
	);

create table prereq
	(disciplina_id		varchar(8), 
	 prereq_id		varchar(8),
	 primary key (disciplina_id, prereq_id),
	 foreign key (disciplina_id) references disciplina
		on delete cascade,
	 foreign key (prereq_id) references disciplina
	);
SELECT schemaname AS esquema, tablename AS tabela, tableowner AS dono
 FROM pg_catalog.pg_tables
 WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
 ORDER BY schemaname, tablename;