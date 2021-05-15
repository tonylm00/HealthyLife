<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
	</head>

	<body>
		<% 
		UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
		if ((currentUser!=null)&&(!currentUser.isValid())){	
		%><br> Utente non valido, reinserisci le credenziali<br/><br/>   
		<%}%>
		<form action="login" method="post">
			<input type="hidden" name="action" value="checkout">
			Please enter your email 		
			<input type="text" name="email"/><br>		
		
			Please enter your password
			<input type="password" name="pw"/>
			
			<input type="submit" value="submit">			
		
		</form>
		<a href="guest.jsp">Acquista senza registrarti</a><br/>
		<a href="registrazioneUtente.jsp">Registrati</a>
	</body>
</html>