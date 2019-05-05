create table if not exists estagio(
	estagio_id integer default nextval('estagio'),
	matricula varchar(9) not null,
	data_inicio date not null default current_date,
	data_fim date,
	obrigatorio bool default false,
	relatorio xml,
	constraint pk_estagio_id primary key(estagio_id, matricula),
	constraint fk_matricula_id foreign key(matricula) references 
	estudante(matricula) on delete cascade 
	
);