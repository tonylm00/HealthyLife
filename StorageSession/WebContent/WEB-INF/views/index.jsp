<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/navbar.css" %>
		 </style>
		 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
   		 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
   		 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   		 
	
	<title>Healthy Life</title>
	
	</head>
<body>
	<script src="./resources/js/prodotto.js"></script>
	<script src="./resources/js/slideshow.js"></script>
	
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
		<%@include file="/resources/fragment/navbar.jsp" %>
	</header>
	
	
	<div align=center>
		<%@include file="/resources/fragment/sconti.jsp"%>
	</div>
	
	
		<footer>
			<%@ include file="/resources/fragment/footer.jsp" %>
		</footer>
</body>
</html>

