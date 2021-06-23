<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/header.css" type="text/css"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/footer.css" type="text/css"/>
	
	<style>
		.Tfoto{
			height:300px;
			width:250px;
		}
		.heading-title{
			text-align :center;
		}
	</style>
	
	<title>About us</title>
</head>

<body>
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
	<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	
	<div class="container">
		<div class="container-dir">
			<div class="heading-title">
				<h3 class="text -uppercase">Le nostre competenze</h3>
				<p class="text">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel est ut ex mattis fringilla.<br>
				 Nullam eu tellus et nisi imperdiet molestie.<br>
				 Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. <br>
				 In at sapien quis ligula scelerisque fermentum quis non odio. Vivamus id purus nunc. Vestibulum eu.
			</div>
			<table style="width:100%">
			<tr>
				<th><img src="images/antonioFoto.jpg" class="Tfoto">
				<th><img src="images/francescoFoto.jpg" class="Tfoto">
				<th><img src="images/giorgioFoto.PNG" class="Tfoto">
			<tr>
				<th><Strong>Founder</Strong>
				<th><Strong>CEO</Strong>
				<th><Strong>Cleaning Services</Strong>
			</table>
		</div>
	</div>
	
</body>
</html>