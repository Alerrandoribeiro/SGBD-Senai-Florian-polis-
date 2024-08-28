CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE sala(
id_sala INT NOT NULL AUTO_INCREMENT,
nome_sala VARCHAR(45) NOT NULL,
capacidade_sala INT NOT NULL,
PRIMARY KEY (id_sala)
); 
 
 CREATE TABLE turma(
id_turma INT NOT NULL AUTO_INCREMENT,
nome_turma VARCHAR(45) NOT NULL,
periodo_turma VARCHAR(45) NOT NULL,
PRIMARY KEY (id_turma)
); 

 CREATE TABLE professor(
id_professor INT NOT NULL AUTO_INCREMENT,
nome_professor VARCHAR(45) NOT NULL,
formacao_professor VARCHAR(45) NOT NULL,
PRIMARY KEY (id_professor)
); 

 CREATE TABLE aula(
id_aula INT NOT NULL AUTO_INCREMENT,
nome_aula VARCHAR(45) NOT NULL,
PRIMARY KEY (id_aula)
); 

 ALTER TABLE turma ADD COLUMN sala_id INT, ADD FOREIGN KEY (sala_id) REFERENCES sala(id_sala);
 ALTER TABLE professor ADD COLUMN turma_id INT, ADD FOREIGN KEY (turma_id) REFERENCES turma(id_turma);
 ALTER TABLE aula ADD COLUMN professor_id INT, ADD FOREIGN KEY (professor_id) REFERENCES professor(id_professor);

