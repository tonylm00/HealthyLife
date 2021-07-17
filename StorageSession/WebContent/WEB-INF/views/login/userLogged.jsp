<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="java.util.Collection"
         import="java.util.Iterator"
         import="it.unisa.model.*"
   %>
  <!DOCTYPE html>
   <html>
<% 
// Check user credentials
  UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
if ((currentUser==null)||(!currentUser.isValid()))
{	
    %>  <h3>Utente non valido</h3> <%
    return;
}

	Collection<?> orders = (Collection<?>) request.getSession().getAttribute("orders");

%>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
      	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/table.css" %>
		 </style>
         <title>Area personale</title>
      </head>
	
      <body>
      <header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<br>
           <h2>Benvenuto: <%=currentUser.getName() + " " + currentUser.getSurname() %></h2>
           
<h3>Storico ordini effettuati:</h3>
	<table>
		
		<%
			if (orders != null && orders.size() != 0) {
				Iterator<?> it = orders.iterator();
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
					<tr>
						<th>Codice </th>
						<th>Data </th>
						<th>Prezzo Totale</th>
						<th></th>
					</tr>
					<tr>
						<td><%=bean.getId()%></td>
						<td><%=bean.getData()%></td>
						<td><%=bean.getPrezzoTot()%></td>
						<td class=az><a class=ac href="order?action=detail&id=<%=bean.getId()%>">Dettagli ordine</a></td>
					</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan=6> Nessun ordine effettuato</td>
		</tr>
		<%
			}
		%>
	</table><br>
	<a href=login?action=visualizzaInfo class=scelta>VISUALIZZA INFORMAZIONI PERSONALI</a>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
      </body>
	
   </html>