<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html>

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login</title>
	</head>

	<body>
		<% 
		UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
		if ((currentUser!=null)&&(!currentUser.isValid())){	
		%><br> Utente non valido, reinserisci le credenziali<br/><br/>   
		<%}%>
		<form action="login" method="post">
			<input type="hidden" name="action" value="checkout">
			
			<label for=email>Inserisci email</label><br>
			<input type="email" name="email"/><br>		
		
			<label for=pw>Inserisci password</label><br>
			<input type="password" name="pw"/>
			
			<input type="submit" value="submit">			
		
		</form>
		<br>
		<a href="guest.jsp">Procedi senza registrarti</a><br/>
		<a href="registrazioneUtente.jsp">Registrati qui</a>
	</body>
</html>