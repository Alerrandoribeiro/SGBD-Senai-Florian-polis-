CREATE DATABASE escola;
USE escola; 

CREATE TABLE sala(
id_sala INT NOT NULL AUTO_INCREMENT,
nome_sala VARCHAR(145) NOT NULL,
capacidade_sala VARCHAR(45),
PRIMARY KEY(id_sala)
);

CREATE TABLE turma(
id_turma INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(145) NOT NULL,
periodo VARCHAR(45) NOT NULL,
PRIMARY KEY(id_turma)
);


CREATE TABLE professor(
id_professor INT NOT NULL AUTO_INCREMENT,
nome_professor VARCHAR(145) NOT NULL,
formacao_professor VARCHAR(45),
PRIMARY KEY(id_professor)
);


CREATE TABLE aulas(
id_aula INT NOT NULL AUTO_INCREMENT,
nome_aula VARCHAR(145),
PRIMARY KEY(id_aula)
);

ALTER TABLE turma ADD COLUMN sala_id INT, ADD FOREIGN KEY (sala_id) REFERENCES sala(id_sala);
-- altere a tabela turma e adicione a coluna sala_id do tipo inteiro, adicione a chave estrangeira sala_id referenciando a tabela sala(id_sala);

ALTER TABLE aulas ADD COLUMN professor_id INT, ADD FOREIGN KEY (professor_id) REFERENCES professor(id_professor);

ALTER TABLE professor ADD COLUMN turma_id INT, ADD FOREIGN KEY (turma_id) REFERENCES turma(id_turma);


