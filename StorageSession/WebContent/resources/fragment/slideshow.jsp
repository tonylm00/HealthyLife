<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>

<!DOCTYPE html>
<%
	Collection<?> products = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("Nutrizione");
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>
<html>
	<style>
		 	<%@include file="/resources/styles/slideshow.css"%>
		</style>
	
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>
		<h3>Nutrizione</h3>
		<!-- Slideshow -->
		<div class="slideshow-container">
			<div class="mySlide fade">
				<a href="product?action=read&id=<%=bean.getCode()%>"><img class=immagine src="<%=bean.getImmagine()%>" alt=IMG ></a>
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
			<!-- Next and previous buttons -->
  			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  			<a class="next" onclick="plusSlides(1)">&#10095;</a>	
		</div>
		<br>
		
		<!-- The dots/circles -->
		<div style="text-align:center">
  			<span class="dot" onclick="currentSlide(1)"></span>
  			<span class="dot" onclick="currentSlide(2)"></span>
  			<span class="dot" onclick="currentSlide(3)"></span>
		</div>	
</html>