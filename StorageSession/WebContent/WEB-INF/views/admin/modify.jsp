<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<%
	ProductBean product = ProductDAO.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/credenziali.css" %>
	</style>
	<title>Modifica</title>
</head>
<body>
<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
<br><br>
<div align=center>
	<form action="product" method="post">
	<fieldset><legend>MODIFICA PRODOTTO:</legend>
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20" required value="<%=product.getName()%>" readonly class=campo><br> 
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required  class=campo ><%=product.getDescription()%></textarea><br>
		
		<label for="informazioni">Informazioni:</label><br>
		<textarea name="informazioni" maxlength="100" rows="3" required  class=campo><%=product.getInfo()%></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="text" class=campo required value="<%=product.getPrice()%>"><br>

		<label for="quantità">Quantita:</label><br> 
		<input name="quantita" type="text" class=campo required value="<%=product.getQuantity()%>"><br>
		
		<label for="sconto">Sconto:</label><br> 
		<input name="sconto" type="text" class=campo required value="<%=product.getSconto()%>"><br>
		
		<label for="iva">IVA:</label><br> 
		<input name="iva" type="text"  class=campo required value="<%=product.getIva()%>"><br>
		
		<label for="prezzos">Prezzo Scontato:</label><br> 
		<input  type="text" readonly class=campo required value="<%=product.getPrezzoScontato()%>"><br>

		<input type="submit" value="Modifica prodotto" class=scelta>
	</fieldset></form>
</div>
</body>
</html>