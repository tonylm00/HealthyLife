<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
		 	.footer
		 	{
		 		position: absolute;
		 	}
	</style>
	
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<h1>ACQUISTA QUI SENZA REGISTRATI</h1>
	<h3>Inserisci informazioni:</h3>
	<form action="order" method="post">
		<fieldset><legend>CONTATTO</legend>
		<input type="hidden" name="action" value="guest">
		<label for=nome>Nome: </label><br>
		<input id="nome" name="nome" type="text"  class=campo required><br>
		<label for=cognome>Cognome: </label><br>
		<input id="cognome" name ="cognome" type="text"  class=campo required><br>
		<label for=email>Email: </label><br>
		<input id="email" name="email" type="text" class=campo  required><br>
		<label for=telefono>Telefono: </label><br>
		<input id="telefono" name ="telefono" type="text" class=campo required><br></fieldset>
		<fieldset><legend>SPEDIZIONE</legend>
		<label for=indirizzo>Indirizzo: </label><br>
		<input id="indirizzo" name="indirizzo" type="text" class=campo required><br>
		<input type="submit" value="Invia" class=scelta>
	</fieldset></form><br>
	<br><a href="login/LoginView.jsp" class=scelta>Accedi</a> <a class=scelta>o continua ad acquistare senza loggarti:</a>
	</div><br><br><br><br>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>

</body>
</html>