<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html>

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
		 </style>

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
	
		 <form action="login" method="post">
			<input type="hidden" name="action" value="login">
			
			<label for=email>Inserisci email</label><br>
			<input type="email" name="email" class="campo"><br>		
		
			<label for=pw>Inserisci password</label><br>
			<input type="password" name="pw" class="campo">
			
			<input type="submit" class="scelta" value="Accedi">			
		</form> 
		<br>
		<a href="login?action=goRegistration" class=scelta>Registrati qui</a>
		<a href="login?action=goGuest" class=scelta>Acquista senza registrarti</a><br>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	</body>
</html>