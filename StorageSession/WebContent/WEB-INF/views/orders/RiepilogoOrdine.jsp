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
	</style>
</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<table border=1>
	<tr>
		<td>Nome: </td>
		<td>Cognome: </td>
		<td>Email: </td>
		<td>Indirizzo di spedizione: </td>
		<td>Numero di carta: </td>
		<td>Scadenza: </td>
	</tr>
	<tr>
		<td><%=user.getName()%></td>
		<td><%=user.getSurname()%></td>
		<td><%=user.getEmail()%></td>
		<td><%=user.getIndirizzo()%></td>
		<td><%=user.getNumeroCarta()%></td>
		<td><%=user.getDataScadenza()%></td>
	</tr>
	</table>
	<table>
	<tr>
		<td>Nome: </td>
		<td>Quantità: </td>
		<td>Codice: </td>
		<td>Descrizione: </td>
		<td>Prezzo: </td>
		
	</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
	<tr>
		<td><%=beancart.getName()%></td>
		<td><%=beancart.getCartQuantity()%></td>
		<td><%=String.format("%.2f", beancart.getTot())%></td>
		<td><a href="cart?action=delete&id=<%=beancart.getCode()%>">Elimina</a></td>
	</tr>
	<%} %>
	</table>
	<br><br>
	<form method="get" action="order">
		<input type="hidden" name="action" value="conferma">
		<button type="submit" id="sub">Procedi all'ordine</button>
	</form>	
	<br>
	
<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
</footer>
</body>
</html>