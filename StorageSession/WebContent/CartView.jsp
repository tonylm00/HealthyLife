<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/header.css" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/footer.css" type="text/css"/>
	<title>Il mio carrello</title>
</head>

<body>
	<header>
		<%@ include file="/fragment/header.jsp" %>
	</header>
	
	<% if(cart != null && cart.getSize()!=0) { %>
		<h2>Il mio carrello</h2>
		<table border="1">
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
			<td><a href="cart?action=delete&id=<%=beancart.getCode()%>">Rimuovi dal carrello</a></td>
		</tr>
		<%} %>
	</table>
	<p><%
	%>
		Prezzo totale: <%=cart.getTotPrice()%> €
		</p>
	<% } else { %>	
		<h1>Il tuo carrello è vuoto</h1>
	<% } %>
	
	<br/><a href="order?action=checkout">
		<input type="submit" name="submit" value="Checkout"></a>
</body>
<footer>
	<%@ include file="/fragment/footer.jsp" %>
</footer>

</html>