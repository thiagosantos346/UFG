-- grant <lista-privilegios> on <nome-relaçção ou nome-view> to <lista_usuarios/Papeis>
-- https://www.postgresql.org/docs/9.3/sql-createuser.html
-- https://www.postgresql.org/docs/9.3/sql-createrole.html
-- https://www.postgresql.org/docs/9.3/sql-grant.html

CREATE ROLE DBA with SUPERUSER;

CREATE USER thiagosilva004
WITH
	SUPERUSER 
	CREATEDB 
    CREATEROLE
    LOGIN
    CONNECTION LIMIT -1
    ENCRYPTED PASSWORD '1234';

GRANT ALL ON TABLE public.cargos TO thiagosilva004 WITH GRANT OPTION;

GRANT ALL ON TABLE public.departamentos TO thiagosilva004 WITH GRANT OPTION;

GRANT ALL ON TABLE public.equipe TO thiagosilva004 WITH GRANT OPTION;

GRANT ALL ON TABLE public.funcionarios TO thiagosilva004 WITH GRANT OPTION;

GRANT ALL ON TABLE public.projetos TO thiagosilva004 WITH GRANT OPTION;
