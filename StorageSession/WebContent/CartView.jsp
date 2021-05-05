<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% Cart cart = (Cart) request.getSession().getAttribute("cart"); %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Healthy Life - Carrello</title>
</head>

<body>
	<% if(cart != null) { %>
		<h2>Carrello</h2>
		<table border="1">
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Quantità</th>
			<th>Prezzo Totale per articolo</th>
			
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   double tot=0.0;
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><a href="product?action=read&id=<%=beancart.getCode()%>"><%=beancart.getCode()%></a></td>
			<td><%=beancart.getName()%></td>
			<td>
				<form action="product">
					<input type="hidden" name="action" value="increaseQD">
					<input type="hidden" name="id" value="<%=beancart.getCode()%>">
					<input type="submit" value="+" >
				</form>
				<%=beancart.getCartQuantity()%>
				<form action="product">
					<input type="hidden" name="action" value="decreaseQD">
					<input type="hidden" name="id" value="<%=beancart.getCode()%>">
					<input type="submit" value="-" >
				</form></td>
			<td><%=beancart.getPrice() %> € </td>
			<td><a href="product?action=deleteC&id=<%=beancart.getCode()%>">Rimuovi dal carrello</a></td>
		</tr>
		<% tot += beancart.getTot(); } %>
	</table>
		<h4> Totale: <%=tot %> €</h4>		
	<% } else { %>	
		<h1>Il tuo carrello è vuoto</h1>
	<% } %>
	<br/><form class="" action="product" method="get">
		<a href="product?action=goCatalogue"> <input type="submit" value="Ritorna al catalogo"></a>
		<a href="product?action=deleteCart"><input type="submit" value="Svuota carrello"></a>
	</form>
</body>
</html>