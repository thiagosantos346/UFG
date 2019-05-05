CREATE DATABASE "Thiagoss004"
    WITH 
    OWNER = thiagoss004
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "Thiagoss004"
    IS 'Atividade bd2';

GRANT ALL ON DATABASE "Thiagoss004" TO thiagoss004 WITH GRANT OPTION;

--thiagoss004
SELECT usename FROM pg_user;