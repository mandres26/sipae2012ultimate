<%@page import="java.io.*,java.util.*,MPHorarios.*,Conceptos.Horarios.*,ReporteHorario.ReporteHorario,java.text.*,java.sql.Time"%>
<%
            String mensaje = "";

            SimpleDateFormat formatoHora = new SimpleDateFormat("hh:mm");

            int operacion = Integer.parseInt(request.getParameter("op"));

            switch (operacion) {
                case 0:
                    try {
                        Time horaInicio = new Time(formatoHora.parse(request.getParameter("horaInicialText")).getTime());
                        Time horaFinal = new Time(formatoHora.parse(request.getParameter("horaFinalText")).getTime());

                        Horario horario = ControlHorario.getAulaDisponible(request.getParameter("comboAulas"), request.getParameter("comboDia"), horaInicio, horaFinal);

                        if (horario == null) {
                            horario = ControlHorario.getDocenteDisponible(Integer.parseInt(request.getParameter("comboDocentes")), request.getParameter("comboDia"), horaInicio, horaFinal);

                            if (horario == null) {
                                horario = new Horario();
                                horario.setVar_asignatura_horario(new Asignatura(request.getParameter("comboAsignaturas")));
                                horario.setVar_aula_horario(new Aula(request.getParameter("comboAulas")));
                                horario.setVar_curso_horario(new Curso(Integer.parseInt(request.getParameter("comboCursos"))));
                                horario.setVar_dia_horario(request.getParameter("comboDia"));
                                horario.setVar_docente_horario(new Docente(Integer.parseInt(request.getParameter("comboDocentes"))));
                                horario.setVar_hora_fin_horario(horaFinal);
                                horario.setVar_hora_inicial_horario(horaInicio);

                                ControlHorario.registrarHorario(horario);

                                mensaje = "El horario ha sido registrado con exito";
                            } else {
                                mensaje = "El Docente seleccionado se encuentra ocupado en las horas seleccionadas";
                            }
                        } else {
                            mensaje = "El Aula seleccionada se encuentra ocupada en las horas seleccionadas";
                        }

                        response.sendRedirect("GestionarHorarios.jsp?mensaje=".concat(mensaje));
                    } catch (Exception e) {
                        e.printStackTrace();

                        mensaje = "ERROR AL GUARDAR EL HORARIO";
                    }

                    break;
                case 1:
                    try {
                        Time horaInicio = new Time(formatoHora.parse(request.getParameter("horaInicialText")).getTime());
                        Time horaFinal = new Time(formatoHora.parse(request.getParameter("horaFinalText")).getTime());

                        Horario horario = ControlHorario.getAulaDisponibleModificar(request.getParameter("comboAulas"), request.getParameter("comboDia"), horaInicio, horaFinal, Integer.parseInt(request.getParameter("idHorario")));

                        if (horario == null) {
                            horario = ControlHorario.getDocenteDisponibleModificar(Integer.parseInt(request.getParameter("comboDocentes")), request.getParameter("comboDia"), horaInicio, horaFinal, Integer.parseInt(request.getParameter("idHorario")));

                            if (horario == null) {
                                horario = new Horario();
                                horario.setVar_asignatura_horario(new Asignatura(request.getParameter("comboAsignaturas")));
                                horario.setVar_aula_horario(new Aula(request.getParameter("comboAulas")));
                                horario.setVar_curso_horario(new Curso(Integer.parseInt(request.getParameter("comboCursos"))));
                                horario.setVar_dia_horario(request.getParameter("comboDia"));
                                horario.setVar_docente_horario(new Docente(Integer.parseInt(request.getParameter("comboDocentes"))));
                                horario.setVar_hora_fin_horario(horaFinal);
                                horario.setVar_hora_inicial_horario(horaInicio);

                                ControlHorario.actualizarHorario(horario, Integer.parseInt(request.getParameter("idHorario")));

                                mensaje = "El horario ha sido actualizado con exito";
                            } else {
                                mensaje = "El Docente seleccionado se encuentra ocupado en las horas seleccionadas";
                            }
                        } else {
                            mensaje = "El Aula seleccionada se encuentra ocupada en las horas seleccionadas";
                        }

                        response.sendRedirect("ActualizarHorario.jsp?idHorario=".concat(request.getParameter("idHorario")).concat("&mensaje=").concat(mensaje));
                    } catch (Exception e) {
                        e.printStackTrace();

                        mensaje = "ERROR AL MODIFICAR EL HORARIO";
                    }

                    break;
                case 2:
                    try {
                        ControlHorario.eliminarHorario(Integer.parseInt(request.getParameter("idHorario")));

                        mensaje = "El horario ha sido eliminado con exito";

                        response.sendRedirect("BuscarHorario.jsp?mensaje=".concat(mensaje));
                    } catch (Exception e) {
                        e.printStackTrace();

                        mensaje = "ERROR AL ELIMINAR EL HORARIO";
                    }

                    break;
                case 3:
                    try {
                        Map<String, List<Horario>> mapaHorarios = null;

                        List<Horario> listaHorarios = ControlHorario.buscarHorario(Integer.parseInt(request.getParameter("combocurso")), request.getParameter("comboaula"), Integer.parseInt(request.getParameter("combodocente")));

                        if (listaHorarios != null && !listaHorarios.isEmpty()) {
                            mapaHorarios = new HashMap<String, List<Horario>>();
                            int tamMax = 0;

                            for (Horario horario : listaHorarios) {
                                if (horario.getVar_dia_horario().equals("LUNES")) {
                                    if (!mapaHorarios.containsKey("LUNES")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("LUNES", listaHorario);
                                    } else {
                                        mapaHorarios.get("LUNES").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("LUNES").size()) {
                                        tamMax = mapaHorarios.get("LUNES").size();
                                    }
                                } else if (horario.getVar_dia_horario().equals("MARTES")) {
                                    if (!mapaHorarios.containsKey("MARTES")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("MARTES", listaHorario);
                                    } else {
                                        mapaHorarios.get("MARTES").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("MARTES").size()) {
                                        tamMax = mapaHorarios.get("MARTES").size();
                                    }
                                } else if (horario.getVar_dia_horario().equals("MIERCOLES")) {
                                    if (!mapaHorarios.containsKey("MIERCOLES")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("MIERCOLES", listaHorario);
                                    } else {
                                        mapaHorarios.get("MIERCOLES").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("MIERCOLES").size()) {
                                        tamMax = mapaHorarios.get("MIERCOLES").size();
                                    }
                                } else if (horario.getVar_dia_horario().equals("JUEVES")) {
                                    if (!mapaHorarios.containsKey("JUEVES")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("JUEVES", listaHorario);
                                    } else {
                                        mapaHorarios.get("JUEVES").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("JUEVES").size()) {
                                        tamMax = mapaHorarios.get("JUEVES").size();
                                    }
                                } else if (horario.getVar_dia_horario().equals("VIERNES")) {
                                    if (!mapaHorarios.containsKey("VIERNES")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("VIERNES", listaHorario);
                                    } else {
                                        mapaHorarios.get("VIERNES").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("VIERNES").size()) {
                                        tamMax = mapaHorarios.get("VIERNES").size();
                                    }
                                } else if (horario.getVar_dia_horario().equals("SABADO")) {
                                    if (!mapaHorarios.containsKey("SABADO")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("SABADO", listaHorario);
                                    } else {
                                        mapaHorarios.get("SABADO").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("SABADO").size()) {
                                        tamMax = mapaHorarios.get("SABADO").size();
                                    }
                                } else if (horario.getVar_dia_horario().equals("DOMINGO")) {
                                    if (!mapaHorarios.containsKey("DOMINGO")) {
                                        List<Horario> listaHorario = new LinkedList<Horario>();
                                        listaHorario.add(horario);

                                        mapaHorarios.put("DOMINGO", listaHorario);
                                    } else {
                                        mapaHorarios.get("DOMINGO").add(horario);
                                    }

                                    if (tamMax < mapaHorarios.get("DOMINGO").size()) {
                                        tamMax = mapaHorarios.get("DOMINGO").size();
                                    }
                                }
                            }

                            response.setContentType("application/pdf");
                            response.setHeader("Content-Disposition", "attachment;filename=horario.pdf");

                            ReporteHorario rh = new ReporteHorario();

                            //DataOutput dataOutput = new DataOutputStream(response.getOutputStream());

                            byte[] bytes = rh.runReportHorarios(mapaHorarios, tamMax);

                            response.setContentLength(bytes.length);

                            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(response.getOutputStream(), bytes.length);

                            bufferedOutputStream.write(bytes, 0, bytes.length);
                            bufferedOutputStream.flush();

                            bufferedOutputStream.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    break;
            }
%>