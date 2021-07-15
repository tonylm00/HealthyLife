<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 </style>
		 <title>Healthy Life</title>
	</head>
<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
		
			<%@include file="products/ProductView.jsp" %>
			
	<header>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</header>
</body>
</html>
