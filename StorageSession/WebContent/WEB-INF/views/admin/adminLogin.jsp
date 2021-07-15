<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/styles/credenziali.css">
<title>Login Amministratore</title>
</head>
<body>
	<h1>Vista Amministratore</h1>
<form action="login" method="post"> 

     <input type="hidden" name="action" value="admin">
     <label for="username">Username</label>
     <input id="username" type="text" name="username" class=campo> 
     <br>   
     <label for="password">Password</label>
     <input id="password" type="password" name="password" class=campo> 
     <br>
     <input type="submit" value="Login" class=scelta>
     <input type="reset" value="Reset" class=scelta>
</form> 

</body>
</html>
