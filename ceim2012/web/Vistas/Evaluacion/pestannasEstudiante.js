/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function validacion(evt, id){
 var text=document.getElementById(id);


 var max=999999999999999;
 var valor=text.value;//esto es para que me deje dijitar mas numero si esta vacio el campo de texto
     if(valor=="")
         valor=0;
         
 if(window.event){// IE
keynum = evt.keyCode;
}else{
keynum = evt.which;
}    
valor=valor+keynum;         
if(parseInt(valor)<=max){

if(keynum>47 && keynum<58 ){
return true;
}else if(keynum==13){//este espara que sepa es va hacer una busqueda
    document.getElementById("filtro_busqueda").value="busqueda";
    return true;
}else if(keynum==127){
return true;
}else{
return false;
}
}else{
return false;
}

}

 function llamadaMatricula(){
                  var matricula = document.getElementById("listado");
                  var inscripcion=document.getElementById("inscripcion");
                   inscripcion.setAttribute("class", "pestanaInvisible");
                   matricula.setAttribute("class", "pestanaVisible");
              
               }
               
   
function createRequestObject(){
var req;
if(window.XMLHttpRequest){

req = new XMLHttpRequest();
}
else if(window.ActiveXObject){
//For IE 5+
req = new ActiveXObject("Microsoft.XMLHTTP");
}
else{
}

return req;
}

//Make the XMLHttpRequest Object
var http = createRequestObject();

function sendRequest(method, url){
   

if(method == 'get' || method == 'GET'){
http.open(method,url);
http.onreadystatechange = handleResponse;

http.send(null);
}
}

function handleResponse(){
if(http.readyState == 4 && http.status == 200){
var response = http.responseText;
if(response){
document.getElementById("listado").innerHTML = response;
}
}else{
    document.getElementById("listado").innerHTML = 'Cargando tabla';
}
}

               
function llamadaInscripcion(){
     var matricula = document.getElementById("listado");
                  var inscripcion=document.getElementById("inscripcion");
                   inscripcion.setAttribute("class", "pestanaVisible");
                   matricula.setAttribute("class", "pestanaInvisible");
    
}

function estudianteNoEncontrado(){
    var no_e = document.getElementById("nota_estudiante_no_econtrado");
    no_e.setAttribute("class", "nota_estudiante_no_econtrado");
}
function actualizarText(){
    var text=document.getElementById("modificar");
    text.value="modificar";
}