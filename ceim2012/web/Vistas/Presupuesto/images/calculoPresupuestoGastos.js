var gastos = {
    ready:function(){
        totalArriendo();
        totalServicioEnergia();
        totalServicioAgua();
        totalServicioGas();
        totalServicioTel();
        totalDidactico();
        totalPapeleria();
        totalNomina();
        totalSuministros();
        totalMantenimiento();
        totalOtros();
        $("#form1").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if ($("#fecha").val()=="") {
                    status=false;
                    $("#fecha").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
                }
                if ($("#ttotal").val() == 0)
                    status=false;
                if (status) 
                    $("#result").load("Controlador/registrarCedulaGastos.jsp",form.serialize()+"&fecha="+$("#fecha").val()+"&descripcion="+$("#descripcion").val()+"&id="+$("#idpresupuesto").val()+"&idpregastos="+$("#idpregastos").val());
                else 
                    alert("Faltan datos.");
            }
        });
        $("#reset").click(function() {
            $("#result").html("");
            $("#resulTotal").html("0");
            $("#t1").val("0");
            $("#t2").val("0");
            $("#t3").val("0");
            $("#t4").val("0");
            $("#t5").val("0");
            $("#t6").val("0");
            $("#t7").val("0");
            $("#t8").val("0");
            $("#t9").val("0");
            $("#t10").val("0");
            $("#t11").val("0");
            $("#ttotal").val("0");
        });
    }
};
var Modgastos = {
    ready:function(){
        totalArriendo();
        totalServicioEnergia();
        totalServicioAgua();
        totalServicioGas();
        totalServicioTel();
        totalDidactico();
        totalPapeleria();
        totalNomina();
        totalSuministros();
        totalMantenimiento();
        totalOtros();
        $("#form1").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if ($("#fecha").val()=="") {
                    status=false;
                    $("#fecha").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
                }
                if ($("#descripcion").val()=="") {
                    status=false;
                    $("#descripcion").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
                }
                if ($("#ttotal").val()=="") {
                    status=false;
                    alert("Debe Registrar minimo un curso.");
                } else if ($("#ttotal").val()==0) {
                    status=false;
                    alert("Debe Registrar minimo un curso.");
                }
                if (status) 
                    $("#result").load("Controlador/modificarCedulaGastos.jsp",form.serialize()+"&fecha="+$("#fecha").val()+"&descripcion="+$("#descripcion").val()+"&id="+$("#idpresupuesto").val()+"&idpregastos="+$("#idpregastos").val());
                else 
                    alert("Faltan datos.");
            }
        });
        $("#reset").click(function() {
            $("#result").html("");
        });
    }
};
function totalArriendo() {
    var valor;
    
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
    $("#t1").val(valor);
    total();
}
function totalServicioEnergia() {
    var valor;
    
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
    $("#t2").val(valor);
    total();
}
function totalServicioAgua() {
    var valor;
    
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
    $("#t3").val(valor);
    total();
}
function totalServicioGas() {
    var valor;
    
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
    $("#t4").val(valor);
    total();
}
function totalServicioTel() {
    var valor;
    
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
    $("#t5").val(valor);
    total();
}
function totalDidactico() {
    var valor;
    
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
    $("#t6").val(valor);
    total();
}
function totalPapeleria() {
    var valor;

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
    $("#t7").val(valor);
    total();
}
function totalNomina() {
    var valor;

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
    $("#t8").val(valor);
    total();
}
function totalSuministros() {
    var valor;

    if ($("#valor9").val()!="") {
        if (!isNaN($("#valor9").val())) {
            try {
                valor=$("#valor9").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    $("#t9").val(valor);
    total();
}
function totalMantenimiento() {
    var valor;

    if ($("#valor10").val()!="") {
        if (!isNaN($("#valor10").val())) {
            try {
                valor=$("#valor10").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    $("#t10").val(valor);
    total();
}
function totalOtros() {
    var valor;

    if ($("#valor11").val()!="") {
        if (!isNaN($("#valor11").val())) {
            try {
                valor=$("#valor11").val();
            } catch (err) {
                valor = 0;
            }
        } else 
            valor = 0;
    } else
        valor = 0;
    $("#t11").val(valor);
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
    var v9=$("#t9").val();
    var v10=$("#t10").val();
    var v11=$("#t11").val();
    
    var total=parseInt(v1)+parseInt(v2)+parseInt(v3)+parseInt(v4)+parseInt(v5)+parseInt(v6)+parseInt(v7)+parseInt(v8)+parseInt(v9)+parseInt(v10)+parseInt(v11);
    $("#ttotal").val(total);
    $("#resulTotal").html(total);
}