var validarNivelIns = {
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
function validarParvulo() {
    var can = $("#cantidad1").val();
    var ins = $("#insc1").val();
    var mat = $("#matri1").val();
    var pen = $("#pens1").val();
    var sub = $("#t1").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri1").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarPrejardin(){
    var can = $("#cantidad2").val();
    var ins = $("#insc2").val();
    var mat = $("#matri2").val();
    var pen = $("#pens2").val();
    var sub = $("#t2").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri2").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarPreescolar(){
    var can = $("#cantidad3").val();
    var ins = $("#insc3").val();
    var mat = $("#matri3").val();
    var pen = $("#pens3").val();
    var sub = $("#t3").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri3").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarPrimero(){
    var can = $("#cantidad4").val();
    var ins = $("#insc4").val();
    var mat = $("#matri4").val();
    var pen = $("#pens4").val();
    var sub = $("#t4").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri4").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarSegundo(){
    var can = $("#cantidad5").val();
    var ins = $("#insc5").val();
    var mat = $("#matri5").val();
    var pen = $("#pens5").val();
    var sub = $("#t5").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri5").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarTercero(){
    var can = $("#cantidad6").val();
    var ins = $("#insc6").val();
    var mat = $("#matri6").val();
    var pen = $("#pens6").val();
    var sub = $("#t6").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri6").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarCuarto(){
    var can = $("#cantidad7").val();
    var ins = $("#insc7").val();
    var mat = $("#matri7").val();
    var pen = $("#pens7").val();
    var sub = $("#t7").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri7").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}
function validarQuinto(){
    var can = $("#cantidad8").val();
    var ins = $("#insc8").val();
    var mat = $("#matri8").val();
    var pen = $("#pens8").val();
    var sub = $("#t8").val();
    var error = false;
    if (can != "" && ins != "" && mat != "" && pen != "") {
        error = false;
    } else {
        if (can != "") {
            if (ins == "") {
                $("#insc8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (ins != "") {
            if (can == "") {
                $("#cantidad8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (mat != "") {
            if (can == "") {
                $("#cantidad8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (pen == "") {
                $("#pens8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        if (pen != "") {
            if (can == "") {
                $("#cantidad8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (ins == "") {
                $("#insc8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
            if (mat == "") {
                $("#matri8").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        }
        error = true
    }
    return error;
}