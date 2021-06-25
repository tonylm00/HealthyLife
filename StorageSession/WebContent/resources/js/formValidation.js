function allLetter(uname){
	var letters = /^[A-Za-z]+$/;
	if(uname.value.match(letters)){
		return true;
	}
	else{
		return false;
	}
}

function validateEmail(uemail){
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(uemail.value.match(mailformat)){
		return true;
	}
	else{
		return false;
	}
}

function validatePhonenumber(inputtxt){
	var phoneno = /^\(([0-9]{3})\)[-\.\s]([0-9]{3})[-\.\s]([0-9]{4})$/;
	if(inputtxt.value.match(phoneno)){
		return true;
	}
	else{
		return false;
	}
}

function checkNome(uname){
	if(allLetter(uname)==false){
		$("#nomeDiv").html("Inserisci solo lettere");
		$("#nomeDiv").css({"color":"red"});
	}
	else{
		$("#nomeDiv").html("");
	}
}

function checkCognome(uname){
	if(allLetter(uname)==false){
		$("#cognomeDiv").html("Inserisci solo lettere");
		$("#cognomeDiv").css({"color":"red"});
	}
	else{
		$("#cognomeDiv").html("");
	}
}

function checkEmail(email){
	if(validateEmail(email)==false){
		$("#emailDiv").html("Inserisci una email valida");
		$("#emailDiv").css({"color":"red"});
	}
	else{
		$("#emailDiv").html("");
	}
}

function checkTelefono(email){
	if(validateEmail(email)==false){
		$("#telefonoDiv").html("Inserisci un numero valido");
		$("#telefonoDiv").css({"color":"red"});
	}
	else{
		$("#telefonoDiv").html("");
	}
}