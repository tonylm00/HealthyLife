<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/table.css" %>
		 	<%@include file="/resources/styles/navbar.css" %>
		 	.footer{
		 		position:absolute;
		 	}
	</style>
	<title>HealthyLife </title>
</head>
<body>
 <header>
		<%@ include file="/resources/fragment/header.jsp" %>
		<%@include file="/resources/fragment/navbar.jsp" %>
</header>
	<div align=center>
	<h2>Ordine effettuato con successo!</h2>
	<h3>potrebbe piacerti anche: </h3>
	
	<%@include file="/resources/fragment/sconti.jsp"%>
	
	</div>
	
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
</body>
</html>