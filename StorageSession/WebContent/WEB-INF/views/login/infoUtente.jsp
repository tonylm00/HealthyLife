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
  UserBean user = (UserBean) (session.getAttribute("currentSessionUser"));
if ((user==null)||(!user.isValid()))
{	
    %>  <h3>NON SEI LOGGATO</h3> <%
    return;
}
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
	<div align=center>
	<br><h1>INFORMAZIONI UTENTE</h1><br><br>
	
	<table class=small>
	<tr><th align=left>Nome:</th><td> <%=user.getName()%></td></tr>
	<tr><th align=left>Cognome:</th><td> <%=user.getSurname()%></td></tr>
	<tr><th align=left>Email: </th><td><%=user.getEmail()%></td></tr>
	<tr><th align=left>Indirizzo di spedizione: </th><td><%=user.getIndirizzo()%></td></tr>
	<tr><th align=left>Numero di carta: </th><td><%=user.getNumeroCarta()%></td></tr>
	<tr><th align=left>Scadenza:</th><td> <%=user.getDataScadenza()%></td></tr>
	<tr><th align=left>CVV: </th><td><%=user.getCVV()%></td></tr>
	</table>
	<br><br>
	<a class=scelta href=home?action=goModificaInfo>Modifica Informazioni di spedizione o pagamento</a><br><br><br>
	</div>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
      </body>
	
   </html>