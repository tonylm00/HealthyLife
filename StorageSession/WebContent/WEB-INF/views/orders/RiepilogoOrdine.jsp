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
	</style>
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<h2>INFORMAZIONI UTENTE:</h2>
	<table>
	<tr><td>Nome: <%=user.getName()%></td></tr>
	<tr><td>Cognome: <%=user.getSurname()%></td></tr>
	<tr><td>Email: <%=user.getEmail()%></td></tr>
	<tr><td>Indirizzo di spedizione: <%=user.getIndirizzo()%></td><td class=az><a href=home?action=goModificaInfo class=ac>MODIFICA</a></td></tr>
	<tr><td>Numero di carta: <%=user.getNumeroCarta()%></td><td class=az><a href=home?action=goModificaInfo class=ac>MODIFICA</a></td></tr>
	<tr><td>Scadenza: <%=user.getDataScadenza()%></td><td class=az><a href=home?action=goModificaInfo class=ac>MODIFICA</a></td></tr>
	</table>
	<br>
	<h2>INFORMAZIONI ORDINE:</h2>
	<table>
	<tr>
		<td>Nome: </td>
		<td>Quantità: </td>
		<td>Prezzo: </td>
		
	</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
	<tr>
		<td><%=beancart.getName()%></td>
		<td><%=beancart.getCartQuantity()%></td>
		<td><%=String.format("%.2f", beancart.getTot())%></td>
		<td class=az><a class=ac href="cart?action=delete&id=<%=beancart.getCode()%>">ELIMINA</a></td>
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