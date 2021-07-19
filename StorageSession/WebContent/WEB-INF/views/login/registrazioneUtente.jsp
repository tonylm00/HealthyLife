<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; uft-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
	</style>
	<script type="text/javascript" src="/resources/js/formValidation.js"></script>
	<title>Form di registrazione</title>
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	
	<h1>REGISTRAZIONE UTENTE</h1>
	<form action="login" method="post">	
		<fieldset>
		<label for=name>Nome: </label><br>
		<input id="name" name="name" type="text" required class=campo onblur="checkNome(this.form.name)"><div id="nomeDiv"></div><br>
		
		<label for=surname>Cognome: </label><br>
		<input id="surname" name ="surname" type="text" required class=campo onblur="checkCognome(this.form.surname)"><div id="cognomeDiv"></div><br>
	
		<label for=email>Email: </label> <br>
		<input id="email" name="email" type="email"required class=campo onblur="checkEmail(this.form.email)"><div id="emailDiv"></div>
	
		<label for=pw>Password: </label><br>
		<input id="pw" name="pw" type="password" required class=campo><br><br>
		</fieldset><fieldset>
		<label for=indirizzo>Indirizzo: </label><br>
		<input id="indirizzo" name ="indirizzo" type="text" placeholder="Via e civico, CAP, provincia" required class=campo><br><br>
		
		<label for=telefono>Numero di telefono: </label><br>
		<input id="telefono" name ="telefono" type="text" required class=campo onblur="checkTelefono(this.form.address)"><br><br>
		</fieldset>
		
		<fieldset>
			<label for=intestatario>Intestatario: </label><br>
			<input id="intestatario" name ="intestatario" type="text" required class=campo><br><br>
			
			<label for=carta>Numero di carta: </label><br>
			<input id="carta" name ="carta" type="text" required class=campo><br><br>
		
			<label for=dataScadenza>Data di scadenza: </label><br>
			<input id="dataScadenza" name ="dataScadenza" type="text" placeholder="MM/AA" class=campo><br><br>
			
			<label for=cvv>CVV </label><br>
			<input id="cvv" name ="cvv" type="text" required class=campo><br><br>
		</fieldset>
		
		<input type="hidden" name="action" value="registration">
		<input type="submit" value="Conferma registrazione" class=scelta> <input type="reset" class=scelta value="Annulla registrazione">
	</form>
	
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>