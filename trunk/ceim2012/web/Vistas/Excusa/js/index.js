var index = {
    ready: function(){
        $("#form1").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (status) {
                    $("#result").load("Controlador/iniciarsesion.jsp",form.serialize());
                } else {
                    alert("Faltan Datos.");
                }
            }
        });
        $("#mision").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#content").load("mision.jsp");
        });
        $("#home").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            location.href='index.jsp';
        });
    }
}

var menuDocente = {
    ready:function() {
        $("#cerrar").click(function(evento) {
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            var conf = confirm("Cerrar la sesión")
            if (conf)
                $("#content").load("Controlador/cerrarsesion.jsp");
        });
        $("#regExcusa").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#result").load("Registrar/Excusa.jsp","op=registrar")
        });
        $("#revExcusa").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#result").load("Registrar/Excusa.jsp","op=listarDocente")
        });
        $("#vizExcusa").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#result").load("Registrar/Excusa.jsp","op=listarEstudiantes")
        });
        $("#listDocente").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#result").load("Registrar/Excusa.jsp","op=listarDocentes")
        });
    }
}

var menuAcudiente = {
    ready:function() {
        $("#cerrar").click(function(evento) {
            evento.preventDefault();
            var conf = confirm("Cerrar la sesión")
            if (conf)
                $("#content").load("Controlador/cerrarsesion.jsp");
        });
        $("#regExcusa").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#result").load("Registrar/Excusa.jsp","op=registrar")
        });
        $("#revExcusa").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            $("#result").load("Registrar/Excusa.jsp","op=listar")
        });
    }
}

var regExcusa = {
    ready:function(){
        $("#formExcusa").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (status) {
                    $("#resultRegistro").load("Controlador/registrarExcusa.jsp", form.serialize())
                } else {
                    alert("Faltan Datos.");
                }
            }
        });
        $("a").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            var id = (this).id;
            if (!isNaN(id)) {
                $('#result').load("Controlador/estudianteSeleccionado.jsp","id="+id)
            } else {
                if(id=="volver"){
                    $('#result').load('Registrar/Excusa.jsp',"op=registrar");
                }
            }
        });
    }
}

var revExcusa = {
    ready:function(){
        $("#formExcusa").validationEngine('attach', {
            onValidationComplete: function(form, status) {
                if (status) {
                    $("#resultRegistro").load("Controlador/registrarExcusa.jsp", form.serialize())
                } else {
                    alert("Faltan Datos.");
                }
            }
        });
        $("a").click(function(evento){
            evento.preventDefault();
            $("#form1").validationEngine('hideAll');
            $("#formExcusa").validationEngine('hideAll');
            var id = (this).id;
            if (!isNaN(id)) {
                $('#result').load("Listar/ListaExcusas.jsp","id="+id);
            } else {
                if(id=="volver"){
                    $('#result').load('Registrar/Excusa.jsp',"op=listarEstudiantes");
                } else if (id=="volverDocente"){
                    $("#result").load("Registrar/Excusa.jsp","op=listarDocentes")
                }
            }
        });
    },
    aceptar:function(id){
        $('#result').load('Controlador/aceptarExcusa.jsp',"idexcusa="+id);
    },
    rechazar:function(id){
        $('#result').load('Controlador/rechazarExcusa.jsp',"idexcusa="+id);
    },
    selectDocente:function(id){
        $('#result').load('Listar/ListaExcusasDocente.jsp',"id="+id);
    }
}