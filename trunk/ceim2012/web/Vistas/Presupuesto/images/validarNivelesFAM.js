var validarNivelFam = {
    ready:function(){
        var parvulo = validarParvulo();
        var prejardin = validarPrejardin();
        var preescolar = validarPreescolar();
        var primero = validarPrimero();
        var segundo = validarSegundo();
        var tercero = validarTercero();
        var cuarto = validarCuarto();
        var quinto = validarQuinto();
        if(parvulo && prejardin && preescolar && primero && segundo && tercero && cuarto && quinto){
            return true;
        } else {
            return false;
        }
    }
}
function validarParvulo(){
    var can = $("#cant1").val();
    var val = $("#valor1").val();
    var sub = $("#t1").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarPrejardin(){
    var can = $("#cant2").val();
    var val = $("#valor2").val();
    var sub = $("#t2").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarPreescolar(){
    var can = $("#cant3").val();
    var val = $("#valor3").val();
    var sub = $("#t3").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarPrimero(){
    var can = $("#cant4").val();
    var val = $("#valor4").val();
    var sub = $("#t4").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarSegundo(){
    var can = $("#cant5").val();
    var val = $("#valor5").val();
    var sub = $("#t5").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarTercero(){
    var can = $("#cant6").val();
    var val = $("#valor6").val();
    var sub = $("#t6").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarCuarto(){
    var can = $("#cant7").val();
    var val = $("#valor7").val();
    var sub = $("#t7").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarQuinto(){
    var can = $("#cant8").val();
    var val = $("#valor8").val();
    var sub = $("#t8").val();
    var error = false;
    if (can != "" && val != "") {
        error = false;
    } else {
        if (can != "") {
            if (val == "") {
                $("#valor8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (val != "") {
            if (can == "") {
                $("#cant8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}