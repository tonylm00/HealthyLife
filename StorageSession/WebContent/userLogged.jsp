<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="it.unisa.model.UserBean"
   %>
<% 
// Verifico credenziali utente
  UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
if ((currentUser==null)||(!currentUser.isValid()))
{	
    response.sendRedirect("./invalidLogin.jsp");
    return;
}

%>
   <!DOCTYPE html>

   <html>

      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
         <title>  Utente Loggato Correttamente   </title>
      </head>
      <body>
            <h1> Benvenuto <%= currentUser.getFirstName() + " " + currentUser.getLastName() %></h1>
      </body>
	
   </html>