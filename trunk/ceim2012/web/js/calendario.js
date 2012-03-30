/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var idContenedor = "miCalendario"
var hoy = new Date()
var mes = hoy.getMonth()
var dia = 1
var anio = hoy.getFullYear()
var diasSemana = new Array ('L','M','M','J','V','S','D')
var meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
var tunIex=navigator.appName=="Microsoft Internet Explorer"?true:false;
if(tunIex && navigator.userAgent.indexOf('Opera')>=0){tunIex = false}
tunOp = navigator.userAgent.indexOf('Opera')>=0 ? true: false;
function tunCalendario(){
	dia2 = dia
	tab = document.createElement('table')
	tab.id = 'calendario'
	document.getElementById(idContenedor).appendChild(tab)
	tcabeza = document.createElement('thead')
	tab.appendChild(tcabeza)
	fi2 = document.createElement('tr')
	fi2b = document.createElement('th')
	fi2b.colSpan = 7
	fi2.id = 'mesCalendario'
	fi2b.appendChild(document.createTextNode(meses[mes] + "  -  " + anio))
	fi2.appendChild(fi2b)
	tcabeza.appendChild(fi2)
	fi = document.createElement('tr')
	tcabeza.appendChild(fi)
	for(m=0;m<7;m++){
		ce = document.createElement('th')
		ce.appendChild(document.createTextNode(diasSemana[m]))
		fi.appendChild(ce)
		if(m == 6){ce.style.marginRight = 0}
		}
		var escribe = false
		var escribe2 = true
	fecha = new Date(anio,mes,dia)
	var d = fecha.getDay()-1 //dia semana
	if(d<0){d = 6}
	tcuerpo = document.createElement('tbody')
	tab.appendChild(tcuerpo)
	while(escribe2){
		fi = document.createElement('tr')
		co = 0
		for(t=0;t<7;t++){
			ce = document.createElement('td')
			if(escribe && escribe2){
			fecha2 = new Date(anio,mes,dia)
			
				if(fecha2.getMonth() != mes){escribe2 = false;}
				else{ce.appendChild(document.createTextNode(dia));dia++;co++}
			}
			if(d == t && !escribe){
			ce.appendChild(document.createTextNode(dia))
			dia++;co++
			escribe = true
			}
			fi.appendChild(ce)
			if(hoy.getDate()+1 == dia && mes == hoy.getMonth() && anio == hoy.getFullYear()){ce.className = "Hoy"}
			}
			
		if(co>0){tcuerpo.appendChild(fi)}
		
		}
	dia = dia2
}
function borra(){
document.getElementById(idContenedor).removeChild(document.getElementById('calendario'))
}
function establecerFecha(){
tunFe = new Date()
document.getElementById('tunMes').options[tunFe.getMonth()].selected = true
document.getElementById('tunAnio').value = tunFe.getFullYear()
}


