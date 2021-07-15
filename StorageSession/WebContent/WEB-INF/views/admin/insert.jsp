<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<%
	Collection<?> products = (Collection<?>) ProductDAO.doRetrieveAll(null);
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/header.css" type="text/css"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/footer.css" type="text/css"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/credenziali.css" type="text/css"/>
	<title>Amministratore - Inserimento prodotto</title>
</head>
<body>

	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	
	<h2>Aggiungi nuovo prodotto</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20" required class=campo><br> 
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required class=campo ></textarea><br>
		
		<label for="informazioni">Informazioni:</label><br>
		<textarea name="informazioni" maxlength="100" rows="3" required class=campo></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" min="0" step="0.01" value="0.0" required class=campo><br>

		<label for="quantita">Quantità:</label><br> 
		<input name="quantita" type="number" min="1" value="1" required class=campo><br>

		<label for="sconto">Sconto:</label><br> 
		<input name="sconto" type="text" min="0" value="0.0" class=campo ><br>

		<label for="iva">IVA:</label><br> 
		<input name="iva" type="number"required class=campo><br>

		<input type="submit" value="Aggiungi prodotto al catalogo" class=scelta>
	</form>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>