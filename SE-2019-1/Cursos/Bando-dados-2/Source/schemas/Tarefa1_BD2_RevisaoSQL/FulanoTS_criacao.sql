-- Criando o Banco de Dados - Tarefa1 --

-- Criando a Tabela Cargos --

Create Table Cargos

(CodigoCargo Char(2) Primary Key Not Null,

DescricaoCargo Varchar(50) Not Null,

VlrSalario Numeric(6,2) Not Null);


-- Criando a Tabela Departamentos --

Create Table Departamentos

(CodigoDepartamento Char(2) Primary Key Not Null,

DescricaoDepartamento Varchar(30) Not Null,

RamalTel SmallInt Not Null);



-- Criando a Tabela Funcionarios --

Create Table Funcionarios 

(NumeroRegistro Int Primary Key Not Null, 

NomeFuncionario Varchar(80) Not Null,

DtAdmissao Date Default CURRENT_DATE,

Sexo Char(1) Not Null Default 'M',

CodigoCargo Char(2) Not Null,

CodigoDepartamento Char(2) Not Null);


--  Alterando Tabelas

Alter Table Funcionarios

Add Constraint FK_Funcionarios_Cargos Foreign Key (CodigoCargo)

References Cargos(CodigoCargo);



Alter Table Funcionarios

Add Constraint FK_Funcionarios_Departamentos Foreign Key (CodigoDepartamento)

References Departamentos(CodigoDepartamento);


Create Table Projetos

(CodigoProjeto Char(8) Primary Key Not Null,

DescricaoProjeto Varchar(50) Not Null);


Create Table Equipe

(Codigo Int Primary Key Not Null,

NumeroRegistroFuncionario Int Not Null,

CodigoProjeto Char(8) Not Null);



-- Alterando Tabelas --

Alter Table Equipe

Add Constraint FK_Equipe_Funcionarios Foreign Key (NumeroRegistroFuncionario)

References Funcionarios(NumeroRegistro);


Alter Table Equipe

Add Constraint FK_Equipe_Projetos Foreign Key (CodigoProjeto)

References Projetos(CodigoProjeto);




