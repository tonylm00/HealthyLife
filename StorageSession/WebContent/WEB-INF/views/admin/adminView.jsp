<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../ProductStyle.css">
	<title>HealthyLife</title>
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
	<h2>Products </h2>
	<table>
		<tr>
			<th><a href="../product?sort=id">Codice </a></th>
			<th><a href="../product?sort=nome">Nome </a></th>
			<th><a href="../product?sort=descrizione">Descrizione </a></th>
			<th><a href="../product?sort=informazioni">Informazioni </a></th>
			<th><a href="../product?sort=prezzo">Prezzo non Scontato </a></th>
			<th><a href="../product?sort=quantità">Quantità </a></th>
			<th><a href="../product?sort=sconto">Sconto </a></th>
			<th><a href="../product?sort=prezzo_scontato">Prezzo Scontato </a></th>
			<th><a href="../product?sort=iva">IVA </a></th>
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
						<td><a href="../product?action=delete&id=<%=bean.getCode()%>">Rimuovi</a><br>
							<a href="modify.jsp?id=<%=bean.getCode()%>">Modifica</a>
						</td>
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
	
	<a href="insert.jsp">Inserisci un nuovo prodotto al catalogo</a>
	<a href="OrdersView.jsp">Visualizza ordini</a><br/><br/>
</body>
</html>