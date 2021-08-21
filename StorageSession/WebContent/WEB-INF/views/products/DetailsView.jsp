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
		 <%@include file="/resources/styles/navbar.css" %>
	</style>
	<title>HealthyLife </title>
</head>

<body>
	<!-- Lente zoom da sistemare 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="products/zoomsl.min.js"></script>
	<script src="products/zoomsl.js"></script>
		<script> //non funziona
		$(document).ready(function(){
		$('#zoom').imagezoomsl();
		});
		</script> -->
		
	
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>	
	<%@include file="/resources/fragment/navbar.jsp" %>
	
	<% if (product != null) { %>
		
		<div class=page>
		<div class=product align="center">
		<h2 align="center">Dettagli del prodotto</h2>
		<h2 id="testo" align="center"> <%=product.getName()%></h2>
			<div class=foto align="center"> <img src="<%=product.getImmagine()%>"  width=300px></div>
		<br><br>
		<table align="center">		
		<div class=info>
				<tr>
					<th><p><strong>Nome</strong></p></th>
					<th><p><strong>Descrizione</strong></p></th> 
					<th><p><strong>Informazioni</strong></p></th>
					<th><p><strong>Prezzo</strong></p></th>
					<th><p><strong>Quantità</strong></p></th>
				</tr>
				<tr>
					<th><br><%=product.getName()%></th>
					<th><br><%=product.getDescription()%></th>
					<th><br><%=product.getInfo()%></th>
					<th><br><%=product.getPrice()%></th>
					<th><br><%=product.getQuantity()%></th>
				</tr>
			</div>
		</table>
		<br><br><br>
		<div class=azioni>
			<br><a class=scelta href="cart?action=addCartDetails&id=<%=product.getCode()%>">Aggiungi al carrello: €<%=product.getPrezzoScontato()%></a>
		</div> </div>
		
	<%
		}
	%>
	</div>
	<br><br><br><br><br><br>
	<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>

<!--  <div class=info>
				<p><strong>Descrizione:</strong><br><%=product.getDescription()%></p> 
				<p><strong>Informazioni:</strong><br><%=product.getInfo()%></p>
		
		<% if (product.getSconto()!= 0) { 
		%>
		</div>
		
			<div class=quantita ><strong>Affrettati</strong>, solo <%=product.getQuantity()%> pezzi rimanenti in offerta del <strong><%=String.format("%.0f", product.getSconto())%>%</strong></div>	
			<br><a class=cancellato> Prezzo iniziale: <%=product.getPrice()%> €</a><br><br>
		
		<%} else { %>
		<div>
			<div class=quantita ><strong>Affrettati</strong> <%=product.getQuantity()%> pezzi rimanenti </div><br>
		</div>
		<%} %>
		<div class=azioni>
			<br><a class=scelta href="cart?action=addCartDetails&id=<%=product.getCode()%>">Aggiungi al carrello: €<%=product.getPrezzoScontato()%></a>
		</div> </div>-->
</html>