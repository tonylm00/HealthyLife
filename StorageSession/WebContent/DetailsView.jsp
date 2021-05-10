<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% ProductBean product = (ProductBean) request.getAttribute("product"); %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Healthy Life - Dettagli: <%=product.getName()%> </title>
</head>

<body>
	<h2>Dettagli</h2>
	<%
		if (product != null) {
	%>
			<table border="1">
				<tr>
					<th>Codice</th>
					<th>Nome</th>
					<th>Descrizione</th>
					<th>Prezzo</th>
					<th>Quantità Disponibile</th>
					
				</tr>
				<tr>
					<td><%=product.getCode()%></td>
					<td><%=product.getName()%></td>
					<td><%=product.getDescription()%></td>
					<td><%=product.getPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td> <a href="CartControl?action=addC&id=<%=product.getCode()%>">Aggiungi al carrello</a> </td>
				</tr>
			</table>
	<%
		}
	%>
	
</body>
</html>