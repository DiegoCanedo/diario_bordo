DROP SCHEMA IF EXISTS Diario_Bordo;
DROP DATABASE IF EXISTS Diario_Bordo;
CREATE DATABASE Diario_Bordo;

USE Diario_Bordo;
DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario(id_usuario INT UNIQUE KEY PRIMARY KEY AUTO_INCREMENT NOT NULL, nome VARCHAR(100) NOT NULL, email VARCHAR(100) NOT NULL, senha VARCHAR(32) NOT NULL);
DROP TABLE IF EXISTS Diario;
CREATE TABLE Diario(id_diario INT UNIQUE KEY PRIMARY KEY AUTO_INCREMENT NOT NULL, id_usuario INT NOT NULL, data_diario DATETIME NOT NULL);
DROP TABLE IF EXISTS Resposta;
CREATE TABLE Resposta(id_resposta INT UNIQUE KEY PRIMARY KEY AUTO_INCREMENT NOT NULL, id_diario INT NOT NULL, id_pergunta INT NOT NULL, texto_resposta TEXT);
DROP TABLE IF EXISTS Pergunta;
CREATE TABLE Pergunta(id_pergunta INT UNIQUE KEY PRIMARY KEY AUTO_INCREMENT NOT NULL, texto_pergunta TEXT);

USE Diario_Bordo;
ALTER TABLE `Diario` 
ADD FOREIGN KEY (`id_usuario` ) REFERENCES `Usuario` (`id_usuario`);
ALTER TABLE `Resposta` 
ADD FOREIGN KEY (`id_diario` ) REFERENCES `Diario` (`id_diario`), ADD FOREIGN KEY (`id_pergunta` ) REFERENCES `Pergunta` (`id_pergunta`);

INSERT INTO `Usuario`(nome,email,senha) VALUES 
("Guilherme de Oliveira Teixeira","gteixeira14@yahoo.com.br",MD5('teste')),
("Diego Gonçalves Duarte Canedo","diego.canedo86@gmail.com",MD5('diego')),
("Leonardo Von Seehausen Lichtenberger","leo.licht.von@gmail.com",MD5('leonardo')),
("Gabriela Mendes Martins","gabrielammartins@live.com",MD5('gabriela')),
("Guilherme Sabino Rozante Rocha","guilhermesabinorocha@gmail.com",MD5('guilherme')),
("Mayana Ollivier Cockell","mayana.ollivier@gmail.com.br",MD5('mayana')),
("Rafael Santana de Jesus","rafael.santanarf18@gmail.com.br",MD5('rafael'));

INSERT INTO `Pergunta`(texto_pergunta) VALUES
("O que fiz hoje que realmente valeu o dia?"),
("O que fiz que poderia ser evitado?"),
("O que posso fazer para melhorar minha atitude?");

