<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <style>
		 	<%@include file="/resources/styles/header.css" %>
		 	<%@include file="/resources/styles/footer.css" %>
		 	<%@include file="/resources/styles/navbar.css" %>
		 	<%@include file="/resources/styles/index.css" %>
		 </style>
		 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
   		 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
   		 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	
	<title>Healthy Life</title>
	
	</head>
<body>
	<script src="./resources/js/prodotto.js"></script>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
		
	</header>
		<%@include file="/resources/fragment/navbar.jsp" %>
	
	<form action=product>
		
		<p class=intestazione>Cerca un prodotto:</p>
		<div class=searchbar>
		<input type=text id=cerca name=cerca onkeyup="search()">
		<input type="hidden" name="action" value="readName">
		<button>></button>
		</div>
	</form>
		
	<center>
		<%@include file="/resources/fragment/sconti.jsp"%>
	</center>
		
		
			
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	<br><br><br><br>
</body>
</html>

