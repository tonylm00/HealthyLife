INSERT INTO utente (email,pw,nome,cognome) VALUES
("antonio@gmail.com","1234","Antonio","La Marca"),
("francesco@gmail.com","1234","Francesco","Amato");

INSERT INTO amministratore VALUES
("root","root"),
("admin","admin");

INSERT INTO categoria VALUES
("Nutrizione","/Users/antoniolamarca/Documents/PicsTSW/categorie/3.jpg"),
("Abbigliamento Uomo","/Users/antoniolamarca/Documents/PicsTSW/categorie/1.jpg"),
("Abbigilamento Donna","/Users/antoniolamarca/Documents/PicsTSW/categorie/1.jpg"),
("Home Gym","/Users/antoniolamarca/Documents/PicsTSW/categorie/2.jpg");

INSERT INTO prodotto (nome,descrizione,informazioni,prezzo,sconto,iva,quantita,immagine)VALUES
("Peanut Butter - Confezione da 1kg","Burro di arachidi al naturale. La nostra crema spalmabile tutta da gustare","Per 100g: Grassi: 46g. Carboidrati: 12g. Proteine: 30g.","12","10","22","97","/Users/antoniolamarca/Documents/PicsTSW/prodotti/pbutter.jpg");

INSERT INTO appartenenza VALUES
("Nutrizione","1");