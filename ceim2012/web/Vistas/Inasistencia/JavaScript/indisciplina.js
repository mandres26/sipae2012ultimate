/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
                var $tab_title_input = $( "#nombreEst"),
                        $tab_content_input = $( "#tab_content" );
                        $tab_content_input_2 = $( "#tab_content_2" );
                        $tab_content_input_3 = $( "#tab_content_3" );
		var tab_counter = 2;

		// tabs init with a custom tab template and an "add" callback filling in the content
		var $tabs = $( "#tabs").tabs({
			tabTemplate: "<li><a href='#{href}'>#{label}</a> <span class='ui-icon ui-icon-close'>Remove Tab</span></li>",
			add: function( event, ui ) {
				var tab_content = $tab_content_input.val() || "Tab " + tab_counter + " content.";
                                var tab_content_2 = $tab_content_input_2.val() || "Tab " + tab_counter + " content.";
                                var tab_content_3 = $tab_content_input_3.val() || "Tab " + tab_counter + " content.";
				$( ui.panel ).append( "<table border='0' width='50'><tbody><tr><td>Sancion:</td><td><textarea rows='3' cols='50'>"+ tab_content +"</textarea></td></tr><tr><td>Compromisos:</td><td><textarea rows='3' cols='50'>"+tab_content_2+"</textarea></td></tr><tr><td>Observaciones:</td><td><textarea rows='3' cols='50'>"+tab_content_3+"</textarea></td></tr><tr><td></td><td></td></tr></tbody></table>");

			}
		});

		// modal dialog init: custom buttons and a "close" callback reseting the form inside
		var $dialog = $( "#dialog" ).dialog({
			autoOpen: false,
			modal: true,
			buttons: {
				Agregar: function() {
					addTab();
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

		// addTab form: calls addTab function on submit and closes the dialog
		var $form = $( "form", $dialog ).submit(function() {
			addTab();
			$dialog.dialog( "close" );
                        return false;
		});

		// actual addTab function: adds new tab using the title input from the form above
		function addTab() {
			var tab_title = $tab_title_input.val() || "Tab " + tab_counter;
			$tabs.tabs( "add", "#tabs-" + tab_counter, tab_title ).show();
			tab_counter++;
                        if(tab_counter==3){
                            var index = $( "li", $tabs ).index(0);
                            $tabs.tabs( "remove", index );
                        }

                        
		}

		// addTab button: just opens the dialog
		$( "#add_tab" )
			.button()
			.click(function() {
				$dialog.dialog( "open" );
			});

		// close icon: removing the tab on click
		// note: closable tabs gonna be an option in the future - see http://dev.jqueryui.com/ticket/3924
		$( "#tabs span.ui-icon-close" ).live( "click", function() {
			var index = $( "li", $tabs ).index( $( this ).parent() );
			$tabs.tabs( "remove", index );
		});

	});

