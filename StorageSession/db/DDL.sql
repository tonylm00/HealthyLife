DROP DATABASE IF EXISTS healthylife;
CREATE DATABASE healthylife;
USE healthylife;

CREATE TABLE utente(
  email varchar(30) PRIMARY KEY,
  pw varchar(30) NOT NULL,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL
  
);

CREATE TABLE guest(
  email varchar(30) PRIMARY KEY,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL
  
);

CREATE TABLE prodotto (
  id int primary key AUTO_INCREMENT,
  nome char(50) not null,
  descrizione text,
  informazioni text,
  prezzo int default 0,
  sconto int default 0,
  disponibilita boolean,
  quantita int default 0
  
);

CREATE TABLE ordine(
  id int primary key AUTO_INCREMENT,
  nome char(20) not null,
  descrizione char(100),
  dataOrdine datetime,
  prezzoNotIva double,
  prezzoIva double,

  idUtente varchar (30),
  idGuest varchar (30),
  
  FOREIGN KEY(idUtente) REFERENCES utente(email)
  on delete restrict
  on update cascade,
  
  FOREIGN KEY(idGuest) REFERENCES guest(email)
  on delete restrict
  on update cascade
);
CREATE TABLE aggiunta(
  id_ordine int,
  id_prodotto int,
  quantita int NOT NULL,
  iva int default 22, 
  prezzo_unitario int NOT NULL,
  
  PRIMARY KEY(id_ordine,id_prodotto),

  FOREIGN KEY(id_ordine) REFERENCES ordine(id)
  on delete restrict
  on update cascade,
  FOREIGN KEY(id_prodotto) REFERENCES prodotto(id)
  on delete restrict
  on update cascade
);