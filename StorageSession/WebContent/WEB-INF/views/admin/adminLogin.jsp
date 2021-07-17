<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	<%@include file="/resources/styles/header.css" %>
	<%@include file="/resources/styles/credenziali.css" %>
</style>
<title>ADMIN</title>
</head>
<body>
<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<h1>Login amministratore</h1>
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
