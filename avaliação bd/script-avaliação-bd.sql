CREATE DATABASE db_estoque;
USE db_estoque;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf BIGINT(14) UNIQUE,
PRIMARY KEY (id_cliente)
); 

CREATE TABLE produto(
id_produto INT NOT NULL AUTO_INCREMENT,
nome_produto VARCHAR(45) NOT NULL,
codigo VARCHAR(45),
estoque INT,
PRIMARY KEY (id_produto)
); 

CREATE TABLE compra(
id_compra INT NOT NULL AUTO_INCREMENT,
data_horario DATETIME,
quantidade INT,
PRIMARY KEY (id_compra)
); 

ALTER TABLE compra ADD COLUMN produto_id INT, ADD FOREIGN KEY (produto_id) REFERENCES produto(id_produto);
ALTER TABLE compra ADD COLUMN cliente_id INT, ADD FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente);

INSERT INTO cliente
(nome, cpf)
VALUES
('João', 18161227688),
('Carlos', 18161227299),
('Maria', 18161227211),
('Ana', 18161227233),
('Thiago', 18161227244);

INSERT INTO produto (nome_produto, codigo, estoque) VALUES
('Furadeira', 123456789, 10),
('botijão', 9876543200, 5),
('bola', 1122343200, 15),
('cadeira de praia', 9116543200, 9),
('Pneu', 1122334, 4);

INSERT INTO compra (data_horario, quantidade, produto_id, cliente_id) VALUES
('2024-09-10 20:00:00', 5, 1, 3), 
('2024-09-10 21:00:00', 5, 2, 2),  
('2024-09-10 22:00:00', 4, 1, 3),  
('2024-09-10 23:00:00', 8, 2, 2),  
('2024-09-10 18:00:00', 2, 5, 5); 

-- - Faça uma consulta que exiba as informações das 3 tabelas cliente, compra e produto. (1 ponto)
SELECT * FROM cliente JOIN compra on compra.cliente_id = cliente.id_cliente JOIN produto on compra.produto_id = produto.id_produto;

-- Faça uma consulta que exiba apenas o nome do cliente, id_compra e quantidade. (1 ponto)
SELECT cliente.nome, compra.id_compra, compra.quantidade FROM cliente
INNER JOIN compra ON cliente.id_cliente = compra.cliente_id;

-- Realize um LEFT JOIN entre as tabelas cliente e compra. (1 ponto)
SELECT * FROM  cliente LEFT JOIN compra ON compra.cliente_id = cliente.id_cliente;

-- Realize um RIGHT JOIN entre as tabelas cliente e compra. (1 ponto)
SELECT * FROM  cliente RIGHT JOIN compra ON compra.cliente_id = cliente.id_cliente;

-- Realize um JOIN entre as tabelas compra e produto. (1 ponto)
SELECT * FROM compra
INNER JOIN produto ON compra.id_compra = produto.id_produto;

-- Crie uma view chamada vw_compra_produto com a consulta da etapa anterior. (1 ponto)
CREATE VIEW vw_compra_produto AS
SELECT * FROM compra INNER JOIN produto ON compra.id_compra = produto.id_produto;

select * from vw_compra_produto;