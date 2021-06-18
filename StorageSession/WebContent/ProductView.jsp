<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	Cart cart = (Cart) request.getAttribute("cart");
	
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/header.css" type="text/css"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/footer.css" type="text/css"/>
	
	<title>Healthy Life</title>
</head>

<body>
	<header>
		<%@ include file="/fragment/header.jsp" %>
	</header>
	
	<h2>Prodotti</h2>
	<table border="1" class=elencoprodotti>
		<tr>
			<th><a href="product?sort=id">Codice</a></th>
			<th><a href="product?sort=nome">Nome </a></th>
			<th><a href="product?sort=descrizione">Descrizione </a></th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
					<tr>
						<td><%=bean.getCode()%></td>
						<td><%=bean.getName()%></td>
						<td><%=bean.getDescription()%></td>
						<td>
							<a href="product?action=delete&id=<%=bean.getCode()%>">Elimina</a><br>
							<a href="product?action=read&id=<%=bean.getCode()%>">Dettagli</a><br>
							<a href="cart?action=add&id=<%=bean.getCode()%>">Aggiungi al carrello</a>
						</td>
					</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="5">Nessun prodotto disponibile</td>
		</tr>
		<% } %>
	</table>
	<br>
	<a href="cart?action=Cart" class=scelta> Vai al carrello</a>
	<br><br>
	<footer>
		<%@ include file="/fragment/footer.jsp" %>
	</footer>
</body>
</html>