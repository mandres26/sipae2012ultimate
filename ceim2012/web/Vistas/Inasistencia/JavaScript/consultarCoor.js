$(document).ready(function() {
	$('#buscarCoor').toggle(function() {
		var idCoor = $('#idCoorVis').val();

		$.ajax({
			type: 		"post",
			url: 		"buscarCoordinador.jsp",
			data: 		"idCoor=" + idCoor,
			success:	function(msg) {

                                $('#idCoorOculto').val($('#idCoorVis').val());
                                $("#idCoorVis").val(msg);
                                $("#idCoorVis").attr("disabled","disabled");
                                $("#buscarCoor").attr("value", "Limpiar");
				
			}
		});

	return false;
	},


    function() {

        $("#idCoorVis").val("");
        $("#idCoorVis").removeAttr("disabled");
        $("#idCoorVis").focus();
        $("#buscarCoor").attr("value", "Buscar");

        return false;
			}


);
});