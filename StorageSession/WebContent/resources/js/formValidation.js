	//RESTITUISCE TRUE SE IL PARAMETRO E FORMATO DA SOLE LETTERE
	function allLetter(uname)
	{
		var format = /^[A-Za-z]+$/;
		if(uname.value.match(format))
			return true;
		return false;
	}
	
	function allNumber(serie)
	{
		var format = /^[0-9]/;
		if(serie.value.match(format))
			return true;
		return false;
	}

	//RESTITUISCE TRUE SE IL PARAMETRO RISPETTA IL FORMATO DI UN NUMERO DI TELEFONO
	function validatePhonenumber(inputtxt){
		var formato = /^\(([0-9]{3})\)[-\.\s]([0-9]{3})[-\.\s]([0-9]{4})$/;
		if(inputtxt.value.match(formato))
			return true;	
		return false;
	}
	
	function validateDate(data)
	{
		var formato = /^(\d{1,2})\/(\d{1,2})/;
		if(data.value.match(formato))
			return true;
		return false;
	}
	
	//-------------FUNZIONI DA RICHIAMARE NEI CAMPI DEI FORM-------------
	
	function checkNome(name)
	{
		if(!(allLetter(name)))
		{	
			$("#nomeDiv").html("NUMERI NEL NOME NON PERMESSI");
			$("#nomeDiv").css({"color":"black"});
		}
		else
			$("#nomeDiv").html("");
	}

	function checkCognome(stringa)
	{
		if(!allLetter(stringa))
		{
			$("#cognomeDiv").html("ATTENZIONE: NUMERI NEL COGNOME NON PERMESSI!");
			$("#cognomeDiv").css({"color":"black"});
		}
		else
			$("#cognomeDiv").html("");
		
	}

	function checkTelefono(telefono)
	{
		if(!(validatePhonenumber(telefono)))
		{
			$("#telefonoDiv").html("LETTERE NON PERMESSE NEL CAMPO NUMERO DI TELEFONO");
			$("#telefonoDiv").css({"color":"black"});
		}
		else
			$("#telefonoDiv").html("");
	}
		
	function checkCarta(num)
	{
		if(!(allNumber(num)))
		{
			$("#cartaDiv").html("LETTERE NON PERMESSE NEL CAMPO NUMERO DI CARTA");
			$("#cartaDiv").css({"color":"black"});
		}
		else
			$("#cartaDiv").html("");
	}
	
	function checkIntestatario(stringa)
	{
		if(!(allLetter(stringa)))
		{	
			$("#intestatarioDiv").html("NUMERI NON PERMESSI NEL CAMPO INTESTATARIO");
			$("#intestatarioDiv").css({"color":"black"});
		}
		else
			$("#intestatarioDiv").html("");
	}
	
	function checkDate(date)
	{
		if(!(validateDate(date)))
		{
			$("#dateDiv").html("SI PREGA DI RISPETTARE IL FORMATO MM/AA");
			$("#dateDiv").css({"color":"black"});
		}
		else
			$("#dateDiv").html("");
	}
	
	function checkCVV(num)
	{
		if(!(allNumber(num)))
		{
			$("#cvvDiv").html("LETTERE NON PERMESSE NEL CAMPO CVV");
			$("#cvvDiv").css({"color":"black"});
		}
		else
			$("#cvvDiv").html("");
	}
