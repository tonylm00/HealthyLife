DROP DATABASE IF EXISTS healthylife;
CREATE DATABASE healthylife;
USE healthylife;

CREATE TABLE utente(
  username varchar(30) primary key,
  password varchar(30) NOT NULL,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL,
  email varchar(30) NOT NULL
);
CREATE TABLE prodotto (
  id int primary key AUTO_INCREMENT,
  nome char(20) not null,
  descrizione char(100),
  prezzo int default 0,
  quantita int default 0
);
CREATE TABLE ordine(
  id int primary key AUTO_INCREMENT,
  nome char(20) not null,
  descrizione char(100),
  informazioni char(100),
  sconto int default 0,
  iva int default 22,

  id_utente varchar(30),

  FOREIGN KEY(id_utente) REFERENCES utente(username)
  on delete restrict
  on update cascade
);
CREATE TABLE aggiunta(
  quantita int NOT NULL,
  iva int default 22, 
  prezzo_unitario int NOT NULL,
  id_ordine int,
  id_prodotto int,
  PRIMARY KEY(id_ordine,id_prodotto),

  FOREIGN KEY(id_ordine) REFERENCES ordine(id)
  on delete restrict
  on update cascade,
  FOREIGN KEY(id_prodotto) REFERENCES prodotto(id)
  on delete restrict
  on update cascade
);

INSERT INTO prodotto values (1,"Kettlebell","Ghisa 18kg",30,4);
INSERT INTO prodotto values (2,"Kettlebell","Ghisa 10kg",22,6);
INSERT INTO prodotto values (3,"Dumbell","Ghisa 18kg",14,4);
INSERT INTO prodotto values (4,"Dumbell","Ghisa 8kg",11,11);
INSERT INTO prodotto values (5,"TapisRoulant","TR 22kmMAX",319,3);