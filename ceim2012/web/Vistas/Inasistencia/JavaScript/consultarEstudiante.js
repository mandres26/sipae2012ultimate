$(document).ready(function() {
	$('#idEst').change(function() {
		var idEst = $('#idEst').val();
		$.ajax({
			type: 		"post",
			url: 		"buscarEstudiante.jsp",
			data: 		"idEst=" + idEst,
			success:	function(msg) {

				$("#nombreEst").val(msg);

			}
		});

	return false;
	});
});

