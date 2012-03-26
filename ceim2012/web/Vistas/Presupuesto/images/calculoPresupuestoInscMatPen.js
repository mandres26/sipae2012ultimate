var InscMatPen = {
    ready:function(){
        totalParvulo();
        totalPrejardin();
        totalPreescolar();
        totalPrimero();
        totalSegundo();
        totalTercero();
        totalCuarto();
        totalQuinto();
        $("#form1").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (validarNivelIns.ready())
                    status=false;
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
                    $("#result").load("Controlador/registrarCedulaIngresoInsMatPen.jsp",form.serialize()+"&fecha="+$("#fecha").val()+"&descripcion="+$("#descripcion").val());
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
var ModInscMatPen = {
    ready:function(){
        totalParvulo();
        totalPrejardin();
        totalPreescolar();
        totalPrimero();
        totalSegundo();
        totalTercero();
        totalCuarto();
        totalQuinto();
        $("#form1").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (validarNivelIns.ready())
                    status=false;
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
                    $("#result").load("Controlador/modificarCedulaIngresoInsMatPen.jsp",form.serialize()+"&fecha="+$("#fecha").val()+"&descripcion="+$("#descripcion").val()+"&id="+$("#idpresupuesto").val()+"&idpreing="+$("#idpreing").val());
                else
                    alert("Faltan datos.");
            }
        });
        $("#reset").click(function() {
            $("#result").html("");
        });
    }
};
function totalParvulo() {
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad1").val() != "") {
        if (!isNaN($("#cantidad1").val())) {
            try {
                cantidad=$("#cantidad1").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc1").val()!="") {
        if (!isNaN($("#insc1").val())) {
            try {
                inscripcion=$("#insc1").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri1").val()!="") {
        if (!isNaN($("#matri1").val())) {
            try {
                matricula=$("#matri1").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens1").val()!="") {
        if (!isNaN($("#pens1").val())) {
            try {
                pension=$("#pens1").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulPar").html(total);
    $("#t1").val(total);
    totalPre();
}

  
function totalPrejardin(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad2").val()!= "") {
        if (!isNaN($("#cantidad2").val())) {
            try {
                cantidad=$("#cantidad2").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc2").val()!="") {
        if (!isNaN($("#insc2").val())) {
            try {
                inscripcion=$("#insc2").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri2").val()!="") {
        if (!isNaN($("#matri2").val())) {
            try {
                matricula=$("#matri2").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens2").val()!="") {
        if (!isNaN($("#pens2").val())) {
            try {
                pension=$("#pens2").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulPre").html(total);
    $("#t2").val(total);
    totalPre();
}
  
function totalPreescolar(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad3").val()!= "") {
        if (!isNaN($("#cantidad3").val())) {
            try {
                cantidad=$("#cantidad3").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc3").val()!="") {
        if (!isNaN($("#insc3").val())) {
            try {
                inscripcion=$("#insc3").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri3").val()!="") {
        if (!isNaN($("#matri3").val())) {
            try {
                matricula=$("#matri3").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens3").val()!="") {
        if (!isNaN($("#pens3").val())) {
            try {
                pension=$("#pens3").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulPrees").html(total);
    $("#t3").val(total);
    totalPre();
}
function totalPrimero(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad4").val()!= "") {
        if (!isNaN($("#cantidad4").val())) {
            try {
                cantidad=$("#cantidad4").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc4").val()!="") {
        if (!isNaN($("#insc4").val())) {
            try {
                inscripcion=$("#insc4").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri4").val()!="") {
        if (!isNaN($("#matri4").val())) {
            try {
                matricula=$("#matri4").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens4").val()!="") {
        if (!isNaN($("#pens4").val())) {
            try {
                pension=$("#pens4").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulPri").html(total);
    $("#t4").val(total);
    totalPre();
}
function totalSegundo(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad5").val()!= "") {
        if (!isNaN($("#cantidad5").val())) {
            try {
                cantidad=$("#cantidad5").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc5").val()!="") {
        if (!isNaN($("#insc5").val())) {
            try {
                inscripcion=$("#insc5").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri5").val()!="") {
        if (!isNaN($("#matri5").val())) {
            try {
                matricula=$("#matri5").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens5").val()!="") {
        if (!isNaN($("#pens5").val())) {
            try {
                pension=$("#pens5").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulSeg").html(total);
    $("#t5").val(total);
    totalPre();
}
function totalTercero(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad6").val()!= "") {
        if (!isNaN($("#cantidad6").val())) {
            try {
                cantidad=$("#cantidad6").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc6").val()!="") {
        if (!isNaN($("#insc6").val())) {
            try {
                inscripcion=$("#insc6").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri6").val()!="") {
        if (!isNaN($("#matri6").val())) {
            try {
                matricula=$("#matri6").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens6").val()!="") {
        if (!isNaN($("#pens6").val())) {
            try {
                pension=$("#pens6").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulTer").html(total);
    $("#t6").val(total);
    totalPre();
}
function totalCuarto(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad7").val()!= "") {
        if (!isNaN($("#cantidad7").val())) {
            try {
                cantidad=$("#cantidad7").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc7").val()!="") {
        if (!isNaN($("#insc7").val())) {
            try {
                inscripcion=$("#insc7").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri7").val()!="") {
        if (!isNaN($("#matri7").val())) {
            try {
                matricula=$("#matri7").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens7").val()!="") {
        if (!isNaN($("#pens7").val())) {
            try {
                pension=$("#pens7").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulCua").html(total);
    $("#t7").val(total);
    totalPre();
}
function totalQuinto(){
    var cantidad;
    var inscripcion;
    var matricula;
    var pension;
                
    if ($("#cantidad8").val()!= "") {
        if (!isNaN($("#cantidad8").val())) {
            try {
                cantidad=$("#cantidad8").val();
            } catch (err) {
                cantidad = 0;
            }
        } else 
            cantidad = 0;
    } else
        cantidad = 0;
    
    if ($("#insc8").val()!="") {
        if (!isNaN($("#insc8").val())) {
            try {
                inscripcion=$("#insc8").val();
            } catch (err) {
                inscripcion = 0;
            }
        } else 
            inscripcion = 0;
    } else
        inscripcion = 0;
    
    if ($("#matri8").val()!="") {
        if (!isNaN($("#matri8").val())) {
            try {
                matricula=$("#matri8").val();
            } catch (err) {
                matricula = 0;
            }
        } else 
            matricula = 0;
    } else
        matricula = 0;
    
    if ($("#pens8").val()!="") {
        if (!isNaN($("#pens8").val())) {
            try {
                pension=$("#pens8").val();
            } catch (err) {
                pension = 0;
            }
        } else 
            pension = 0;
    } else
        pension = 0;
    
    var v1=cantidad*inscripcion;
    var v2=cantidad*matricula;
    var v3=cantidad*pension;
    var total = v1+v2+v3;
    $("#resulQui").html(total);
    $("#t8").val(total);
    totalPre();
}
function totalPre() {
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