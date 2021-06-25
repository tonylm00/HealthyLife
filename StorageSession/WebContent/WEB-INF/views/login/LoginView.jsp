<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>

<!DOCTYPE html>

<html>
	<head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	    <link rel="stylesheet" href="resources/styles/header.css" type="text/css"/>
		<link rel="stylesheet" href="resources/styles/footer.css" type="text/css"/>
		<link rel="stylesheet" href="resources/styles/credenziali.css" type="text/css"/>
		<script type="text/javascript" src="resources/js/formValidation.js"></script>
		<title>Login</title>
	</head>

	 <body>
	
	<header>
		<%@ include file="/resources/fragment/header.jsp" %>
	</header>
		<script>
		$(document).ready(function(){
            $('#submit').click(function(){   
                var user=$('#email').val();
                var pwd=$('#password').val();
                $.ajax({
                    type: "GET",
                    url:"login?un="+user+"&password="pwd+"&action=login",  
                   	beforeSend:function(){
                   		$('#emailDiv').html("ciao");
                   	},
                    success: function (data) {
                    	 $('#emailDiv').html("ciao");
                    }
                });                                
            });
        });
		</script>
		<% 
		UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
		if ((currentUser!=null)&&(!currentUser.isValid())){	
		%><br> Utente non valido, reinserisci le credenziali<br/><br/>   
		<%}%>
		<h1>LOGIN</h1>
		 <form action="login" method="post">
			<input type="hidden" name="action" value="checkout">
			
			<label for=email>Inserisci email</label><br>
			<input type="email" name="email" class="campo"  onblur="checkEmail(document.getElementById('email'))"><div id="emailDiv"></div>><br>		
		
			<label for=pw>Inserisci password</label><br>
			<input type="password" name="pw" class="campo">
			
			<input type="submit" class="act" value="Accedi">			
		
		</form> 
		<br>
		<a href="views/login/guest.jsp" class=scelta>Procedi senza registrarti</a>
		<a href="views/login/registrazioneUtente.jsp" class=scelta>Registrati qui</a>
		<footer>
		<%@ include file="/resources/fragment/footer.jsp" %>
	</footer>
	</body>
</html>