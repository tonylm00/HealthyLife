<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>

<%
	Collection<ProductBean> products  =CategoriaDAO.doRetrieveProductsbyCategoria("sconti");
	Collection<ProductBean> products2 =CategoriaDAO.doRetrieveProductsbyCategoria("Nutrizione");
	Collection<ProductBean> products3 =CategoriaDAO.doRetrieveProductsbyCategoria("Accessori");
	Collection<ProductBean> products4 =CategoriaDAO.doRetrieveProductsbyCategoria("HomeGym");
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/navbar.css" %>
		 	<%@include file="/resources/styles/prodotto.css"%>
		 
	</style>
	<title>HealthyLife </title>
</head>
<body>
 <header>
		<%@ include file="/resources/fragment/header.jsp" %>
		<%@include file="/resources/fragment/navbar.jsp" %>
</header>
	<div align=center>
	<h2>Ordine effettuato con successo!</h2>
	<h3>potrebbe piacerti anche: </h3>
	
	<h1><strong>Nutrizione</strong></h1>
			<%
				if (products2 != null && products2.size() != 0) {
					Iterator<?> it2 = products2.iterator();
					int cont2 = 4;
					while (it2.hasNext() && cont2!=0 ) {
						ProductBean bean = (ProductBean) it2.next();
						cont2--;
			%>			
			<div class=prodotto>
				<%if(bean.getSconto()==0) {%>
				<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a></div>
				<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrice())%></a></div>	
				<%} %></div>
				<%
					}
				}
				else {
			%>
				<h1>Nessun prodotto disponibile nella categoria</h1>
			<%
				}
			%>
			
			<h1><strong>Accessori</strong></h1>
			<%
				if (products3 != null && products3.size() != 0) {
					Iterator<?> it3 = products3.iterator();
					int cont3 = 4;
					while (it3.hasNext() && cont3!=0) {
						ProductBean bean = (ProductBean) it3.next();
						cont3--;
			%>			
			
			<div class=prodotto>
				<%if(bean.getSconto()==0) {%>
				<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a></div>
				<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrice())%></a></div>	
				<%} %></div>
				<%
					}
				}
				else {
			%>
				<h1>Nessun prodotto disponibile nella categoria</h1>
			<%
				}
			%>
			
			<h1><strong>HomeGym</strong></h1>
			<%
				if (products4 != null && products4.size() != 0) {
					Iterator<?> it4 = products4.iterator();
					int cont4 = 5;
					while (it4.hasNext() && cont4>=0) {
						ProductBean bean = (ProductBean) it4.next();
						cont4--;
			%>			
			
			<div class=prodotto>
				<%if(bean.getSconto()==0) {%>
				<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a></div>
				<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrice())%></a></div>	
				<%} %></div>
				<%
					}
				}
				else {
			%>
				<h1>Nessun prodotto disponibile nella categoria</h1>
			<%
				}
			%>
	
	</div>
	
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>