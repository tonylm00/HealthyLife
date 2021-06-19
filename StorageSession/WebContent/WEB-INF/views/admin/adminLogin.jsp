<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="LoginStyle.css">
<title>Login Amministratore</title>
</head>
<body>
	<h3>Vista Amministratore</h3>
<form action="login" method="post"> 

     <input type="hidden" name="action" value="admin">
     <label for="username">Username</label>
     <input id="username" type="text" name="username"> 
     <br>   
     <label for="password">Password</label>
     <input id="password" type="password" name="password"> 
     <br>
     <input type="submit" value="Login">
     <input type="reset" value="Reset">
</form> 

</body>
</html>
