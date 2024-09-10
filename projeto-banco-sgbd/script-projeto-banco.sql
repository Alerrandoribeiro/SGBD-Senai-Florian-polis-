CREATE DATABASE banco;
USE banco;

CREATE TABLE categoria_cliente(
cod_categoria_cliente INT NOT NULL AUTO_INCREMENT,
nome_categoria_cliente VARCHAR(100),
PRIMARY KEY(cod_categoria_cliente)
);

CREATE TABLE agencia(
num_agencia INT NOT NULL AUTO_INCREMENT,
nome_agencia VARCHAR(100),
PRIMARY KEY(num_agencia)
);

CREATE TABLE tipo_conta(
cod_tipo_conta INT NOT NULL AUTO_INCREMENT,
des_tipo_conta VARCHAR(100),
PRIMARY KEY(cod_tipo_conta)
);

CREATE TABLE cliente(
cod_cliente INT NOT NULL AUTO_INCREMENT,
nom_cliente VARCHAR(100),
num_cpf_cnpj BIGINT(14),
num_celular BIGINT(14),
rua VARCHAR(100),
numero INT,
bairro VARCHAR(100),
cep INT,
cidade VARCHAR(45),
estado VARCHAR(45),
PRIMARY KEY(cod_cliente)
);

CREATE TABLE conta(
num_conta INT NOT NULL AUTO_INCREMENT,
val_saldo DECIMAL(10,2),
PRIMARY KEY(num_conta)
);

-- colocanco a chave estrangeira cliente_categoria_cod na tabela cliente
ALTER TABLE cliente ADD COLUMN cliente_categoria_cod INT, ADD FOREIGN KEY (cliente_categoria_cod) REFERENCES categoria_cliente(cod_categoria_cliente);
-- alterando a tabela conta e adicionando a a chave estrangeira codigo_cliente
ALTER TABLE conta ADD COLUMN cliente_cod INT, ADD FOREIGN KEY (cliente_cod) REFERENCES cliente(cod_cliente);
-- alterando a tabela conta e adicionando a a chave estrangeira agencia_num
ALTER TABLE conta ADD COLUMN agencia_num INT, ADD FOREIGN KEY (agencia_num) REFERENCES agencia(num_agencia);
-- alterando a tabela conta e adicionando a a chave estrangeira conta_tipo_cod
ALTER TABLE conta ADD COLUMN conta_tipo_cod INT, ADD FOREIGN KEY (conta_tipo_cod) REFERENCES tipo_conta(cod_tipo_conta);


-- 1 - Na tabela Cliente alterar o nome da coluna NUM_CELULAR para TELEFONE
ALTER TABLE cliente RENAME COLUMN num_celular TO telefone;
-- 2 - Na tabela Categoria_Cliente vamos incluir o campo “OBSERVACAO” (TEXT)
ALTER TABLE categoria_cliente ADD COLUMN observacao TEXT;
-- 3 - Na tabela Cliente vamos incluir o campo “RENDA” (DECIMAL)
ALTER TABLE cliente ADD COLUMN renda DECIMAL;
-- 4 - Alterar o tipo de dado da coluna DES_TIPO_CONTA para TEXT
ALTER TABLE tipo_conta MODIFY COLUMN des_tipo_conta TEXT; 
-- 5 - Alterar na tabela Agencia o NOM_AGENCIA para VARCHAR (45)
ALTER TABLE agencia MODIFY COLUMN nome_agencia VARCHAR(45);
-- 6 - Remover a coluna ESTADO da tabela CLIENTE
ALTER TABLE cliente DROP COLUMN estado;
-- 7 - Alterar o nome da tabela CATEGORIA_CLIENTE para CATEGORIA
ALTER TABLE categoria_cliente RENAME TO categoria;
-- 8 – Na tabela Tipo_Conta vamos incluir o campo “OBSERVACAO” (TEXT)
ALTER TABLE tipo_conta ADD COLUMN observacao TEXT;


