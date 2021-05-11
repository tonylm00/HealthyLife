<%@ page language="java"
contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"
%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
<title>Registration Page</title>
</head>
<body>
	<h2>Registrazione</h2>
	<form action="RegistrationServlet" method="get">
		Inserisci nome
	<input type="text" name="nome"/><br>
		Inserisci cognome
	<input type="text" name="cognome"/><br>
		Inserisci email
	<input type="text" name="email"/><br>
		Inserisci username
	<input type="text" name="username"/><br>
		Inserisci password
	<input type="password" name="password"/>
	
	<br>
		<a href="RegistrationServlet?action=registra">Conferma<input type="submit" value="Conferma"></a>
	 </form>
	<br>
		<a href="RegistrationServlet?action=annulla"><input type="submit" value="Annulla"></a>
</body>
</html>