INSERT INTO amministratore VALUES
("root","root"),
("admin","admin");

INSERT INTO prodotto (nome,descrizione,informazioni,prezzo,sconto,iva,quantita,immagine)VALUES
("Peanut Butter - Confezione da 1kg","Burro di arachidi al naturale. La nostra crema spalmabile tutta da gustare","Per 100g: Grassi: 46g. Carboidrati: 12g. Proteine: 30g.","12","10","22","97","https://assets.sainsburys-groceries.co.uk/gol/1179101/1/640x640.jpg"),
("Set Bilanciere 70kg","SET BILANCIERE E DISCHI DA 70 KG: Questo set da 70 kg include 2 pesi da 15 kg, 2 da 10 kg, 2 da 5 kg, 2 da 1,5 kg, una sbarra e due clip di bloccaggio dal peso totale di 7 kg","","70","1","22","12","https://images-na.ssl-images-amazon.com/images/I/615p9sZ3s6L._AC_SY355_.jpg"),
("Set Bilanciere con 2 Manubri","homcom Set Bilanciere con 2 Manubri Pesi 14 Dischi Peso Totale: 70 kg in Acciaio e Plastica","Adatto al training muscolare professionale,Il rivestimento dei dischi per bilancieri è in plastica, in modo da consentire un allenamento non rumoroso","116","5","22","24","https://images-na.ssl-images-amazon.com/images/I/51jvDmG3SZL._AC_SY450_.jpg"),
("Tapis Roulant Curvo","Tapis roulant curvo galaxy con regolazione magnetica","Nastro completamente ammortizzante, sicuro e confortevole. Sistema di trasmissione con cuscinetti di precisione, fluido, con resistenza zero","750","10","22","5","https://www.azzurrafitness.com/wp-content/uploads/2020/12/tapis-roulant-curvo-1.jpg"),
("Cintura di cuoio per sollevamento pesi","Cintura in cuoio di ottima fattura, resistente, utilizzabile come supporto lombale negli esercizi di schiena e gambe.","UNISEX","30","5","10","38","https://images-na.ssl-images-amazon.com/images/I/81QV1VjU57L._AC_SY450_.jpg"); 

INSERT INTO categoria VALUES
("Nutrizione","https://www.innaturale.com/wp-content/uploads/2018/11/Il-cibo-salutare-che-sta-rovinando-ambiente.jpg"),
("Accessori","https://images-na.ssl-images-amazon.com/images/I/51CQjWEs%2BvL._SS600_.jpg"),
("Home Gym","https://www.exercise.co.uk/media/catalog/product/cache/ab69a09c4ff4588bb160f13ab6ce3898/m/a/marcy-eclipse-hg5000-with-model.1200px.jpg");

INSERT INTO appartenenza(categoria,prodotto) VALUES
("Nutrizione","1"),
("Home Gym","2"),
("Home Gym","3"),
("Home Gym","4"),
("Accessori","5");