<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/ProductStyle.css" type="text/css"/>
	<title>Vista amministratore</title>
	
	<style type="text/css">
			.scelta {
		  width: 100%;
		  background-color: #a8d43e;
		  color: white;
		  padding: 16px 25px;
		  margin: 8px 0;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  font-size: 18px;
		  text-decoration: none;
		}
		
		.scelta:hover {
		  background-color: #45a049;
		  text-decoration: none;
		}
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
	<h2>Lista Prodotti </h2>
	<table>
		<tr>
			<th><a href="product?sort=id">Codice </a></th>
			<th><a href="product?sort=nome">Nome </a></th>
			<th><a href="product?sort=descrizione">Descrizione </a></th>
			<th><a href="product?sort=informazioni">Informazioni </a></th>
			<th><a href="product?sort=prezzo">Prezzo non Scontato </a></th>
			<th><a href="product?sort=quantità">Quantità </a></th>
			<th><a href="product?sort=sconto">Sconto </a></th>
			<th><a href="product?sort=prezzo_scontato">Prezzo Scontato </a></th>
			<th><a href="product?sort=iva">IVA </a></th>
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
						<td><a href="product?action=delete&id=<%=bean.getCode()%>" class=scelta>Rimuovi</a><br><br><br>
						<a href="product?action=modify&id=<%=bean.getCode()%>" class=scelta>Modifica</a></td>
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
	</table><br/>
	
	<a href="login?action=adminInsert" class=scelta>Inserisci un nuovo prodotto al catalogo</a>
	<a href="login?action=adminOrder" class = scelta>Visualizza ordini</a><br/><br/>
</body>
</html>