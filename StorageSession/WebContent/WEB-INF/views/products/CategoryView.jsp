<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<!DOCTYPE html>

<%
	String cat = request.getParameter("categoria");
	Collection<?> products = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria(cat);
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>HealtyLife</title>
		<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/ProductStyle.css" %>
		</style>
	</head>
	<body>
		<header>
			<%@ include file="/resources/fragment/header.jsp" %>
		</header>
		<h1> Esplora questa categoria di prodotti: </h1>
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
				<h1>Nessun prodotto disponibile nella categoria</h1>
			<%
				}
			%>
		<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	</body>
</html>