<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html>

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	    <link rel="stylesheet" href="resources/styles/header.css" type="text/css"/>
		<link rel="stylesheet" href="resources/styles/footer.css" type="text/css"/>
		<link rel="stylesheet" href="resources/styles/credenziali.css" type="text/css"/>

		<title>Login</title>
	</head>

	 <body>
	
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
		
		<% 
		UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
		if ((currentUser!=null)&&(!currentUser.isValid())){	
		%><br> Utente non valido, reinserisci le credenziali<br/><br/>   
		<%}%>
		<h1>LOGIN</h1>
		 <form action="login" method="post">
			<input type="hidden" name="action" value="login">
			
			<label for=email>Inserisci email</label><br>
			<input type="email" name="email" class="campo"><br>		
		
			<label for=pw>Inserisci password</label><br>
			<input type="password" name="pw" class="campo">
			
			<input type="submit" class="scelta" value="Accedi e procedi all'acquisto">			
		
		</form> 
		<br>
		<a href="login?action=goGuest" class=scelta>Procedi senza registrarti</a>
		<a href="login?action=goRegistration" class=scelta>Registrati qui</a>
		<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	</body>
</html>