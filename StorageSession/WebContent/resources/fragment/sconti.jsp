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
	<head>
		<style>
		<%@include file="/resources/styles/ProductStyle.css"%>
		</style>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script> <!-- Bootstrap -->
	</head>
	
	<p class=titoloCategoria><strong> Consegna gratuita</strong> per ordini superiori a 50€</p>
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
	
	
	<div class=categoria>
	</div>
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>
			
			<script>
				
			</script>
			
			<div class=prodotto>
				
				<div class=foto><a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a></div>
				<div class=nome><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>"><%=bean.getName()%></a></div>
				<%if(bean.getSconto()!=0) {%>
				<div class=prezzo><a class=collegamento href="product?action=read&id=<%=bean.getCode()%>">€<%=String.format("%.2f", bean.getPrezzoScontato())%>
				<a class=cancellato href="product?action=read&id=<%=bean.getCode()%>">€<%=bean.getPrice()%></a></div></a></div>
				<%} %>
			
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext() && product.category() == "nutrizione") {
						ProductBean bean = (ProductBean) it.next();
			%>	
			<div class="nutrizione">
				
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