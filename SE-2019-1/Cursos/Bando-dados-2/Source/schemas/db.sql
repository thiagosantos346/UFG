CREATE TABLE OPERADOR_CAIXA(
	intCodigo integer not null ,
	vchNome varchar(45),
	chSupervisor char(1),
	senha varchar(16),
	primary key (intCodigo)

);

CREATE TABLE CONTROLE_CAIXA(
	intNumero_Controle integer not null.
	intNumero_Operador integer not null,
	dateHoraInicio dateTime,
	dateHoraFim dateTime,
	decVendas_Cheque decimal(12,2),
	decVendas_Cartao decimal(12, 2),
	decVendas_Dinheiro decimal(12, 2),
	decVendas_Outros decimal(12, 2),
	decCheque_Fisico decimal(12, 2),
	decCartao_Fisico decimal(12, 2),
	decOutros_Fisico decimal(12, 2),
	decDinheiro_Inicio decimal(12, 2),
	decDinheiro_Final decimal(12, 2),
	decSuplemento_Caixa decimal(12, 2),
	decSangria_Caixa decimal(12, 2),
	vchObservacao varchar(100),
	intSupervisorInicio integer,
	intSupervisorFinal integer,
	primary key (intNumero_Controle)

);

CREATE TABLE SANGRIA_CAIXA(
	intNumero_Controle integer,
	dateHoraInicio dateTime,
	decCheque_Fisico decimal(12, 2),
	decCartao_Fisico decimal(12, 2),
	decDinheiro_Fisico decimal(12, 2),
	intSuperVisor integer,
	foreign key (intNumero_Controle) references CONTROLE_CAIXA(intNumero_Controle)
	ON UPDATE CASCADE
	ON DELETE CASCADE 

);

CREATE TABLE EDITORAS(
	intCodigoEditora integer,
	vchNomeEditora varchar(50),
	vchEnderecoEditora varchar(45),
	vchCNPJEditora varchar(18),
	vchBairroEditora varchar(20),
	vchCharCidadeEditora varchar(20),
	chUFEditora char(2),
	vchNomeContato1 varchar(45),
	vchCargoContato1 varchar(20),
	vchEmailContato1 varchar(60),
	vchNomeContato2 varchar(45),
	vchCargoContato2 varchar(20),
	vchEmailContato2 varchar(60),
	vchTelefone varchar(30),
	vchEmailEditora varchar(30),
	blbs1OBservacoes blob sub_type 1,
	primary key (intCodigoEditora)
);

CREATE TABLE ESTOQUE(
	chCodigo_Barras char(13),
	chCodigo_interno char(9),
	vchNomeProduto varchar(80),
	blbt0FotoProduto blob sub_type 0,
	blbt1SumarioProduto blob sub_type 1,
	blb1IndiceProduto blob sub_type 1,
	intCodigoEditora integer,
	intQuantidade integer,
	decPrecoVenda decimal(12, 2),
	chUnidadeMedida char(3),
	decDescontoPercentual decimal(5, 1),
	decDescontoValor decimal(12, 2),
	decPercentualMarkup decimal(5 ,1),
	decPercentualICMS decimal(5, 1),
	decPrecoCusto decimal(12, 2),
	blbs1OBservacoes blob sub_type 1,
	primary key (chCodigo_Barras)

);
