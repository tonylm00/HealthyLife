<%@ page language="java"
contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"
%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
<title>Login Page</title>
</head>
<body>
	<h2>Login</h2>
	<form action="LoginServlet">
		Inserisci username
	<input type="text" name="username"/><br>
		Inserisci password
	<input type="password" name="password"/>
	
	<a href="LoginServlet?action=login"><input type="submit" value="Entra"></a>
	
	</form>
	 
	 <a href="LoginServlet?action=registra"><input type="submit" value="Registrati"></a>
	 
</body>
</html>