
function search(){
    var x=document.getElementById("cerca").value;
    var xhr= new XMLHttpRequest();
    xhr.onreadystatechange= function() {
        if (this.readyState==4 && this.status==200){
            searchDB(this);
        }
    };
    xhr.open("GET","/HealthyLife/cercaproduct?data="+x,true);
    xhr.send();
}

function searchDB(xhr){
    var result=JSON.parse(xhr.responseText);
    $('#cerca').autocomplete({
        source:result
    }, {
        autoFocus:false,
        delay:100,
        minLength:2
    })
}