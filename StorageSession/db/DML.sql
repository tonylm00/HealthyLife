
INSERT INTO utente VALUES
("a.lamarca24@studenti.unisa.it","1234","Antonio","La Marca"),
("f.amato37@studenti.unisa.it","1234","Francesco","Amato");

INSERT INTO amministratore VALUES
("root","root"),
("admin","admin");

INSERT INTO categoria VALUES
("nutrizione","Nutrizione e integrazione"),
("abbigliamentoUomo","abbigliamento ideale per il tuo workout"),
("abbigliamentoDonna","abbigliamento ideale per il tuo workout"),
("attrezzi","la migliore attrezzatura per allenarti al meglio");

INSERT INTO prodotto (nome,descrizione,informazioni,prezzo,sconto,iva,quantita,categoria)VALUES
("Peanut Butter","Burro d'arachidi","Poco importa se spalmato su una fetta di pane, inserito nella preparazione dei tuoi spuntini preferiti o assaporato direttamente dal barattolo: il burro d’arachidi è uno di quegli alimenti che non può mancare nella tua dispensa.","10","2","10","87","nutrizione"),
("Crema proteica","Crema proteica al cioccolato","Un appello agli amanti del cioccolato: con le nostre Creme Proteiche dal gusto irresistibile, la bontà del cacao saprà regalare il massimo piacere.","10","1","10","64","nutrizione"),
("Pop Roll","Snack al caramello","Trovare lo spuntino giusto può essere difficile, specialmente se stai cercando di tenere sotto controllo le calorie assunte. Ecco perché abbiamo creato i Pop Roll, rotolini ripieni pensati appositamente per le tue esigenze. Confezione da 18 pezzi","25","7","10","48","nutrizione"),
("Coppia di manubri","Manubri in vinile 0.5 kg","Ideali per tutti i tipi di esercizi i MANUBRI AEROBICA IN VINILE sono particolarmente apprezzati per l’ottimo rapporto qualità/prezzo.","5","0","10","33","attrezzi"),
("Coppia di manubri","Manubri in vinile 1 kg","Ideali per tutti i tipi di esercizi i MANUBRI AEROBICA IN VINILE sono particolarmente apprezzati per l’ottimo rapporto qualità/prezzo.","8","0","10","28","attrezzi"),
("Dumbell","Singolo manubrio 10 kg","I Black PU Rubber Dumbbell sono manubri gommati professionali a peso fisso per utilizzo intenso. ","45","6","10","23","attrezzi"),
("Dumbell","Singolo manubrio 16 kg","I Black PU Rubber Dumbbell sono manubri gommati professionali a peso fisso per utilizzo intenso. ","72","8","10","23","attrezzi"),
("Tappetino monoblocco","Tappetino monoblocco EVA - Rosso","I tappetini monoblocco 100×60 cm con occhielli, estremamente pratici e facili da riporre, rappresentano la miglior soluzione nel rapporto qualità prezzo. L’EVA è un materiale pregiato, morbido ed indeformabile, con un coefficiente elastico regolare e gradevole al tatto.","24","8","10","12","attrezzi"),
("T-Shirt - Port Marl","Muscle-fit t-shirt","It's our mission to make sure you're covered throughout all types of training — which is where our Performance range comes in. This short-sleeved t-shirt is made with soft-touch stretch fabric and features raglan sleeves to offer both comfort and maximum range of movement as you push for your goals.","25","0","10","33","abbigliamentoUomo");
