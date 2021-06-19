<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<%
	ProductBean product = ProductDAO.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../ProductStyle.css" rel="stylesheet">
	<title>HealthyLife - modify</title>
</head>



<body>
	<h2>Modifica prodotti</h2>
	<form action="../product" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		
		<label for="nome">Name:</label><br> 
		<input name="nome" type="text" maxlength="20" required value="<%=product.getName()%>"><br> 
		
		<label for="descrizione">Description:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required><%=product.getDescription()%></textarea><br>
		
		<label for="informazioni">Info:</label><br>
		<textarea name="informazioni" maxlength="100" rows="3" required><%=product.getInfo()%></textarea><br>
		
		<label for="prezzo">Price:</label><br> 
		<input name="prezzo" type="number" min="0" step="0.01" required value="<%=product.getPrice()%>"><br>

		<label for="quantità">Quantity:</label><br> 
		<input name="quantita" type="number" min="1" required value="<%=product.getQuantity()%>"><br>
		
		<label for="sconto">Sconto:</label><br> 
		<input name="sconto" type="number" min="0" step="0.01" required value="<%=product.getSconto()%>"><br>
		
		<label for="iva">IVA:</label><br> 
		<input name="iva" type="number" min="0" step="0.1" required value="<%=product.getIva()%>"><br>

		<input type="submit" value="Modifica"><input type="reset" value="Reset">
	</form>
</body>
</html>