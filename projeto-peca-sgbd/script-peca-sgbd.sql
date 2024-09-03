CREATE DATABASE revendedora;
USE revendedora;

CREATE TABLE categoria(
id_categoria INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(145) NOT NULL,
PRIMARY KEY(id_categoria)
);

CREATE TABLE fornecedor(
id_fornecedor INT NOT NULL AUTO_INCREMENT, 
nome VARCHAR(145) NOT NULL,
nacionalidade VARCHAR(45) NOT NULL,
PRIMARY KEY(id_fornecedor)
);

CREATE TABLE peca (
id_peca INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(145) NOT NULL,
peso DECIMAL(4,2) NOT NULL,
ano_fabricacao DATE NOT NULL,
PRIMARY KEY(id_peca)
);

ALTER TABLE peca ADD COLUMN fornecedor_id INT, ADD FOREIGN KEY(fornecedor_id) REFERENCES fornecedor(id_fornecedor);
ALTER TABLE peca ADD COLUMN categoria_id INT, ADD FOREIGN KEY(categoria_id) REFERENCES categoria(id_categoria);