index = {
    ready: function() {
        $("#registrar").click(function(evento) {
            evento.preventDefault();
            $("#art-PostContent").load("Registrar/menuregistrar.jsp")
        });
        $("#consultar").click(function(evento) {
            evento.preventDefault();
            $("#art-PostContent").load("Consultar/menuconsultar.jsp")
        });
        $("#listar").click(function(evento) {
            evento.preventDefault();
            $("#art-PostContent").load("Listar/menulistar.jsp")
        });
        $("#index").click(function(evento) {
            evento.preventDefault();
            location.reload();
        });
        $("#presu").click(function(evento) {
            evento.preventDefault();
        });
    }
}

menuRegistrar = {
    ready: function() {
        $("#regPresupuesto").hide();
        $("#desPresupuesto").hide();
        $("#container").hide();
        $("#finReg").hide();
        $("#fecha").change(function() {
            var fecha = $(this).val();
            if (fecha!="") {
                $("#regPresupuesto").show();
                $("#container").html("");
                $("#container").show();
                $("#descripcion").html("");
                $("#desPresupuesto").show();
            } else {
                $("#regPresupuesto").hide();
                $("#desPresupuesto").hide();
                $("#container").hide();
            }
        });
        $("#preIngreso").click(function(evento) {
            evento.preventDefault();
            $("#container").load("Registrar/PresupuestoIngreso/presupuestoIngreso.jsp");
        });
        $("#preGastos").click(function(evento) {
            evento.preventDefault();
            $("#container").load("Registrar/PresupuestoGastos/presupuestoGastos.jsp");
        });
        $("#finReg").click(function(){
            var fecha = $("#fecha").val();
            var descripcion = $("#descripcion").val();
            $("#container").load("Controlador/finalizarRegistro.jsp","fecha="+fecha+"&descripcion="+descripcion);
        });
    }
}

presupuestoIngreso = {
    ready: function() {
        $("#fotoInscrip").hide();
        $("#fotoDiaFam").hide();
        $("#fotoDiaCom").hide();
        $("#regInscrip").click(function(evento) {
            evento.preventDefault();
            if($("#fecha").val()!="") {
                $("#fotoInscrip").show();
                $("#fotoDiaFam").hide();
                $("#fotoDiaCom").hide();
                $("#formContainer").load("Registrar/PresupuestoIngreso/cedulaPresupuestalInscMatPen.jsp",false);
            } else {
                alert("Seleccione año a presupuestar");
                $("#fecha").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        });
        $("#regDiaFam").click(function(evento) {
            evento.preventDefault();
            if ($("#fecha").val()!="") {
                $("#fotoInscrip").hide();
                $("#fotoDiaFam").show();
                $("#fotoDiaCom").hide();
                $("#formContainer").load("Registrar/PresupuestoIngreso/cedulaPresupuestalDiaFam.jsp",false);
            } else {
                alert("Seleccione año a presupuestar");
                $("#fecha").validationEngine('showPrompt', '* Este campo es requerido', 'error','topRight',true);
            }
        });
        $("#regDiaCom").click(function(evento) {
            evento.preventDefault();
            if ($("#fecha").val()!="") {
                $("#fotoInscrip").hide();
                $("#fotoDiaFam").hide();
                $("#fotoDiaCom").show();
                $("#formContainer").load("Registrar/PresupuestoIngreso/cedulaPresupuestalDiaCometa.jsp",false);
            } else {
                alert("Seleccione año a presupuestar");
                $("#fecha").validationEngine("showPrompt", "* Este campo es requerido", "error","topRight",true);
            }
        });
    }
}

presupuestoGastos = {
    ready: function() {
        function gastosCompleto() {
            $("#preGastos").click();
        }
    }
}

consultarPresupuesto = {
    ready: function() {
        consultarPresupuesto.seleccionar();
        $("#fecha").change(function() {
            var fecha = $(this).val();
            $("#container").load("Controlador/consultarPresupuestoFecha.jsp", "fecha="+fecha);
        });
    },
    seleccionar: function() {
        $("a").click(function(evento) {
            evento.preventDefault();
            var id = (this).id;
            if (!isNaN(id)) {
                $("#container").load("Controlador/presupuestoSeleccionado.jsp", "id="+id+"&op=consultar",false);
            } else {
                var conf = "";
                if (id == "volver") {
                    var fecha = $("#fecha").val();
                    $("#container").load("Controlador/consultarPresupuestoFecha.jsp", "fecha="+fecha,false);
                } else if (id == "eliminar") {
                    conf = confirm("Está seguro de eliminar presupuesto.");
                    if (conf) {
                        $("#container").load("Controlador/eliminarPresupuesto.jsp","id="+$("#idpresupuesto").val(),false);
                    }
                } else if (id == "seleccionar") {
                    conf = confirm("Está seguro de seleccionar presupuesto.");
                    if (conf) {
                        $("#container").load("Controlador/seleccionarPresupuesto.jsp","id="+$("#idpresupuesto").val()+"&fecha="+$("#fecha").val(),false);
                    }
                } else if (id == "modificar") {
                    conf = confirm("Está seguro de modificar presupuesto.");
                    if (conf) {
                        $("#container").load("Modificar/menumodificar.jsp","id="+$("#idpresupuesto").val(),false);
                    }
                }
            }
        });
    }
}

menuModificar = {
    ready:function() {
        $("#preIngreso").click(function(evento) {
            evento.preventDefault();
            $("#container3").load("Modificar/PresupuestoIngreso/presupuestoIngreso.jsp","id="+$("#idpresupuesto").val());
        });
        $("#preGastos").click(function(evento) {
            evento.preventDefault();
            $("#container3").load("Modificar/PresupuestoGastos/presupuestoGastos.jsp","id="+$("#idpresupuesto").val()+"&idpregastos="+$("#idpregastos").val());
        });
        
    }
}

modificarPresupuesto = {
    ready:function() {
        $("#modInscrip").click(function(evento) {
            evento.preventDefault();
            $("#formContainer").load("Modificar/PresupuestoIngreso/cedulaPresupuestalInscMatPen.jsp","id="+$("#idpresupuesto").val()+"&idpreing="+$("#idpreing").val());
        });
        $("#modDiaFam").click(function(evento) {
            evento.preventDefault();
            $("#formContainer").load("Modificar/PresupuestoIngreso/cedulaPresupuestalDiaFam.jsp","id="+$("#idpresupuesto").val()+"&idpreing="+$("#idpreing").val());
        });
        $("#modDiaCom").click(function(evento) {
            evento.preventDefault();
            $("#formContainer").load("Modificar/PresupuestoIngreso/cedulaPresupuestalDiaCometa.jsp","id="+$("#idpresupuesto").val()+"&idpreing="+$("#idpreing").val());
        });
    }
}

listarPresupuesto = {
    ready: function() {
        listarPresupuesto.seleccionar();
        $("#fecha").change(function() {
            var fecha = $(this).val();
            $("#container").load("Controlador/consultarPresupuestoFecha.jsp", "fecha="+fecha);
        });
    },
    seleccionar: function() {
        $("a").click(function(evento) {
            evento.preventDefault();
            var id = (this).id;
            if (!isNaN(id)) {
                $("#container").load("Controlador/presupuestoSeleccionado.jsp", "id="+id+"&op=listar");
            } else {
                if (id == "volver") {
                    $("#container").load("Listar/menulistar.jsp")
                }
            }
        });
    }
}