<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>

<!DOCTYPE html>
<%
	Collection<?> products = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("sconti");
	Collection<?> products2 = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("Nutrizione");
	Collection<?> products3 = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("Accessori");
	Collection<?> products4 = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("HomeGym");
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>
<html>
	<head>
		<style>
		<%@include file="/resources/styles/ProductStyle.css"%>
		</style>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script> <!-- Bootstrap -->
	</head>
	
	<p class=titoloCategoria><strong> Consegna gratuita</strong> per ordini superiori a 20€</p>
	<!-- ImageSlider 5img delay20sec -->
	<div id="slider">
		<figure>
			<img src="resources/images/provaImg.PNG">
			<img src="resources/images/bulk2.PNG">
			<img src="resources/images/provaImg.PNG">
			<img src="resources/images/bulk2.PNG">
			<img src="resources/images/provaImg.PNG">
		</figure>
	</div>
	<h1><strong>I Nostri Sconti</strong></h1>
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>			
			
			<div class=prodotto>
				
				<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a></div>
				<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
				<%if(bean.getSconto()!=0) {%>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrezzoScontato())%>
				<a class=cancellato href="product?action=read&id=<%=bean.getCode()%>">€<%=bean.getPrice()%></a></div></a></div>
				<%} %>		
			<%
					}
				}
				else {
			%>
				<h1>Nessun prodotto disponibile nella categoria</h1>
			<%
				}
			%>
			
			<h1><strong>Nutrizione</strong></h1>
			<%
				if (products2 != null && products2.size() != 0) {
					Iterator<?> it = products2.iterator();
					int cont = 4;
					while (it.hasNext() && cont!=0 ) {
						ProductBean bean = (ProductBean) it.next();
						cont--;
			%>			
			
			<div class=nutrizione>
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
					Iterator<?> it = products3.iterator();
					int cont = 3;
					while (it.hasNext() && cont!=0) {
						ProductBean bean = (ProductBean) it.next();
						cont--;
			%>			
			
			<div class=accessori>
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
					Iterator<?> it = products4.iterator();
					int cont = 5;
					while (it.hasNext() && cont>=0) {
						ProductBean bean = (ProductBean) it.next();
						cont--;
			%>			
			
			<div class=homegym>
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
</html>