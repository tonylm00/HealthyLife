<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/footer.css" type="text/css"/>
	<link rel="stylesheet" href="styles/credenziali.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/header.css" type="text/css"/>
	<title>Guest Page</title>
	
</head>
<body>
	<header>
		<%@ include file="/fragment/header.jsp" %>
	</header>
	<h1>ACQUISTA QUI SENZA REGISTRATI</h1>
	<form action="order" method="post">
		<input type="hidden" name="action" value="guest">
		<label for=nome>Nome: </label><br>
		<input id="nome" name="nome" type="text"  required><br>
		<label for=cognome>Cognome: </label><br>
		<input id="cognome" name ="cognome" type="text"  required><br>
		<label for=email>Email: </label><br>
		<input id="email" name="email" type="text"  required><br>
		<label for=telefono>Telefono: </label><br>
		<input id="telefono" name ="telefono" type="text" required><br>
		<label for=indirizzo>Indirizzo: </label><br>
		<input id="indirizzo" name="indirizzo" type="text" required><br>
		<input type="submit" value="Invia"> <input type="reset">
	</form>
	<br><a href="LoginView.jsp" class=scelta>Accedi</a> <a class=scelta>o continua ad acquistare senza loggarti:</a>
	

</body>
</html>