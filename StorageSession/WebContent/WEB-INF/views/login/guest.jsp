<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/footer.css" type="text/css"/>
	<link rel="stylesheet" href="resources/styles/credenziali.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/header.css" type="text/css"/>
	<title>Guest Page</title>
	
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<h1>ACQUISTA QUI SENZA REGISTRATI</h1>
	<form action="order" method="post">
		<input type="hidden" name="action" value="guest">
		<label for=nome>Nome: </label><br>
		<input id="nome" name="nome" type="text"  class=campo required><br>
		<label for=cognome>Cognome: </label><br>
		<input id="cognome" name ="cognome" type="text"  class=campo required><br>
		<label for=email>Email: </label><br>
		<input id="email" name="email" type="text" class=campo  required><br>
		<label for=telefono>Telefono: </label><br>
		<input id="telefono" name ="telefono" type="text" class=campo required><br>
		<label for=indirizzo>Indirizzo: </label><br>
		<input id="indirizzo" name="indirizzo" type="text" class=campo required><br>
		<input type="submit" value="Invia" class=scelta>
	</form>
	<br><a href="login/LoginView.jsp" class=scelta>Accedi</a> <a class=scelta>o continua ad acquistare senza loggarti:</a>
	<header>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</header>

</body>
</html>