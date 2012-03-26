$(function() {
                
		// modal dialog init: custom buttons and a "close" callback reseting the form inside
		var $dialog = $( "#consultarDocente" ).dialog({
			autoOpen: false,
			modal: true,
			buttons: {
				Agregar: function() {
					ok();
					$( this ).dialog( "close" );
				},
				Cancelar: function() {
					$( this ).dialog( "close" );
				}
			},
			open: function() {
				$tab_title_input.focus();
			},
			close: function() {
				$form[ 0 ].reset();
			}
		});

		
		
		function ok() {
                        $("#idDocVis").val($("#nombreDocente").val());
                        $("#idDocVis").attr("disabled","disabled");
                        $("#buscarDoc").attr("value", "Limpiar");
		}

		$( "#buscarPorNombre" )
			.button()
			.click(function() {
                                $("#nombreDocente").val("");
				$dialog.dialog( "open" );
			});

		
	});

