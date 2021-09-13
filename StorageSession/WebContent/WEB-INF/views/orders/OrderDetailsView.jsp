<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="it.unisa.model.*,java.util.Collection,java.util.Iterator"%>

<% Collection<?> products = (Collection<?>) request.getSession().getAttribute("products"); %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/table.css" %>
		 	.footer{
		 		position:absolute;
		 	}
	</style>
	<title>HealthyLife </title>
</head>
<body>
 <header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<div align=center>
	<h2>Dettagli ordine</h2>
			<table>
				<tr>
					<th>Nome</th>
					<th>Prezzo Unitario</th>
					<th>Quantità</th>
					<th>IVA</th>
					<th>Prezzo totale articolo</th>
				</tr>
				<%
					if (products != null && products.size() != 0) {
						Iterator<?> it = products.iterator();
						while (it.hasNext()) {
							ProductBean product = (ProductBean) it.next();
				%>
				<tr>
					<td align=center><%=product.getName()%></td>
					<td align=center><%=String.format("%.2f", product.getPrice())%>€</td>
					<td align=center><%=product.getQuantity()%></td>
					<td align=center><%=product.getIva()%></td>
					<td align=center><%=String.format("%.2f", product.getPrice()*product.getQuantity())%>€</td>
				</tr>
				<%}}%>
			</table>
			
			</div>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>