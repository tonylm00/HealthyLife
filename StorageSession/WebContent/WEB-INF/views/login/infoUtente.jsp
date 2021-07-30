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
	<table>
	<tr><td>Nome: <%=user.getName()%></td></tr>
	<tr><td>Cognome: <%=user.getSurname()%></td></tr>
	<tr><td>Email: <%=user.getEmail()%></td></tr>
	<tr><td>Indirizzo di spedizione: <%=user.getIndirizzo()%></td></tr>
	<tr><td>Numero di carta: <%=user.getNumeroCarta()%></tr>
	<tr><td>Scadenza: <%=user.getDataScadenza()%></tr>
	<tr><td>CVV: <%=user.getCVV()%></tr>
	</table>
	<br><br>
	<a class=scelta href=home?action=goModificaInfo>Modifica Informazioni di spedizione o pagamento</a>
	</div>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
      </body>
	
   </html>