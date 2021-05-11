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
	<form action="LoginServlet" method="post">
		
		<label for=username>Inserisci username </label>
		<input type="text" name="username"><br>
		
		<label for=password>Inserisci password </label>
		<input type="password" name="password"/>
	
		<a href="LoginServlet?action=login">Login</a>
		<br>
		<a href="LoginServlet?action=registra">Registrati qui</a>
	</form>
	 
</body>
</html>