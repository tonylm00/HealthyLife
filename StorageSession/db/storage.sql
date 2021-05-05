DROP DATABASE IF EXISTS healthylife;
CREATE DATABASE healthylife;
USE healthylife;

DROP TABLE IF EXISTS prodotto;

CREATE TABLE prodotto (	
  id int primary key AUTO_INCREMENT,
  nome char(20) not null,
  descrizione char(100),
  prezzo int default 0,
  quantita int default 0
);

INSERT INTO prodotto values (1,"Kettlebell","Ghisa 18kg",30,4);
INSERT INTO prodotto values (2,"Kettlebell","Ghisa 10kg",22,6);
INSERT INTO prodotto values (3,"Dumbell","Ghisa 18kg",14,4);
INSERT INTO prodotto values (4,"Dumbell","Ghisa 8kg",11,11);
INSERT INTO prodotto values (5,"TapisRoulant","TR 22kmMAX",319,3);
