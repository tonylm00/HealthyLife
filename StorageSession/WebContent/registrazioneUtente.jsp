<!doctype html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" href="styles/credenziali.css">
<title>Registrazione utente</title>
</head>
<body>
	<h1>REGISTRAZIONE UTENTE</h1>
	<form action="login" method="post">
		
		<label for=name>Nome: </label><br>
		<input id="name" name="name" type="text" required><br><br>
		
		<label for=surname>Cognome: </label><br>
		<input id="surname" name ="surname" type="text" required><br><br>
	
		<label for=email>Email: </label> <br>
		<input id="email" name="email" type="email"required>
		
		<% 
			if(request.getSession().getAttribute("email")!=null && request.getSession().getAttribute("email").equals("false"))
			{	
				%>   email già utilizzata, scegline un altro
			<%}%>
		<br><br>
		
		<label for=pw>Password: </label><br>
		<input id="pw" name="pw" type="password" required><br><br>
		
		<input type="hidden" name="action" value="registration">
		<input type="submit" value="Conferma registrazione"> <input type="reset" value="Annulla registrazione">
		
	</form>
</body>