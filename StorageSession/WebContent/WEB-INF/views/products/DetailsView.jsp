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
	<title>HealthyLife </title>
</head>

<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="products/zoomsl.min.js"></script>
	<script src="products/zoomsl.js"></script>
		<script> //non funziona
		$(document).ready(function(){
		$('#zoom').imagezoomsl();
		});
		</script>
	
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>	
	<% if (product != null) { %>
		<h2> <%=product.getName()%></h2>
		<div class=page>
		<div class=product>
			<div class=foto> <img src="<%=product.getImmagine()%>"  width=300px id="zoom"></div><br>
				
			<div class=info>
				<p><strong>Descrizione:</strong><br><%=product.getDescription()%></p> 
				<p><strong>Informazioni:</strong><br><%=product.getInfo()%></p>
		
		<% if (product.getSconto()!= 0) { 
		%>
		</div>
			<div class=quantita ><strong>Affrettati</strong>, solo <%=product.getQuantity()%> pezzi rimanenti in offerta del <strong><%=String.format("%.0f", product.getSconto())%>%</strong></div>	
			<br><a class=cancellato> Prezzo iniziale: <%=product.getPrice()%> €</a><br><br>
		</div>
		<%} else { %>
		<div>
			<div class=quantita ><strong>Affrettati</strong> <%=product.getQuantity()%> pezzi rimanenti </div><br>
		</div>
		<%} %>
		<div class=azioni>
			<br><a class=scelta href="cart?action=addCartDetails&id=<%=product.getCode()%>">Aggiungi al carrello: €<%=product.getPrezzoScontato()%></a>
		</div>
	<%
		}
	%>
	</div>
	<br><br><br><br><br><br>
	<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>