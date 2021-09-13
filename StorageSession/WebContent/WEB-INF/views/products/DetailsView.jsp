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
		 <%@include file="/resources/styles/navbar.css" %>
		 <%@include file="/resources/styles/table.css" %>
		 <%@include file="/resources/styles/prodotto.css" %>
	</style>
	<title>HealthyLife </title>
</head>

<body>

	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
		<%@include file="/resources/fragment/navbar.jsp" %>
	</header>	
	
	
	<% if (product != null) { %>
		<div class=product align=center>
		<h2 align="center">Dettagli del prodotto</h2>
		<h2 id="testo" align="center"> <%=product.getName()%></h2>
			<div class=foto align="center"> <img src="<%=product.getImmagine()%>"  width=300px></div>
		<br><br>
		<table class=prod>		
				<tr>
					<th>Nome</th>
					<th>Descrizione</th> 
					<th>Informazioni</th>
					<th>Prezzo</th>
				</tr>
				<tr>
					<td align=center><br><%=product.getName()%></td>
					<td align=center><br><%=product.getDescription()%></td>
					<td align=center><br><%=product.getInfo()%></td>
					
					<td align=center>
					<%if(product.getPrezzoScontato()<product.getPrice()) {%>
					<p class=cancellato><%=product.getPrice()%> € </p> <%=String.format("%.2f", product.getPrezzoScontato())%> €
					<%}else{ %>
					<%=product.getPrice()%>€
					<%} %>
					</td>
				</tr>
		</table><br><br>
		<a class=scelta href=cart?action=addCartDetails&id=<%=product.getCode()%> > Aggiungi al carrello</a>
		</div>
		<br>
	<% } %>
	<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>