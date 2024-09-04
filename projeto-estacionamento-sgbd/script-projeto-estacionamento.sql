CREATE DATABASE locacao;
USE locacao;

CREATE TABLE ticket(
id_ticket INT NOT NULL AUTO_INCREMENT,
codigo_barra INT,
observacao TEXT,
PRIMARY KEY(id_ticket)
);

CREATE TABLE estacionamento(
id_estacionamento INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(145),
CNPJ BIGINT,
PRIMARY KEY(id_estacionamento)
);

CREATE TABLE setor(
id_setor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(145),
descricao VARCHAR(145),
PRIMARY KEY(id_setor)
);

CREATE TABLE vaga(
id_vaga INT NOT NULL AUTO_INCREMENT,
numero_vagas INT,
PRIMARY KEY(id_vaga)
);

ALTER TABLE estacionamento ADD COLUMN ticket_id INT, ADD FOREIGN KEY (ticket_id) REFERENCES ticket(id_ticket);
ALTER TABLE setor ADD COLUMN estacionamento_id INT, ADD FOREIGN KEY (estacionamento_id) REFERENCES estacionamento (id_estacionamento);
ALTER TABLE vaga ADD COLUMN setor_id INT, ADD FOREIGN KEY (setor_id) REFERENCES setor (id_setor);
-- alterando o tipo de dado da coluna descrição.
ALTER TABLE setor MODIFY COLUMN descricao VARCHAR(100);
--  Renomeando o nome da tabela codigo_barra para codigo na tabela ticket.
ALTER TABLE ticket RENAME COLUMN codigo_barra TO codigo; 
-- Apagando a coluna observacao da tabela ticket.
ALTER TABLE ticket DROP COLUMN observacao;
-- Alterando o nome da tabela estacionamento para parking.
ALTER TABLE estacionamento RENAME TO parking;
