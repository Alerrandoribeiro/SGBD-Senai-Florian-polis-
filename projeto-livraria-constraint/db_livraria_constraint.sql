CREATE DATABASE db_livraria_constraint;
USE db_livraria_constraint;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(45) NOT NULL,
rg_cliente BIGINT(14) UNIQUE,
cpf_cliente BIGINT(14) UNIQUE,
rua VARCHAR(45),
bairro VARCHAR(45),
cep INT,
cidade VARCHAR(45),
estado VARCHAR(45),
pais VARCHAR(45) DEFAULT 'Brasil',
PRIMARY KEY (id_cliente)
); 

CREATE TABLE financiador(
id_financiador INT NOT NULL AUTO_INCREMENT,
nome_financiador VARCHAR(45) DEFAULT 'Financiador Público',
cnpj_financiador BIGINT(14),
PRIMARY KEY (id_financiador)
); 

CREATE TABLE autor(
id_autor INT NOT NULL AUTO_INCREMENT,
nome_autor VARCHAR(45) NOT NULL,
rg_autor BIGINT(18),
PRIMARY KEY (id_autor)
); 

CREATE TABLE editora(
id_editora INT NOT NULL AUTO_INCREMENT,
nome_fantasia_editora ENUM('Editora A','Editora B','Editora C') NOT NULL,
razao_social_editora VARCHAR(45) NOT NULL,
bairro_editora VARCHAR(45),
cep_editora INT,
cidade_editora VARCHAR(45),
estado_editora VARCHAR(45),
pais_editora VARCHAR(50) DEFAULT 'Brasil',
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
CHECK (qtd_pedido >= 0),
PRIMARY KEY (id_pedido)
); 

CREATE TABLE livro(
id_livro INT NOT NULL AUTO_INCREMENT,
isbn_livro BIGINT(14),
titulo_livro VARCHAR(45),
preco_livro DECIMAL(8,2),
CHECK (preco_livro >= 0),
categoria_livro ENUM ('Horror','Ficção','Romance','Ação'),
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

-- 1 - Inserir pelo menos 5 registro na tabela cliente
INSERT INTO cliente (nome_cliente, rg_cliente, cpf_cliente, rua, bairro, cep, cidade, estado, pais) VALUES
('Ana Silva', 12345678901, 12345678901, 'Rua das Flores', 'Centro', 88015000, 'Florianópolis', 'SC', 'Venezuela'),
('João Santos', 98765432101, 98765432101, 'Avenida Paulista', 'Trindade', 88025000, 'Florianópolis', 'SC','França'),
('Maria Oliveira', 23456789012, 23456789012, 'Rua do Catete', 'Canasvieiras', 88054000, 'Florianópolis', 'SC',"Peru");

-- Testando constraint pais VARCHAR(45) DEFAULT 'Brasil'
INSERT INTO cliente (nome_cliente, rg_cliente, cpf_cliente, rua, bairro, cep, cidade, estado) VALUES
('Pedro Costa', 34567890123, 34567890123, 'Rua da Praia', 'Jurerê', 88053400, 'Florianópolis', 'SC'),
('Lucas Mendes', 45678901234, 45678901234, 'Avenida Rio Branco', 'Ingá', 88061100, 'Florianópolis', 'SC');

-- Inserindo 5 registro na tabela editora
INSERT INTO editora (nome_fantasia_editora, razao_social_editora, bairro_editora, cep_editora, cidade_editora, estado_editora, numero_localizacao_editora, rua_editora, pais_editora) VALUES
('Editora A', 'Lumina Editora Ltda.', 'Centro', 88015000, 'Florianópolis', 'SC', '123', 'Rua da Luz', 'Chile'),
('Editora B', 'Livros e Letras S/A', 'Trindade', 88025000, 'Florianópolis', 'SC', '456', 'Avenida das Letras', 'Alemanha'),
('Editora C', 'Páginas do Sul Editora', 'Cacupé', 88056600, 'Florianópolis', 'SC', '789', 'Rua das Páginas','Venezuela');

-- testando a constrain default => pais_editora VARCHAR(50) DEFAULT 'Brasil',
INSERT INTO editora (nome_fantasia_editora, razao_social_editora, bairro_editora, cep_editora, cidade_editora, estado_editora, numero_localizacao_editora, rua_editora) VALUES
('Editora A', 'Maré Editora LTDA', 'Canasvieiras', 88054000, 'Florianópolis', 'SC', '101', 'Avenida do Mar'),
('Editora C', 'Esquina Literária S/A', 'Jurerê', 88053400, 'Florianópolis', 'SC', '202', 'Rua da Esquina');

-- Testando a constraint ENUM => nome_fantasia_editora ENUM('Editora A','Editora B','Editora C')alter


-- Inserindo 10 registro na tabela telefone
INSERT INTO telefone (numero_telefone, operadora_telefone, editora_id) VALUES
(48987654321, 'Vivo', 1),
(48987654322, 'Claro', 1),
(48987654323, 'TIM', 2),
(48987654324, 'Oi', 2),
(48987654325, 'Vivo', 3),
(48987654326, 'Claro', 3),
(48987654327, 'TIM', 4),
(48987654328, 'Oi', 4),
(48987654329, 'Vivo', 5),
(48987654330, 'Claro', 5);

-- Inserindo 5 registro na tabela financiador
INSERT INTO financiador (nome_financiador, cnpj_financiador) VALUES
('Financiadora ABC', 12345678000195),
('Investimentos XYZ', 98765432000110),
('Grupo Financeiro LMN', 11223344000100);

-- Testado a constraint default => nome_financiador VARCHAR(45) DEFAULT 'Financiador Público'
INSERT INTO financiador (cnpj_financiador) VALUES
(55667788000122),
(99887766000100);

-- Inseririndo 5 registro na tabela autor
INSERT INTO autor (nome_autor, rg_autor) VALUES
('Mariana Costa', 12345678901),
('Roberto Almeida', 23456789012),
('Fernanda Lima', 34567890123),
('Carlos Silva', 45678901234),
('Julia Pereira', 56789012345);

-- Inseririndo pelo menos 5 registro na tabela livro
INSERT INTO livro (isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id) VALUES
(9783161484100, 'O Morro dos Ventos Uivantes', 39.90, 'Romance', 1, 1, 1),
(9788535930352, 'Dom Casmurro', 29.90, 'Horror', 2, 2, 2),
(9788573027033, '1984', 34.90, 'Ficção', 3, 3, 3),
(9788535920308, 'A Metamorfose', 19.90, 'Ficção', 4, 4, 4),
(9788535930013, 'Cem Anos de Solidão', 49.90, 'Ação', 5, 5, 5);

-- Inseririndo 10 registro na tabela pedido
INSERT INTO pedido (qtd_pedido, cliente_id, livro_id) VALUES
(2, 1, 1),  -- 2 unidades do livro 1 para o cliente 1
(1, 2, 3),  -- 1 unidade do livro 3 para o cliente 2
(3, 3, 2),  -- 3 unidades do livro 2 para o cliente 3
(1, 4, 5),  -- 1 unidade do livro 5 para o cliente 4
(4, 5, 4),  -- 4 unidades do livro 4 para o cliente 5
(2, 1, 2),  -- 2 unidades do livro 2 para o cliente 1
(5, 2, 1),  -- 5 unidades do livro 1 para o cliente 2
(1, 3, 3),  -- 1 unidade do livro 3 para o cliente 3
(3, 4, 1),  -- 3 unidades do livro 1 para o cliente 4
(2, 5, 5);  -- 2 unidades do livro 5 para o cliente 5

-- Teste das constraints 

-- Na tabela editora razão social e nome não pode ficar vazio(NOT NULL)
INSERT INTO editora (nome_fantasia_editora, bairro_editora, cep_editora, cidade_editora, estado_editora, numero_localizacao_editora, rua_editora, pais_editora) VALUES
('Editora A', 'Centro', 88015000, 'Florianópolis', 'SC', '123', 'Rua da Luz', 'Chile');

-- Testando constraint pais VARCHAR(45) DEFAULT 'Brasil'
INSERT INTO cliente (nome_cliente, rg_cliente, cpf_cliente, rua, bairro, cep, cidade, estado) VALUES
('Ruti Carvalho', 34567890126, 34567890124, 'Rua da Praia', 'Jurerê', 88053400, 'Florianópolis', 'SC');

-- Na tabela autor nome não pode ficar vazio(NOT NULL)
INSERT INTO autor (rg_autor) VALUES
(22345678908);

-- Na tabela cliente nome não pode ficar vazio(NOT NULL) e DEFAULT 'Brasil' caso não o campo seja preenchido
INSERT INTO cliente (rg_cliente, cpf_cliente, rua, bairro, cep, cidade, estado, pais) VALUES
(32345678903, 32345678901, 'Rua das Flores', 'Centro', 88015000, 'Florianópolis', 'SC', 'Gana');

-- Testando constraint UNIQUE cpf_cliente e rg_cliente
INSERT INTO cliente (nome_cliente, rg_cliente, cpf_cliente, rua, bairro, cep, cidade, estado) VALUES
('Ruti Carvalho', 34567890126, 34567890124, 'Rua da Praia', 'Jurerê', 88053400, 'Florianópolis', 'SC');

-- Utilizando a constrait CHECK na tabela pedido - A quantidade de pedido não pode ser menor que zero
INSERT INTO pedido (qtd_pedido, cliente_id, livro_id) VALUES
(-1, 1, 1);  -- -1 unidades do livro 1 para o cliente 1

-- Testando a Constraint Enum => categoria_livro ENUM ('Horror','Ficção','Romance','Ação')
INSERT INTO livro (isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id) VALUES
(9783161484100, 'O Morro dos Ventos Uivantes', 39.90, 'Animação', 1, 1, 1);

-- Utilizando a constrait CHECK na tabela livro - O preço do livro não pode ser menor que zero
INSERT INTO livro (isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id) VALUES
(9783161484100, 'O Morro dos Ventos Uivantes', -25.50 , 'Romance', 1, 1, 1);

-- Testando a Constraint Enum => nome_fantasia_editora ENUM('Editora A','Editora B','Editora C')
INSERT INTO editora (nome_fantasia_editora, razao_social_editora, bairro_editora, cep_editora, cidade_editora, estado_editora, numero_localizacao_editora, rua_editora, pais_editora) VALUES
('Editora D', 'Lumina Editora Ltda.', 'Centro', 88015000, 'Florianópolis', 'SC', '123', 'Rua da Luz', 'Chile');

-- Testado a constraint default => nome_financiador VARCHAR(45) DEFAULT 'Financiador Público'
INSERT INTO financiador (cnpj_financiador) VALUES
(77667788000345),
(10887766000132);