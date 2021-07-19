<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% ProductBean product = (ProductBean) request.getAttribute("product"); %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
		 <%@include file="/resources/styles/header.css" %>
		 <%@include file="/resources/styles/footer.css" %>
		 <%@include file="/resources/styles/prodotto.css" %>
	</style>
	<title>Dettagli: <%=product.getName()%> </title>
</head>

<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	
	<h2> <%=product.getName()%></h2>
	<%
		if (product != null) {
	%>
		<div class=product>
			<div class=foto> <img src="<%=product.getImmagine()%>" width=300px></div><br>
			<div class=info>
				<p><strong>Descrizione:</strong><br><%=product.getDescription()%></p> 
				<p><strong>Informazioni:</strong><br><%=product.getInfo()%></p>
		
		<% if (product.getSconto()!= 0) { 
		%>
		</div>
			<div class=quantita><strong>Affrettati</strong>, solo <%=product.getQuantity()%> pezzi rimanenti in offerta del <strong><%=String.format("%.0f", product.getSconto())%>%</strong></div>	
			<p class=cancellato> <%=product.getPrice()%> €</p>
		</div>
		<%} else { %>
		<div>
			<div class=quantita><strong>Affrettati</strong> <%=product.getQuantity()%> pezzi rimanenti </div><br><br><br>	
		</div>
		<%} %>
		<div class=azioni>
			<a class=scelta href="cart?action=addCartDetails&id=<%=product.getCode()%>">Aggiungi al carrello: €<%=product.getPrezzoScontato()%></a>
		</div>
	<%
		}
	%>
	
	<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>