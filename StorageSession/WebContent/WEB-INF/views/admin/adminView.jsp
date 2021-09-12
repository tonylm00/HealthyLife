<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Vista amministratore</title>
	<style>
	<%@include file="/resources/styles/header.css" %>
	<%@include file="/resources/styles/table.css" %>
	
	tr td{
		padding: 10px 0px;
	}
	
	 ::-webkit-scrollbar {
    display: none;
	}
	
	</style>
</head>

<%
	Collection<?> products = (Collection<?>) ProductDAO.doRetrieveAll();
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
	<div align=center>
	<h2>Lista Prodotti </h2>
	<table>
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Prezzo non Scontato</th>
			<th>Quantità</th>
			<th>Sconto</th>
			<th>Prezzo Scontato</th>
			<th>IVA</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
					<tr border=1>
						<td align=center><%=bean.getCode()%></td>
						<td align=center><%=bean.getName()%></td>
						<td align=center><%=bean.getPrice()%></td>
						<td align=center><%=bean.getQuantity()%></td>
						<td align=center><%=bean.getSconto()%></td>
						<td align=center><%=bean.getPrezzoScontato()%></td>
						<td align=center><%=bean.getIva()%></td>
						<td align=center class=az><a href="product?action=delete&id=<%=bean.getCode()%>" class=ac>Rimuovi</a></td>
						<td align=center class=az><a href="product?action=modify&id=<%=bean.getCode()%>" class=ac>Modifica</a></td>
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
	</div>
</body>
</html>