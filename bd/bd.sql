CREATE TABLE tipo_participante (
	  id_tipo INT NOT NULL AUTO_INCREMENT,
	  area VARCHAR(128) NOT NULL,
	  responsabilidade VARCHAR(128) NOT NULL,
	  tipo VARCHAR(128) NOT NULL,
	  turno VARCHAR(26),
	  periodo VARCHAR(128),
	  PRIMARY KEY(id_tipo)
);

CREATE TABLE participante (
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
	  PRIMARY KEY(matricula),
	  FOREIGN KEY(cargo) REFERENCES tipo_participante(id_tipo)
);

CREATE TABLE marticipacao (
	  id_participacao NOT NULL UTO_INCREMENT,
	  participante 	INT NOT NULL,
	  modalidade 		INT NOT NULL,
	  pontos			INT DEFAULT 0,
	  PRIMARY KEY(id_participacao),
	  FOREIGN KEY(participante) REFERENCES participante(matricula),
	  FOREIGN KEY(modalidade) REFERENCES modalidade(id_modalidade)
);

CREATE TABLE mategoria (
	  id_categoria 	INT NOT NULL AUTO_INCREMENT,
	  nome 			VARCHAR(30) NOT NULL,
	  descricao 		VARCHAR(30) NOT NULL,
	  PRIMARY KEY(id_categoria)
);

CREATE TABLE modalidade (
	  id_modalidade 	INT NOT NULL AUTO_INCREMENT,
	  nome 			VARCHAR(128) NOT NULL,
	  descricao 		VARCHAR(256),
	  equipe_quant	INT,
	  categoria 		INT,
	  PRIMARY KEY(id_modalidade),
	  FOREIGN KEY(categoria) REFERENCES categoria(id_categoria)
);
