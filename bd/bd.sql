-- Script SQL do Banco de Dados do Sistema de Gestão do SECIF.
-- Copyright (C) 2017-18, Instituto Federal da Paraíba - IFPB.
--
-- SGBD: MySQL (v 5.7)

CREATE DATABASE secif_db;
USE secif_db;

CREATE TABLE TipoParticipante (
	  id_tipo INT NOT NULL AUTO_INCREMENT,
	  area VARCHAR(128) NOT NULL,
	  responsabilidade VARCHAR(128) NOT NULL,
	  tipo VARCHAR(128) NOT NULL,
	  turno VARCHAR(26),
	  periodo VARCHAR(128),
	  PRIMARY KEY(id_tipo)
)

CREATE TABLE Participante (
	  matricula		INT(6) NOT NULL,
	  identidade 		VARCHAR(26),
	  nome 			VARCHAR(128),
	  nomeArtistico 	VARCHAR(128),
	  email 			VARCHAR(128),
	  sexo			VARCHAR(2),
	  endereco 		VARCHAR(128),
	  cidade 			VARCHAR(128),
	  uf 				VARCHAR(2),
	  fone 			VARCHAR(26),
	  cargo 			INT,
	  PRIMARY KEY(id_participante),
	  FOREIGN KEY(cargo) REFERENCES TipoParticipante(id_tipo)
)

CREATE TABLE Participacao (
	  id_participacao NOT NULL UTO_INCREMENT,
	  participante 	INT NOT NULL,
	  modalidade 		INT NOT NULL,
	  pontos			INT DEFAULT 0,
	  PRIMARY KEY(id_participacao),
	  FOREIGN KEY(participante) REFERENCES Participante(id_participante),
	  FOREIGN KEY(modalidade) REFERENCES Modalidade(id_modalidade)
)

CREATE TABLE Categoria (
	  id_categoria 	INT NOT NULL AUTO_INCREMENT,
	  nome 			VARCHAR(30) NOT NULL,
	  descricao 		VARCHAR(30) NOT NULL,
	  PRIMARY KEY(id_categoria)
)

CREATE TABLE Modalidade (
	  id_modalidade 	INT NOT NULL AUTO_INCREMENT,
	  nome 			VARCHAR(128) NOT NULL,
	  descricao 		VARCHAR(256),
	  equipe_quant	INT,
	  categoria 		INT,
	  PRIMARY KEY(id_modalidade),
	  FOREIGN KEY(categoria) REFERENCES Categoria(id_categoria)
)
