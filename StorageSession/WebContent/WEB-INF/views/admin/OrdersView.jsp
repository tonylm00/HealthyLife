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
	<style>
	<%@include file="/resources/styles/header.css" %>
	<%@include file="/resources/styles/table.css" %>
		<%@include file="/resources/styles/credenziali.css" %>
</style>
	<title>ADMIN</title>
</head>

<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	
	<h2>Ordini</h2>
	<table align=center>
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
						<td><%if(bean.getUtente()!=null){%>
							<%= bean.getUtente()%>
						<%} else{%>
						GUEST
						<%} %>
						</td>
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


<h2>Filtra prodotti per data:</h2>
	<form action="order" method="post">
		<input type="hidden" name="action" value="filterDate">
		<input type="text" name="inizio" placeholder="DATA INIZIO (YYYY-MM-DD)" class=campo><br/><br/>
		<input type="text" name="fine" placeholder="DATA FINE (YYYY-MM-DD)" class=campo><br/><br/>
		<input type="submit" value="Filtra" class=scelta>
	</form><br/>
	
<h2>Filtra prodotti per utente:</h2>
	<form action="order" method="post">
		<input type="hidden" name="action" value="filterUser" class=campo>
		<input type="text" name="user" placeholder="mariorossi@gmail.com" class=campo><br/><br/>
		<input type="submit" value="Filtra" class=scelta>
	</form>
</body>
</html>