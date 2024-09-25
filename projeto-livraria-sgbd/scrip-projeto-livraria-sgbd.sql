CREATE DATABASE db_livraria;
USE db_livraria;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(45) NOT NULL,
rg_cliente BIGINT(14) NOT NULL,
cpf_cliente BIGINT(14) NOT NULL,
rua VARCHAR(45),
bairro VARCHAR(45),
cep INT,
cidade VARCHAR(45),
estado VARCHAR(45),
PRIMARY KEY (id_cliente)
); 

CREATE TABLE financiador(
id_financiador INT NOT NULL AUTO_INCREMENT,
nome_financiador VARCHAR(45),
cnpj_financiador BIGINT(14),
PRIMARY KEY (id_financiador)
); 

CREATE TABLE autor(
id_autor INT NOT NULL AUTO_INCREMENT,
nome_autor VARCHAR(45),
rg_id_autor BIGINT(14),
PRIMARY KEY (id_autor)
); 

CREATE TABLE editora(
id_editora INT NOT NULL AUTO_INCREMENT,
nome_fantasia_editora VARCHAR(45),
razao_social_editora VARCHAR(45),
bairro_editora VARCHAR(45),
cep_editora INT,
cidade_editora VARCHAR(45),
estado_editora VARCHAR(45),
numero_localizacao_editora VARCHAR(45),
rua_editora VARCHAR(45),
PRIMARY KEY (id_editora)
); 

CREATE TABLE telefone(
id_telefone INT NOT NULL AUTO_INCREMENT,
numero_telefone BIGINT(14),
operadora_telefone VARCHAR(45),
PRIMARY KEY (id_telefone)
); 

CREATE TABLE pedido(
id_pedido INT NOT NULL AUTO_INCREMENT,
qtd_pedido INT,
PRIMARY KEY (id_pedido)
); 

CREATE TABLE livro(
id_livro INT NOT NULL AUTO_INCREMENT,
isbn_livro BIGINT(14),
titulo_livro VARCHAR(45),
preco_livro DECIMAL(8,2),
categoria_livro VARCHAR(45),
PRIMARY KEY (id_livro)
);

-- adicionando a chave estrangeira de cliente dentro de pedido
ALTER TABLE pedido ADD COLUMN cliente_id INT, ADD FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente);
-- adicionando a chave estrangeira de livro dentro de pedido
ALTER TABLE pedido ADD COLUMN livro_id INT, ADD FOREIGN KEY (livro_id) REFERENCES livro(id_livro);

-- adicionando a chave estrangeira de editora dentro de telefone
ALTER TABLE telefone ADD COLUMN editora_id INT, ADD FOREIGN KEY (editora_id) REFERENCES editora(id_editora);

-- adicionando a chave estrangeira de editora dentro de livro
ALTER TABLE livro ADD COLUMN editora_id INT, ADD FOREIGN KEY (editora_id) REFERENCES editora(id_editora);
-- adicionando a chave estrangeira de autor dentro de livro
ALTER TABLE livro ADD COLUMN autor_id INT, ADD FOREIGN KEY (autor_id) REFERENCES autor(id_autor);
-- adicionando a chave estrangeira de financiador dentro de livro
ALTER TABLE livro ADD COLUMN financiador_id INT, ADD FOREIGN KEY (financiador_id) REFERENCES financiador(id_financiador);















