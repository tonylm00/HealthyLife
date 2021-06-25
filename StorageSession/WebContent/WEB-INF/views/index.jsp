<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Healthy Life</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/styles/home.css">
<link rel="stylesheet" href="resources/styles/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-animate-left w3-center" style="display:none" id="mySidebar">
  <h1 ><img class="w3-center" src="resources/images/logo.png" width=250px height=120px></h1>
  <button class="itemHamburger button" onclick="w3_close()">Close <i class="fa fa-remove"></i></button>
  <a href="login?action=goLogin" class="itemHamburger button">Accedi</a>
  <a href="<%= request.getContextPath() %>/WEB-INF/views/team/AboutUs.jsp" class="itemHamburger">Chi siamo</a>
  <a href="#" class="itemHamburger button">Nutrizione</a>
  <a href="#" class="itemHamburger button">Home gym</a>
  <a href="#" class="itemHamburger button">Abbigliamento maschile</a>
  <a href="#" class="itemHamburger button">Abbigliamento femminile</a>

</nav>
<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
  <i onclick="w3_open()" class="fa fa-bars w3-xlarge button w3-theme"></i> 
  <div class="w3-center">
  <h4>L'unica cosa che ti appartiene davvero, è il tuo corpo. Prenditene cura</h4>
  <img class=w3-center src="resources/images/logo.png" width=250px height=120px>
  <br>
  </div>
</header>

<div class="w3-third">
  <div style="min-height:460px">
  <a href="#"><img src="resources/images/catFood.jpg" class="w3-image" ></a>
  </div>
</div>

<div class="w3-third">
  <div style="min-height:460px">
  <a href="#"><img src="resources/images/catHomegym.jpg"  class="w3-image" ></a>
  </div>
</div>

<div class="w3-third">
  <div style="min-height:460px">
  <a href="#"><img src="resources/images/catAbbigliamento.jpg" class="w3-image" ></a>
  </div>
</div>

<div class=prod>
	<h4>Scopri i nostri prodotti</h4>
	<jsp:include page="/WEB-INF/views/products/ProductView.jsp"/>
</div>
<footer>
	<%@ include file="/resources/fragment/footer.jsp" %>
</footer>

<script>

function w3_open() {
  var x = document.getElementById("mySidebar");
  x.style.width = "100%";
  x.style.fontSize = "40px";
  x.style.paddingTop = "10%";
  x.style.display = "block";
}
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}

</script>
</body>
</html>

