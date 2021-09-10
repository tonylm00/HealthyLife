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
	
	<h2 align=center>Elenco ordini:</h2>
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
						<td align=center><%=bean.getId() %></td>
						<td align=center><%=bean.getData()%></td>
						<td align=center><%=bean.getPrezzoTot()%></td>
						<td align=center><%if(bean.getUtente()!=null){%>
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
	</table><br><br>
<div align=center>
	<form action="order" method="post">
	<fieldset><legend>Filtra prodotti per data:</legend>
		<input type="hidden" name="action" value="filterDate">
		<input type="text" name="inizio" placeholder="DATA INIZIO (YYYY-MM-DD)" class=campo><br/><br/>
		<input type="text" name="fine" placeholder="DATA FINE (YYYY-MM-DD)" class=campo><br/><br/>
		<input type="submit" value="Filtra" class=scelta>
	</fieldset></form><br/>
	
	
	<form action="order" method="post">
	<fieldset><legend>Filtra prodotti per utente:</legend>
		<input type="hidden" name="action" value="filterUser" class=campo>
		<input type="text" name="user" placeholder="mariorossi@gmail.com" class=campo><br/><br/>
		<input type="submit" value="Filtra" class=scelta>
	</fieldset>
	</form>
	</div>
</body>
</html>