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
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Healthy Life - Dettagli ordine </title>
</head>
<body>
	<h2>Dettagli</h2>
			<table border="1">
				<tr>
					<th>Codice</th>
					<th>Nome</th>
					<th>Descrizione</th>
					<th>Prezzo Unitario</th>
			
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
				</tr>
				<%}}%>
			</table>
	

</body>
</html>