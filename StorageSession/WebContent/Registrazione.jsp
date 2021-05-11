<%@ page language="java"
contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"
%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
<title>Registrati qui</title>
</head>
<body>
	<h2>Registrazione</h2>
	<form action="RegistrationServlet" method="get">
	
	<label for="nome">Inserisci nome </label>
	<input type="text" name="nome"><br>
	
	<label for="cognome">Inserisci cognome </label>
	<input type="text" name="cognome"><br>
		
	<label for="email">Inserisci email </label>
	<input type="email" name="email"><br>
	
	<label for="username">Inserisci username </label>
	<input type="text" name="username"><br>
	
	<label for="password">Inserisci password </label>
	<input type="password" name="password" >
	
	<a href="RegistrationServlet?action=registra">Conferma registrazione</a>
	 </form>
	
	<a href="RegistrationServlet?action=goHome"> Annulla registrazione</a>
</body>
</html>