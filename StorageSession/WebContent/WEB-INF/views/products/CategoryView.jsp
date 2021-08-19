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
		 	<%@include file="/resources/styles/header.css"%>
		 	<%@include file="/resources/styles/footer.css"%>
		 	<%@include file="/resources/styles/ProductStyle.css"%>
		 	<%@include file="/resources/styles/navbar.css" %>
		</style>
		
	</head>
	<body>
		<header>
			<%@ include file="/resources/fragment/header.jsp" %>
		</header>
		<%@ include file="/resources/fragment/navbar.jsp" %>
		<div align=center>
		<h1> Esplora tutti i prodotti della categoria </h1>
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>
			<div class=prodotto>
				<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG></a></div>
				<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
				
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrezzoScontato())%></a></div>
				<%if(bean.getSconto()!=0) {%>
				<div class=prezzo><a class=cancellato href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrice())%></a></div><%} %>
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
		</div><br><br><br>
		<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	<br><br><br><br><br><br>
	</body>
</html>