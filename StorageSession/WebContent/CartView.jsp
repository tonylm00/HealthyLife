<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Il tuo carrello</title>
</head>

<body>
	<a href="ProductView.jsp">Home</a><br/>
	<% if(cart != null && cart.getSize()!=0) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Action</th>
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
			
			<td><%=beancart.getTot()%></td>
			<td><a href="cart?action=delete&id=<%=beancart.getCode()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>
	<p><%
	%>
		Prezzo totale:<%=cart.getTotPrice()%>
		</p>
	<% } else { %>	
		<h1>Il tuo carrello è vuoto</h1>
	<% } %>
	
	<br/><a href="order?action=checkout">
		<input type="submit" name="submit" value="Checkout"></a>
</body>
</html>