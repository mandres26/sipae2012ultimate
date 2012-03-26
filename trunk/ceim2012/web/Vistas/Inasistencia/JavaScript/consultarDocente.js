$(document).ready(function() {
	$('#buscarDoc').click(function() {
            var idDoc = $('#idDocVis').val();

            if($('#idDocVis').val()==""){
                alert("Ingrese el codigo del Docente..!");
            }else if($("#buscarDoc").attr("value")=="Buscar"){
                    $.ajax({
			type: 		"post",
			url: 		"buscarDocente.jsp",
			data: 		"idDoc=" + idDoc,
			success:	function(msg) {
                                
                                
				$('#idDocOculto').val($('#idDocVis').val());
                                $("#idDocVis").val(msg);
                                $("#idDocVis").attr("disabled","disabled");
                                $("#buscarDoc").attr("value", "Limpiar");

			}
		});

	return false;
            }else if($("#buscarDoc").attr("value")=="Limpiar"){
                $("#idDocVis").val("");
                $("#idDocVis").removeAttr("disabled");
                $("#idDocVis").focus();
                $("#buscarDoc").attr("value", "Buscar");
            }



	});
});

