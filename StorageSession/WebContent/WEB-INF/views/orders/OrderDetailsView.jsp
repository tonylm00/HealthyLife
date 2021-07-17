<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="it.unisa.model.*"
     import="java.util.Collection"
     import="java.util.Iterator"
%>

<% Collection<?> products = (Collection<?>) request.getSession().getAttribute("products"); %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/table.css" %>
	</style>
	<title>HealthyLife </title>
</head>
<body>
 <header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<h2>Dettagli ordine</h2>
			<table>
				<tr>
					<th>Codice</th>
					<th>Nome</th>
					<th>Descrizione</th>
					<th>Prezzo Unitario</th>
					<th>Quantità</th>
			
				</tr>
				<%
					if (products != null && products.size() != 0) {
						Iterator<?> it = products.iterator();
						while (it.hasNext()) {
							ProductBean product = (ProductBean) it.next();
				%>
				<tr>
					<td><%=product.getCode()%></td>
					<td><%=product.getName()%></td>
					<td><%=product.getDescription()%></td>
					<td><%=product.getPrice()%></td>
					<td><%=product.getQuantity()%></td>
				</tr>
				<%}}%>
			</table>
<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>