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
    return; } 

 Collection<?> orders = (Collection<?>) request.getSession().getAttribute("orders"); %>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
      	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/table.css" %>
		 	
		 </style>
         <title>Area personale</title>
      </head>
      <body>
      <header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
      <%
	      	if ((currentUser==null)||(!currentUser.isValid())){	
				   	response.sendRedirect("LoginView.jsp"); 
				    return;
		  	} 
		  %>
      <div align=center>
	<br>
           <h2>Benvenuto: <%=currentUser.getName() + " " + currentUser.getSurname() %></h2>
     

			
		<%
			if (orders != null && orders.size() != 0) {
				Iterator<?> it = orders.iterator();
				%>
				<h3>Storico ordini effettuati:</h3>
			<table>
					<tr>
						<th>Codice </th>
						<th>Data </th>
						<th>Prezzo Totale</th>
					</tr>
				<% 
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
			
					<tr style="padding:3px">
						<td align=center><%=bean.getId()%></td>
						<td align=center><%=bean.getData()%></td>
						<td align=center><%=bean.getPrezzoTot()%></td>
						<td align=center class=az><a class=ac href="order?action=detail&id=<%=bean.getId()%>">Dettagli ordine</a></td>
					</tr>
		<%
				}
			}
			else {
		%>
		<tr>
			<td colspan=10 align=center> <p style="font-size:20px"><strong>Nessun ordine effettuato</strong></p></td>
		</tr>
		<%
			}
		%>
	</table><br><br><br>
	<a href=login?action=visualizzaInfo class=scelta>VISUALIZZA INFORMAZIONI PERSONALI</a><br><br><br>
	<a href=login?action=logout class=scelta>LOGOUT</a><br><br>
	</div><br><br>

      </body>
	
   </html>