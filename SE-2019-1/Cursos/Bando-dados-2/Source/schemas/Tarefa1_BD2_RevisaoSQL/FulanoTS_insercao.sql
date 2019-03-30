-- Inserindo os Dados dos Cargos --


INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C1', 'Aux.Vendas', 2350.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C2', 'Vigia', 2400.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C3', 'Vendedor', 2800.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C4', 'Aux.Cobrança', 2250.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C5', 'Gerente', 5000.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C6', 'Diretor', 7500.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C7', 'Presidente', 9500.00);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C8', 'Scrum Master', 5600.95);

INSERT INTO Cargos (CodigoCargo, DescricaoCargo, VlrSalario ) VALUES ('C9', 'Product Woner', 5600.95);



-- Inserindos os Dados do Departamento --

INSERT INTO Departamentos (CodigoDepartamento,DescricaoDepartamento,RamalTel)

Values ('D1', 'Assist.Técnica', 3521-2246),

('D2', 'Estoque', 3521-2589),

('D3', 'Administração', 3521-2772),

('D4', 'Segurança', 3521-1810),

('D5', 'Vendas', 3521-2599),

('D6', 'Cobrança', 3521-2688)

;

INSERT INTO departamentos VALUES ('D7', 'DEV', 7897);
INSERT INTO departamentos VALUES ('D8', 'OPS', 7896);


-- Inserindos os Dados dos Funcionarios --

Insert Into Funcionarios (NumeroRegistro, NomeFuncionario, DtAdmissao, Sexo, CodigoCargo, CodigoDepartamento)

Values (101, 'Luis Sampaio', '2016-08-10', 'M', 'C3', 'D5'),

(104, 'Carlos Pereira', '2014-03-02', 'M', 'C4', 'D6'),

(134, 'Jose Alves', '2017-05-03', 'M', 'C5', 'D1'),

(121, 'Luis Paulo Souza', '2015-12-10', 'M', 'C3', 'D5'),

(195, 'Marta Silveira', '2017-01-05', 'F', 'C1', 'D5'),

(139, 'Ana Luiza', '2016-01-12', 'F', 'C4', 'D6'),

(123, 'Pedro Sergio', '2016-06-29', 'M', 'C7', 'D3'),

(148, 'Larissa Silva', '2017-06-01', 'F', 'C4', 'D6'),

(115, 'Roberto Fernandes', '2016-10-15', 'M', 'C3', 'D5'),

(22, 'Sergio Nogueira', '2015-02-10', 'M', 'C2', 'D4')

;

INSERT INTO funcionarios VALUES (12, 'Thiago Silva', '2015-06-02', 'M', 'C8', 'D7');
INSERT INTO funcionarios VALUES (13, 'Marlom Silva', '2014-07-12', 'M', 'C8', 'D7');
INSERT INTO funcionarios VALUES (201705644, 'Thiago', '2017-06-05', 'M', 'C9', 'D1');
INSERT INTO funcionarios VALUES (201705645, 'dos', '2017-06-05', 'M', 'C9', 'D1');
INSERT INTO funcionarios VALUES (201705646, 'Santos', '2017-06-05', 'M', 'C9', 'D1');
INSERT INTO funcionarios VALUES (201705647, 'Silva', '2017-06-05', '1', 'C9', 'D1');



-- Inserindos os Dados do Projeto --

Insert Into Projetos (CodigoProjeto, DescricaoProjeto)

Values ('Projeto1', 'Suporte'),

('Projeto2', 'Manutenção'),

('Projeto3', 'Desenvolvimento')

;

INSERT INTO equipe VALUES (7, 148, 'Projeto1');
INSERT INTO equipe VALUES (8, 22, 'Projeto2');


-- Inserindos os Dados da Equipe --

Insert Into Equipe (Codigo, NumeroRegistroFuncionario, CodigoProjeto)

Values (1, '101', 'Projeto1'),

(2, '104', 'Projeto1'),

(3, '134', 'Projeto1'),

(4, '101', 'Projeto2'),

(5, '104', 'Projeto2'),

(6, '101', 'Projeto3')

;


INSERT INTO public.projetos VALUES ('projeto4', 'Operação');
INSERT INTO public.projetos VALUES ('projeto5', 'Integração');