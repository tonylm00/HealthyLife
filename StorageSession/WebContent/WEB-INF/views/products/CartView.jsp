<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
	 	<%@include file="/resources/styles/header.css" %>
	 	<%@include file="/resources/styles/footer.css" %>
	 	<%@include file="/resources/styles/table.css" %>
	</style>

	<title>Il mio carrello</title>	
</head>

<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<h1>Il mio carrello</h1><br><br>
	<% if(cart != null && cart.getSize()!=0) { %>
		
		<table class="view">
		
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
		    <td><img width=110px src="<%=beancart.getImmagine()%>"></td>
			<td><%=beancart.getName()%></td>
			<td> 
				<form action="cart">
					<input type="hidden" name="action" value="increaseQ">
					<input type="hidden" name="id" value="<%=beancart.getCode()%>">
					<input type="submit" value="+" >
				</form>
				<%=beancart.getCartQuantity()%>
				<form action="cart">
					<input type="hidden" name="action" value="decreaseQ">
					<input type="hidden" name="id" value="<%=beancart.getCode()%>">
					<input type="submit" value="-" >
				</form>
			</td>
			<td><%=beancart.getTot()%> €</td>
			<td class=az><a class="ac" href="cart?action=delete&id=<%=beancart.getCode()%>"><strong>Rimuovi dal carrello</strong></a></td>
		</tr>
		<%} %>
	</table>
	<p class="message"> Prezzo totale: <%=cart.getTotPrice()%> € </p><br><br>
	<a href="order?action=checkout" class=scelta> Checkout</a></div><br><br><br><br>
	<% } else { %>	
		<a class=messageSmall href="home?action=goHome">Visita il nostro sito ed aggiungi prodotti al carrello</a>
	<% } %>
	<br><br>
</body>
<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
</footer>

</html>