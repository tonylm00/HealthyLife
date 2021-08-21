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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<style>
		 	<%@include file="/resources/styles/ProductStyle.css"%>
		</style>
	<div class=categoria>
		<!--  <img class=fotoCategoria src="https://www.offerteshopping.it/wp-content/uploads/2016/12/SCONTI.jpg">-->
		
		<p class=titoloCategoria><strong> Consegna gratuita</strong> per ordini superiori a 50€</p>
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
					}
				}
				else {
			%>
				<h1>Nessun prodotto disponibile nella categoria</h1>
			<%
				}
			%>
			
</html>