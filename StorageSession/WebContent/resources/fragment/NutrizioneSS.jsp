<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>

<!DOCTYPE html>
<%
	Collection<?> products2 = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria("Nutrizione");
	if(products2 == null) {
		response.sendRedirect("product");
		return;
	}
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>
<html>
	<head>
		<style>
		<%@include file="/resources/styles/nutrizione.css"%>
		</style>
	</head>
	
	<h1><strong>Nutrizione</strong></h1>
	<%
				if (products2 != null && products2.size() != 0) {
					Iterator<?> it = products2.iterator();
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
	
</html>