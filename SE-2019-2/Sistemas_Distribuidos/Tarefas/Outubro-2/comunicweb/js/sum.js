
function ajaxFunction(){
    var ajaxRequest;    
    try{
        ajaxRequest =  new XMLHttpRequest();
    } catch(e){

        try{
            ajaxRequest =  new ActiveXObject("Msxl2.XMLHTTP");
        } catch(e){
            try{
                ajaxRequest = new ActiveXObject("Miscrosft.XMLHTTP");
            } catch(e){
                alert ("Seu navegador parou de funcionar!");
                return false;
            }
        }

    }

    ajaxRequest.onreadystatechange = function(){
        if(ajaxRequest.readyState === 4){
            var ajaxDisplay = document.getElementById('res');
            ajaxDisplay.placeholder = ajaxRequest.responseText.resultado;
            
        }
    }

    var ajaxDisplay = document.getElementById('sumValues');
    var x = document.getElementById('x').value;
    var y = document.getElementById('y').value;
    var querString = "?x="+x+"&y="+y;
    ajaxRequest.open('GET', '/soma'+querString);
    ajaxRequest.send(null);

}