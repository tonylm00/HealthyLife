<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>

<!DOCTYPE html>
<%
	Collection<?> products = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("sconti");
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>
<html>
	<style>
		 	<%@include file="/resources/styles/ProductStyle.css"%>
		</style>
	<div class=categoria>
		<!--  <img class=fotoCategoria src="https://www.offerteshopping.it/wp-content/uploads/2016/12/SCONTI.jpg">-->
		<img align=center src=https://media.tenor.com/images/66ff3e276af1c2ed2d1fcfcf1872c5b3/tenor.gif width=350px>
		<p class=titoloCategoria><strong> Offerte da non perdere, sconti fino al 50% !</strong></p>
	</div>
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
				<div class=prezzo><a class=cancellato href="product?action=read&id=<%=bean.getCode()%>">€<%=bean.getPrice()%></a></div>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">Approfittane, sconto del <strong><%=String.format("%.0f", bean.getSconto())%>%</strong></a></div>
				<%} %>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrezzoScontato())%></a></div>
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
			
</html>