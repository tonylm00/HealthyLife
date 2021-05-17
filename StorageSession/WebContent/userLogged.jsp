<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="java.util.Collection"
         import="java.util.Iterator"
         import="it.unisa.model.*"
   %>
<% 
// Check user credentials
  UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
if ((currentUser==null)||(!currentUser.isValid()))
{	
    %> <h1> Utente non valido </h1> <%
    return;
}

	Collection<?> orders = (Collection<?>) request.getSession().getAttribute("orders");

%>
   <!DOCTYPE html>
   <html>

      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
         <title>   User Logged Successfully   </title>
      </head>
	
      <body>
           Benvenuto: <%=currentUser.getFirstName() + " " + currentUser.getLastName() %>
   
<h4>Ordini effettuati</h4>
	<table border="1">
		<tr>
			<th>Codice </th>
			<th>Data </th>
			<th>Prezzo Totale</th>
			<th></th>
		</tr>
		<%
			if (orders != null && orders.size() != 0) {
				Iterator<?> it = orders.iterator();
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
					<tr>
						<td><%=bean.getId()%></td>
						<td><%=bean.getData()%></td>
						<td><%=bean.getPrezzoTot()%></td>
						<td><a href="order?action=detail&id=<%=bean.getId()%>">Dettagli ordine</a></td>
					</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan="6">Nessun ordine effettuato</td>
		</tr>
		<%
			}
		%>
	</table><br/>
      </body>
	
   </html>