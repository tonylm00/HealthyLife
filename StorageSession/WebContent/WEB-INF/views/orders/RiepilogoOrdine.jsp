<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser"); %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>
    
<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Riepilogo Ordine</title>
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/table.css" %>
		 	.footer
		 	{
		 		position: absolute;
		 	}
	</style>
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<h2>INFORMAZIONI UTENTE:</h2>
	<table>
	<tr><th align=left>Nome: </th><td><%=user.getName()%></td></tr>
	<tr><th align=left>Cognome:</th><td> <%=user.getSurname()%></td></tr>
	<tr><th align=left>Email: </th><td><%=user.getEmail()%></td></tr>
	<tr><th align=left>Indirizzo di spedizione: </th><td><%=user.getIndirizzo()%></td><td class=az><a href=home?action=goModificaInfo class=ac>MODIFICA</a></td></tr>
	<tr><th align=left>Numero di carta: </th><td><%=user.getNumeroCarta()%></td><td class=az><a href=home?action=goModificaInfo class=ac>MODIFICA</a></td></tr>
	<tr><th align=left>Scadenza: </th><td><%=user.getDataScadenza()%></td><td class=az><a href=home?action=goModificaInfo class=ac>MODIFICA</a></td></tr>
	</table>
	<br>
	<h2>INFORMAZIONI ORDINE:</h2>
	<table>
	<tr>
		<th>Nome: </th>
		<th>Quantità: </th>
		<th>Prezzo: </th>
		<th></th>
	</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
	<tr>
		<td align=center><%=beancart.getName()%></td>
		<td align=center><%=beancart.getCartQuantity()%></td>
		<td align=center><%=String.format("%.2f", beancart.getTot())%></td>
		<td align=center class=az><a class=ac href="cart?action=delete&id=<%=beancart.getCode()%>">ELIMINA</a></td>
	</tr>
	<%} %>
	</table>
	<br><br>
	<a href=order?action=conferma class=scelta>CONFERMA ORDINE</a>
	<br><br><br>
	</div>
<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
</footer>
</body>
</html>