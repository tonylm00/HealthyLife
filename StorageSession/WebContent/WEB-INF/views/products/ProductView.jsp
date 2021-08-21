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
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/ProductStyle.css" %>
	</style>
	<title>Healthy Life</title>
</head>

<body>

	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>

		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>	
			
		<div class=prodotto>
			<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a></div>
			<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
		</div>

		<%
				}
			}
			else {
		%>
			<h1>Nessun prodotto disponibile</h1>

		<% } %>

		<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
		</footer>
</body>
</html>