/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function validarHorario(){
    form = document.getElementById("form");

    var mensajeError = document.getElementById("error");
    var mensajeOk = document.getElementById("mensaje");

    mensajeError.innerHTML = "";

    if(mensajeOk != null){
        mensajeOk.innerHTML = "";
    }

    var comboCursos = document.getElementById("comboCursos");
    var comboAsignaturas = document.getElementById("comboAsignaturas");
    var comboAulas = document.getElementById("comboAulas");
    var comboDocentes = document.getElementById("comboDocentes");
    var comboDia = document.getElementById("comboDia");
    var horaInicialText = document.getElementById("horaInicialText");
    var horaFinalText = document.getElementById("horaFinalText");

    if (comboCursos.value == 0) {
        mensajeError.innerHTML = "Debe seleccionar un Curso";

        return;
    }
    if (comboAsignaturas.value == 0) {
        mensajeError.innerHTML = "Debe seleccionar una Asignatura";

        return;
    }
    if (comboAulas.value == 0) {
        mensajeError.innerHTML = "Debe seleccionar una Aula";

        return;
    }
    if (comboDocentes.value == 0) {
        mensajeError.innerHTML = "Debe seleccionar un Docente";

        return;
    }
    if (comboDia.value == 0) {
        mensajeError.innerHTML = "Debe seleccionar un Día";

        return;
    }
    if (trim(horaInicialText.value.toString()) == "") {
        mensajeError.innerHTML = "Debe escoger la hora de inicio";

        return;
    }
    if (trim(horaFinalText.value.toString()) == "") {
        mensajeError.innerHTML = "Debe escoger la hora de finalización";

        return;
    }

    var arrayTimeIni = horaInicialText.value.split(":");
    var arrayTimeFin = horaFinalText.value.split(":");

    if(parseInt(arrayTimeFin[0], 10) < parseInt(arrayTimeIni[0], 10)){
        mensajeError.innerHTML = "La hora inicial debe ser menor que la hora final";

        return;
    }else if(parseInt(arrayTimeFin[0], 10) == parseInt(arrayTimeIni[0], 10)){
        if(parseInt(arrayTimeFin[1], 10) <= parseInt(arrayTimeIni[1], 10)){
            mensajeError.innerHTML = "La hora inicial debe ser menor que la hora final";

            return;
        }
    }

    form.submit();
}

function imprimirHorario(url){
    form = document.getElementById("form");

    form.action = url;

    form.submit();
}

function trim (myString){
    return myString.replace(/^\s+/g,'').replace(/\s+$/g,'')
}


