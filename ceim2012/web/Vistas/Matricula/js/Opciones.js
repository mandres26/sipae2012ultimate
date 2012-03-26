/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var num=1;
function ocultar(){
    var docente=document.getElementById("docente");
    docente.setAttribute("style", "display:none");
    var curso=document.getElementById("curso");
    curso.setAttribute("style", "display:none");
    var asignatura=document.getElementById("asignatura");
    asignatura.setAttribute("style", "display:none");
    var inscripcion=document.getElementById("inscripcion");
    inscripcion.setAttribute("style", "display:none");
    var matricula=document.getElementById("matricula");
    matricula.setAttribute("style", "display:none");
    var esc=document.getElementById("matricula");
    esc.setAttribute("style", "display:none");
    var escuela=document.getElementById("escuela");
    escuela.setAttribute("style", "display:none");
    
}
function ocultarDocente(){
    var logro=document.getElementById("logros");
    logro.setAttribute("style", "display:none"); 
    var actividades=document.getElementById("actividades");
    actividades.setAttribute("style", "display:none");
    var excusa=document.getElementById("excusa");
    excusa.setAttribute("style", "display:none");
}
function escuela(){
    ocultar();
    var escuela=document.getElementById("escuela");
    escuela.setAttribute("style", "display:block");
}

function logros(){
    ocultarDocente();
    var logro=document.getElementById("logros");
    logro.setAttribute("style", "display:block");
}
function excusa(){
    ocultarDocente();
    var excusa=document.getElementById("excusa");
    excusa.setAttribute("style", "display:block");
}

function actividad(){
  
     ocultarDocente();
     var actividades=document.getElementById("actividades");
    actividades.setAttribute("style", "display:block");
}


function escuelaPadres(){
    ocultar();
    var matricula=document.getElementById("escuelaPadres");
    matricula.setAttribute("style", "display:block");
}


function docente(){
    ocultar();
    var docente=document.getElementById("docente");
    docente.setAttribute("style", "display:block");
}
function curso(){
    ocultar();
    var curso=document.getElementById("curso");
    curso.setAttribute("style", "display:block");
}
function asignatura(){
    ocultar();
    var curso=document.getElementById("asignatura");
    curso.setAttribute("style", "display:block");
}

function cargarAsignaturaNueva(divisionAsignatura){
    //asignarNombre();
   var asignatura=document.getElementById("asignaturas");
   var asig=document.getElementById("asignaturas").innerHTML;
   var campo=document.getElementById("campos").innerHTML;
   var division=document.getElementById(divisionAsignatura);
   var divisionTotal=document.getElementById("divisionAsignaturas");
   if(asignatura.value!="-Asignaturas-"){
       division.innerHTML='<input  type = "hidden" name = "asignaturaDocente" value = "'+asignatura.value+'" /><table><tr><td>'+document.getElementById("t"+asignatura.value).value+'&nbsp;&nbsp;&nbsp;</td><td>(<a onclick="eliminar(\'asignatura'+num+'\')">X</a>)</td></table>';
      divisionTotal.innerHTML =divisionTotal.innerHTML+
      '<div id="asignatura'+parseInt(++num)+'"><div id="campos">'+campo+'</div><select name="asignatura" id="asignaturas" style="width: 145px;" onchange="cargarAsignaturaNueva(\'asignatura'+parseInt(num)+'\')">'+
          asig+'</select></div>';
     
       //sendRequest('GET','http://localhost:8080/VistaThis/res/listadoAsignatura.jsp');
       
   }
   
  
}

 function eliminar(nombre){
       var asignatura=document.getElementById(nombre);
       asignatura.innerHTML='';
   }
   
   
   
   
   //.............esto es para ajax
   
   
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
function sendRequest2(method, url){
  

if(method == 'get' || method == 'GET'){
http.open(method,url);
http.onreadystatechange = handleResponse2;
 
http.send(null);
}
}

function handleResponse2(){
if(http.readyState == 4 && http.status == 200){
var response = http.responseText;
if(response){
document.getElementById("listadoEstudiantesM").innerHTML = response;

}
}else{
    document.getElementById("listadoEstudiantesM").innerHTML = 'Cargando tabla';
}
}

function handleResponse(){
if(http.readyState == 4 && http.status == 200){
var response = http.responseText;
if(response){
document.getElementById("listadoEstudiantes").innerHTML = response;

}
}else{
    document.getElementById("listadoEstudiantes").innerHTML = 'Cargando tabla';
}
}

