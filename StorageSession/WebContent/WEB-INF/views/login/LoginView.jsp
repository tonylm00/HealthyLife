<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html>

<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
		 	
		 	.footer
		 	{
		 		position: absolute;
		 	}
		 </style>
	
		<title>Login</title>
	</head>


	 <body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
		<% 
		UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
		if ((currentUser!=null)&&(currentUser.isValid())){	
			response.sendRedirect("home?action=logged");
		}%>
		
	<br><br>
	<div align=center>
		 <form action="login" method="post">
		 <fieldset><legend>LOGIN</legend>
			<input type="hidden" name="action" value="login">
			
			<label for=email>Inserisci email</label><br>
			<input type="email" id=email name="email" class="campo" required><br>		
		
			<label for=pw>Inserisci password</label><br>
			<input type="password" id=password name="pw" class="campo" required>
			<%if(session.getAttribute("errorMessage")!= null) {%>
			<div id="utenteNonValido"><%=session.getAttribute("errorMessage") %></div><br>
			<%} %>
			<input type="submit" class="scelta" value="Accedi">			
		</fieldset></form> 
		<br>
		<a href="login?action=goRegistration" class=scelta>Registrati qui</a>
		<a href="login?action=goGuest" class=scelta>Acquista senza registrarti</a><br>
		</div>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	</body>
</html>