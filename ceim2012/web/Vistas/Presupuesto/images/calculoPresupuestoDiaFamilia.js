var diaFamilia = {
    ready:function(){
        totalParvulo();
        totalPrejardin();
        totalPreescolar();
        totalPrimero();
        totalSegundo();
        totalTercero();
        totalCuarto();
        totalQuinto();
        $("#form2").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (validarNivelFam.ready()) 
                    status=false;
                if ($("#fecha").val()=="") {
                    status=false;
                    $("#fecha").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
                }
                if ($("#ttotal").val() == "") {
                    status=false;
                    alert("Debe Registrar minimo un curso.");
                } else {
                    if (status)
                        $("#result").load("Controlador/registrarCedulaIngresoDiaFamilia.jsp",form.serialize()+"&fecha="+$("#fecha").val()+"&descripcion="+$("#descripcion").val());
                    else 
                        alert("Faltan datos.");
                }
            }
        });
        $("#reset").click(function() {
            $("#result").html("");
            $("#resulPre").html("0");
            $("#resulPar").html("0");
            $("#resulPrees").html("0");
            $("#resulPri").html("0");
            $("#resulSeg").html("0");
            $("#resulTer").html("0");
            $("#resulCua").html("0");
            $("#resulQui").html("0");
            $("#resulTotal").html("0");
            $("#t1").val("0");
            $("#t2").val("0");
            $("#t3").val("0");
            $("#t4").val("0");
            $("#t5").val("0");
            $("#t6").val("0");
            $("#t7").val("0");
            $("#t8").val("0");
            $("#ttotal").val("0");
        });
    }
};

var ModdiaFamilia = {
    ready:function(){
        totalParvulo();
        totalPrejardin();
        totalPreescolar();
        totalPrimero();
        totalSegundo();
        totalTercero();
        totalCuarto();
        totalQuinto();
        $("#form2").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (validarNivelFam.ready()) 
                    status=false;
                if ($("#fecha").val()=="") {
                    status=false;
                    $("#fecha").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
                }
                
                if ($("#ttotal").val()=="") {
                    status=false;
                    alert("Debe Registrar minimo un curso.");
                } else if ($("#ttotal").val()==0) {
                    status=false;
                    alert("Debe Registrar minimo un curso.");
                }
                if (status)
                    $("#result").load("Controlador/modificarCedulaIngresoDiaFamilia.jsp",form.serialize()+"&fecha="+$("#fecha").val()+"&descripcion="+$("#descripcion").val()+"&id="+$("#idpresupuesto").val()+"&idpreing="+$("#idpreing").val());
                else 
                    alert("Faltan datos.");
            }
        });
        $("#reset").click(function() {
            $("#result").html("");
            $("#resulPre").html("0");
            $("#resulPar").html("0");
            $("#resulPrees").html("0");
            $("#resulPri").html("0");
            $("#resulSeg").html("0");
            $("#resulTer").html("0");
            $("#resulCua").html("0");
            $("#resulQui").html("0");
            $("#resulTotal").html("0");
            $("#t1").val("0");
            $("#t2").val("0");
            $("#t3").val("0");
            $("#t4").val("0");
            $("#t5").val("0");
            $("#t6").val("0");
            $("#t7").val("0");
            $("#t8").val("0");
            $("#ttotal").val("0");
        });
    }
};

function totalParvulo() {
    var cantidad;
    var valor;
    if ($("#cant1").val()!= "") {
        if (!isNaN($("#cant1").val())) {
            try {
                cantidad=$("#cant1").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor1").val()!="") {
        if (!isNaN($("#valor1").val())) {
            try {
                valor=$("#valor1").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulPar").html(v1);
    $("#t1").val(v1);
    total();
}

function totalPrejardin() {
    var cantidad;
    var valor;
    if ($("#cant2").val()!= "") {
        if (!isNaN($("#cant2").val())) {
            try {
                cantidad=$("#cant2").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor2").val()!="") {
        if (!isNaN($("#valor2").val())) {
            try {
                valor=$("#valor2").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulPre").html(v1);
    $("#t2").val(v1);
    total();
}

function totalPreescolar() {
    var cantidad;
    var valor;
    if ($("#cant3").val()!= "") {
        if (!isNaN($("#cant3").val())) {
            try {
                cantidad=$("#cant3").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor3").val()!="") {
        if (!isNaN($("#valor3").val())) {
            try {
                valor=$("#valor3").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulPrees").html(v1);
    $("#t3").val(v1);
    total();
}

function totalPrimero() {
    var cantidad;
    var valor;
    if ($("#cant4").val()!= "") {
        if (!isNaN($("#cant4").val())) {
            try {
                cantidad=$("#cant4").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor4").val()!="") {
        if (!isNaN($("#valor4").val())) {
            try {
                valor=$("#valor4").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulPri").html(v1);
    $("#t4").val(v1);
    total();
}

function totalSegundo() {
    var cantidad;
    var valor;
    if ($("#cant5").val()!= "") {
        if (!isNaN($("#cant5").val())) {
            try {
                cantidad=$("#cant5").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor5").val()!="") {
        if (!isNaN($("#valor5").val())) {
            try {
                valor=$("#valor5").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulSeg").html(v1);
    $("#t5").val(v1);
    total();
}

function totalTercero() {
    var cantidad;
    var valor;
    if ($("#cant6").val()!= "") {
        if (!isNaN($("#cant6").val())) {
            try {
                cantidad=$("#cant6").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor6").val()!="") {
        if (!isNaN($("#valor6").val())) {
            try {
                valor=$("#valor6").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulTer").html(v1);
    $("#t6").val(v1);
    total();
}

function totalCuarto() {
    var cantidad;
    var valor;
    if ($("#cant7").val()!= "") {
        if (!isNaN($("#cant7").val())) {
            try {
                cantidad=$("#cant7").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor7").val()!="") {
        if (!isNaN($("#valor7").val())) {
            try {
                valor=$("#valor7").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulCua").html(v1);
    $("#t7").val(v1);
    total();
}

function totalQuinto() {
    var cantidad;
    var valor;
    if ($("#cant8").val()!= "") {
        if (!isNaN($("#cant8").val())) {
            try {
                cantidad=$("#cant8").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    if ($("#valor8").val()!="") {
        if (!isNaN($("#valor8").val())) {
            try {
                valor=$("#valor8").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    var v1=cantidad*valor;
    $("#resulQui").html(v1);
    $("#t8").val(v1);
    total();
}

function total() {
    var v1=$("#t1").val();
    var v2=$("#t2").val();
    var v3=$("#t3").val();
    var v4=$("#t4").val();
    var v5=$("#t5").val();
    var v6=$("#t6").val();
    var v7=$("#t7").val();
    var v8=$("#t8").val();
    var total=parseInt(v1)+parseInt(v2)+parseInt(v3)+parseInt(v4)+parseInt(v5)+parseInt(v6)+parseInt(v7)+parseInt(v8);
    $("#ttotal").val(total);
    $("#resulTotal").html(total);
}