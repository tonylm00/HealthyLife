DROP DATABASE IF EXISTS healthylife;
CREATE DATABASE healthylife;
USE healthylife;


CREATE TABLE categoria(
	nome varchar(20) primary key,
    immagine text
    );
    
CREATE TABLE amministratore(
username varchar(15) primary key,
pw varchar(16) NOT NULL
);

CREATE TABLE utente(
  email varchar(30) PRIMARY KEY,
  pw varchar(30) NOT NULL,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL,
  indirizzo varchar(150),
  telefono varchar(15),
  intestatario varchar(50),
  numeroCarta varchar(16),
  dataScadenza varchar(7),
  CVV char(3)
);

CREATE TABLE guest(
  id int AUTO_INCREMENT PRIMARY KEY,
  email varchar(30) NOT NULL,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL,
  telefono varchar(15) not null,
  indirizzo varchar(150) not null,
  data_ora varchar(35)
);

CREATE TABLE prodotto (
  id int primary key AUTO_INCREMENT,
  nome char(50) not null,
  descrizione text,
  informazioni text,
  prezzo double default 0,
  sconto double default 0,
  iva double NOT NULL,
  prezzoscontato double default 0,
  quantita int default 0,
  immagine text
);

CREATE TRIGGER prezzoscontato_insert
BEFORE INSERT ON Prodotto
for each row
set new.prezzoscontato=(new.prezzo-(new.prezzo*new.sconto/100));

CREATE TRIGGER prezzoscontato_update
BEFORE update ON Prodotto
for each row
set new.prezzoscontato=(new.prezzo-(new.prezzo*new.sconto/100));

CREATE TABLE appartenenza(
	categoria varchar(20),
    prodotto int,
    
    PRIMARY KEY(categoria,prodotto),
    FOREIGN KEY (prodotto) REFERENCES prodotto(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	
    FOREIGN KEY (categoria) REFERENCES categoria(nome)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE ordine(
  id int primary key AUTO_INCREMENT,
  dataOrdine datetime,
  prezzoNotIva double,
  prezzoIva double,

  idUtente varchar (30),
  idGuest int,
  
  FOREIGN KEY(idUtente) REFERENCES utente(email)
  on delete restrict
  on update cascade,
  
  FOREIGN KEY(idGuest) REFERENCES guest(id)
  on delete restrict
  on update cascade
);

CREATE TABLE dettaglio(
  id_ordine int,
  id_prodotto int,
  quantita int NOT NULL,
  iva int default 22, 
  prezzo_unitario int NOT NULL,
  
  PRIMARY KEY(id_ordine,id_prodotto),

  FOREIGN KEY(id_ordine) REFERENCES ordine(id)
  on delete cascade
  on update cascade,
  FOREIGN KEY(id_prodotto) REFERENCES prodotto(id)
  on delete restrict
  on update cascade
);