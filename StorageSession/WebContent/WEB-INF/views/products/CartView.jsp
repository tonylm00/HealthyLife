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
	
	<style>
		.scelta {
			  width: 100%;
			  background-color: #a8d43e;
			  color: white;
			  padding: 16px 25px;
			  margin: 8px 0;
			  border: none;
			  border-radius: 4px;
			  cursor: pointer;
			  font-size: 18px;
			  text-decoration: none;
			}
				
				.scelta:hover {
				  background-color: #45a049;
				  text-decoration: none;
			}
	</style>
</head>

<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<% if(cart != null && cart.getSize()!=0) { %>
		
		<table class="elencoprodotti">
		<tr>
			<th>Nome</th>
			<th>Quantità</th>
			<th>Prezzo Totale</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
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
			<td><a class="cap" href="cart?action=delete&id=<%=beancart.getCode()%>"><strong>Rimuovi dal carrello</strong></a></td>
		</tr>
		<%} %>
	</table>
	<p class="totale"><%
	%>
		Prezzo totale: <%=cart.getTotPrice()%> €
		</p>
	<% } else { %>	
		<h1>Il tuo carrello è vuoto</h1>
	<% } %>
	
	<br/>
		<a href="order?action=checkout" class=scelta> Checkout</a></div><br><br><br><br>
</body>
<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
</footer>

</html>