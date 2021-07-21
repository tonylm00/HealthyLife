<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/ProductStyle.css" type="text/css"/>
	<title>Vista amministratore</title>
	
	<style>
	<%@include file="/resources/styles/table.css" %>
	<%@include file="/resources/styles/header.css" %>
	</style>
</head>

<%
	Collection<?> products = (Collection<?>) ProductDAO.doRetrieveAll(null);
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>

<body>
	<header>
		<%@include file="/resources/fragment/header.jsp" %>
	</header>
	<h2>Lista Prodotti </h2>
	<table>
		<tr>
			<th class=az><a href="product?sort=id" class=ac>Codice </a></th>
			<th class=az><a href="product?sort=nome"class=ac>Nome </a></th>
			<th class=az><a href="product?sort=descrizione"class=ac>Descrizione </a></th>
			<th class=az><a href="product?sort=informazioni"class=ac>Informazioni </a></th>
			<th class=az><a href="product?sort=prezzo"class=ac>Prezzo non Scontato </a></th>
			<th class=az><a href="product?sort=quantità"class=ac>Quantità </a></th>
			<th class=az><a href="product?sort=sconto"class=ac>Sconto </a></th>
			<th class=az><a href="product?sort=prezzo_scontato"class=ac>Prezzo Scontato </a></th>
			<th class=az><a href="product?sort=iva"class=ac>IVA </a></th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
					<tr>
						<td><%=bean.getCode()%></td>
						<td><%=bean.getName()%></td>
						<td><%=bean.getDescription()%></td>
						<td><%=bean.getInfo()%></td>
						<td><%=bean.getPrice()%></td>
						<td><%=bean.getQuantity()%></td>
						<td><%=bean.getSconto()%></td>
						<td><%=bean.getPrezzoScontato()%></td>
						<td><%=bean.getIva()%></td>
						<td class=az><a href="product?action=delete&id=<%=bean.getCode()%>" class=ac>Rimuovi</a></td>
						<td class=az><a href="product?action=modify&id=<%=bean.getCode()%>" class=ac>Modifica</a></td>
					</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="6">Nessun prodotto disponibile</td>
		</tr>
		<%
			}
		%>
	</table>
	<br><br>
	<a href="login?action=adminInsert" class=scelta>Inserisci un nuovo prodotto al catalogo</a>
	<a href="login?action=adminOrder" class = scelta>Visualizza ordini</a><br/><br/>
</body>
</html>