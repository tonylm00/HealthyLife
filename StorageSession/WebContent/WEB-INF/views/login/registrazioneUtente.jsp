<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script> <%@include file="/resources/js/formValidation.js"%> </script>
   
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
		 	
	</style>
	
	<title>HealthyLife</title>
</head>

	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	
	<div align=center>
	<br><h1 >Form di registrazione</h1>
	<h2>Inserisci qui i tuoi dati</h2><br>
	
	<form action="login" method="post" name=reg>
		
		<fieldset><legend>CONTATTO</legend>
		<label for=name>Nome: </label><br>
		<input id="name" name="name" type="text" required class=campo onblur="checkNome(this.form.name)"><br><div id="nomeDiv"></div><br>
		
		<label for=surname>Cognome: </label><br>
		<input id="surname" name ="surname" type="text" required class=campo onblur="checkCognome(this.form.surname)"><br><div id="cognomeDiv"></div><br>
	
		<label for=email>Email: </label> <br>
		<input id="email" name="email" type="email"required class=campo ><br><br>
	
		<label for=pw>Password: </label><br>
		<input id="pw" name="pw" type="password" required class=campo><br><br><br>
		</fieldset><fieldset><legend align=left>SPEDIZIONE</legend>
		<label for=indirizzo>Indirizzo: </label><br>
		<input id="indirizzo" name ="indirizzo" type="text" placeholder="Via e civico, CAP, provincia" required class=campo><br><br>
		
		<label for=telefono>Numero di telefono: </label><br>
		<input id="telefono" name ="telefono" type="text" required class=campo minlength="9" maxlength="12" onblur="checkTelefono(this.form.telefono)"><br><div id="telefonoDiv"></div><br>
		</fieldset>
		
		<fieldset><legend>PAGAMENTO</legend>
			<label for=intestatario>Intestatario: </label><br>
			<input id="intestatario" name ="intestatario" type="text" required class=campo onblur="checkIntestatario(this.form.intestatario)"><br><div id="intestatarioDiv"></div><br>
			
			<label for=carta>Numero di carta: </label><br>
			<input id="carta" name ="carta" type="text" required class=campo minlength="16" maxlength="16" onblur="checkCarta(this.form.carta)"><br><div id="cartaDiv"></div><br>
		
			<label for=dataScadenza>Data di scadenza: </label><br>
			<input id="dataScadenza" name ="dataScadenza" type="text" placeholder="MM/AA"  required class=campo minlength="5" maxlength="5" onblur="checkDate(this.form.dataScadenza)"><br><div id="dateDiv"></div><br>
			
			<label for=cvv>CVV </label><br>
			<input id="cvv" name ="cvv" type="text" required class=campo minlength="3" maxlength="3" onblur="checkCVV(this.form.cvv)"><br><div id="cvvDiv"></div><br>
		</fieldset>
		<input type="hidden" name="action" value="registration">
		<input type="submit" value="Conferma registrazione" class=scelta>
	</form>
	</div>
	<br><br><br>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>