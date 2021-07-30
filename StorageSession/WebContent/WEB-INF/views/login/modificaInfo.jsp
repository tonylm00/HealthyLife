<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="java.util.Collection"
         import="java.util.Iterator"
         import="it.unisa.model.*"
   %>
<!doctype html>
<% 

  UserBean user = (UserBean) (session.getAttribute("currentSessionUser"));
if ((user==null)||(!user.isValid()))
{	
%>  
	<h1>Errore di accesso</h1> 
<%
	    return;
	}
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; uft-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
	</style>
	<title>Modifica Informazioni</title>
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<h1><%=user.getName() + " " + user.getSurname() %></h1>
	<h2><%=user.getEmail()%></h2>
	<h3>Inserisci le nuove informazioni di spedizione e pagamento</h3>
	<form action="login" method="post">		
	<fieldset>
	<input type="hidden" name=nome value=<%=user.getName() %>>
	<input type="hidden" name=cognome value=<%=user.getSurname() %>>
	<input type="hidden" name=email value=<%=user.getEmail() %>>
	<input type="hidden" name=pw value=<%=user.getPassword() %>>  
	<input type="hidden" name=telefono value=<%=user.getTelefono() %>> 
		<label for=indirizzo>Indirizzo: </label><br>
		<input id="indirizzo" name ="indirizzo" type="text" placeholder=<%=user.getIndirizzo() %> required class=campo><br><br>
	</fieldset>
	<fieldset>
		<label for=intestatario>Intestatario: </label><br>
		<input id="intestatario" name ="intestatario" type="text" placeholder=<%=user.getIntestatario() %> required class=campo><br><br>
			
		<label for=carta>Numero di carta: </label><br>
		<input id="carta" name ="carta" type="text" placeholder=<%=user.getNumeroCarta()%> required class=campo><br><br>
		
		<label for=dataScadenza>Data di scadenza: </label><br>
		<input id="dataScadenza" name ="dataScadenza" type="text" placeholder=<%=user.getDataScadenza() %> class=campo><br><br>
			
		<label for=cvv>CVV </label><br>
		<input id="cvv" name ="CVV" type="text" placeholder=<%=user.getCVV() %> required class=campo><br><br>
	</fieldset>
		<input type="hidden" name="action" value="modificaInfo">
		<input type="submit" value="Conferma modifiche" class=scelta>
	</form>
	</div><br><br><br><br><br>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>