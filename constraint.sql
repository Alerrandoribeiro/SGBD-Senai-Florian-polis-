CREATE DATABASE regra_constraint;

USE regra_constraint;

CREATE TABLE usuario(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf BIGINT UNIQUE,
pais VARCHAR(50) DEFAULT 'Brasil',
graduado ENUM('Sim','Nao'),
num_filhos INT, 
CHECK (num_filhos >=0),
PRIMARY KEY(id_cliente)
);

SELECT * FROM usuario;

INSERT INTO usuario (nome, cpf, pais, graduado, num_filhos) VALUES
('João da Silva', 12345678901, 'Brasil', 'Sim', 2),
('Maria Oliveira', 98765432100, 'Brasil', 'Nao', 0),
('Pedro Santos', 11122233344, 'Brasil', 'Sim', 1),
('Ana Costa', 44455566677, 'Brasil', 'Nao', 3),
('Lucas Pereira', 88899900011, 'Brasil', 'Sim', 0);

-- TESTANDO A CONSTRAINT UNIQUE => Não deve permitir a iserção de dados repetido. ex:cpf

INSERT INTO usuario (nome, cpf,graduado, num_filhos) VALUES
('Glauberty Ribeiro',123456789010, 'Sim', 1);

select * from usuario;