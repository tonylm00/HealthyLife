<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%
	Collection<?> orders =null;
	if(request.getAttribute("orders")!=null){
		orders= (Collection<?>) request.getAttribute("orders");
	}
	else orders = (Collection<?>) OrderDAO.doRetrieveAll(null);
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/styles/ProductStyle.css"/>
	<title>HealthyLife</title>
</head>

<body>
	<h2>Ordini</h2>
	<table>
		<tr>
			<th>Codice</th>
			<th>Data Ordine</th>
			<th>Prezzo Totale</th>
			<th>Utente</th>
		</tr>
		<%
			if (orders != null && orders.size() != 0) {
				Iterator<?> it = orders.iterator();
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
					<tr>
						<td><%=bean.getId() %></td>
						<td><%=bean.getData()%></td>
						<td><%=bean.getPrezzoTot()%></td>
						<td><%=bean.getUtente()%></td>
					</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="6">No orders available</td>
		</tr>
		<%
			}
		%>
	</table><br/>


Filtra prodotti per data:<br/>
	<form action="/order" method="post">
		<input type="hidden" name="action" value="filterDate">
		<input type="text" name="inizio" placeholder="inizio yyyy-mm-dd"><br/><br/>
		<input type="text" name="fine" placeholder="fine yyyy-mm-dd"><br/><br/>
		<input type="submit" value="Filtra"><input type="reset" value="Reset">
	</form><br/><br/>
	
Filtra prodotti per utente:<br/>
	<form action="/order" method="post">
		<input type="hidden" name="action" value="filterUser">
		<input type="text" name="user" placeholder="mariorossi@gmail.com"><br/><br/>
		<input type="submit" value="Filtra"><input type="reset" value="Reset">
	</form>
</body>
</html>