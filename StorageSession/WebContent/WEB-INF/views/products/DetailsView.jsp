<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% ProductBean product = (ProductBean) request.getAttribute("product"); %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/header.css" type="text/css"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/footer.css" type="text/css"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/ProductStyle.css" type="text/css"/>
	<title>Dettagli: <%=product.getName()%> </title>
</head>

<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	
	<h2>Dettagli</h2>
	<%
		if (product != null) {
	%>
			<table>
				<tr>
					<th>Codice</th>
					<th>Nome</th>
					<th>Descrizione</th>
					<th>Informazioni</th>
					<th>Prezzo</th>
					<th>Quantità</th>		
				</tr>
				<tr>
					<td><%=product.getCode()%></td>
					<td><%=product.getName()%></td>
					<td><%=product.getDescription()%></td>
					<td><%=product.getInfo() %>
					<td><%=product.getPrice()%> €</td>
					<td><%=product.getQuantity()%></td>
					<td><a href="cart?action=addCartDetails&id=<%=product.getCode()%>">Aggiungi al carrello</a></td>
				</tr>
			</table>
	<%
		}
	%>
	<br/><a href="cart?action=Cart">Vai al carrello</a>
	<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>