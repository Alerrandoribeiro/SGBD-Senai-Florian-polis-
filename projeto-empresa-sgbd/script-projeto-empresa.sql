CREATE DATABASE projeto_empresa;
USE projeto_empresa;

CREATE TABLE unidade(
id_unidade INT NOT NULL AUTO_INCREMENT, 
nome_gerente VARCHAR(145) NOT NULL,
nome_supervisor VARCHAR(145) NOT NULL,
PRIMARY KEY(id_unidade)
);

CREATE TABLE departamento(
id_departamento INT NOT NULL AUTO_INCREMENT, 
sigla VARCHAR(45) NOT NULL,
centro_custo INT NOT NULL,
PRIMARY KEY(id_departamento),
unidade_id INT, FOREIGN KEY (unidade_id) REFERENCES unidade(id_unidade)
-- criando a chave estrangeira direta na tabela 
);

CREATE TABLE empresa(
id_empresa INT NOT NULL AUTO_INCREMENT,
codigo INT NOT NULL, 
nome VARCHAR(145) NOT NULL,
rua VARCHAR(145) NOT NULL,
numero INT NOT NULL,
bairro VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
cep VARCHAR(45) NOT NULL,
PRIMARY KEY(id_empresa)
);

CREATE TABLE consultor(
id_consultor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(145) NOT NULL,
cpf BIGINT(11) NOT NULL,
especializacao VARCHAR(45) NOT NULL,
funcao VARCHAR(45) NOT NULL,
PRIMARY KEY(id_consultor)
);

CREATE TABLE projeto(
id_projeto INT NOT NULL AUTO_INCREMENT,
numero VARCHAR(45) NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
valor DECIMAL(8,2) NOT NULL,
PRIMARY KEY(id_projeto),
empresa_id INT, FOREIGN KEY (empresa_id) REFERENCES empresa(id_empresa),
consultor_id INT, FOREIGN KEY (consultor_id) REFERENCES consultor(id_consultor),
departamento_id INT, FOREIGN KEY (departamento_id) REFERENCES departamento(id_departamento)
);
-- como alterar uma tabela via linha de comando e adicionar uma chave estrangeira
-- alter table departamento add column unidade_id int, add foreign key (unidade_id) references unidade(id_unidade);

