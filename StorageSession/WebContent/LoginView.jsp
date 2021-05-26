<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html>

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
         <link rel="stylesheet" href="styles/credenziali.css">
		<title>Login</title>
	</head>

	<body>
		<% 
		UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
		if ((currentUser!=null)&&(!currentUser.isValid())){	
		%><br> Utente non valido, reinserisci le credenziali<br/><br/>   
		<%}%>
		<h1>LOGIN</h1>
		<form action="login" method="post">
			<input type="hidden" name="action" value="checkout">
			
			<label for=email>Inserisci email</label><br>
			<input type="email" name="email"><br>		
		
			<label for=pw>Inserisci password</label><br>
			<input type="password" name="pw">
			
			<input type="submit" value="Accedi">			
		
		</form>
		<br>
		<a href="guest.jsp" class=scelta>Procedi senza registrarti</a>
		<a href="registrazioneUtente.jsp" class=scelta>Registrati qui</a>
	</body>
</html>