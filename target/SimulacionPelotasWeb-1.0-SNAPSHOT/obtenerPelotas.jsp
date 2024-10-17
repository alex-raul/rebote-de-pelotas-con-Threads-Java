

<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.simulacionpelotasweb.Pelota,com.mycompany.simulacionpelotasweb.GestorPelotas" %>
<%
    // responsable de enviar posiciones actuales
    GestorPelotas gestorPelotas = (GestorPelotas) application.getAttribute("gestorPelotas");
    if (gestorPelotas == null) {
        gestorPelotas = new GestorPelotas();
        application.setAttribute("gestorPelotas", gestorPelotas);
    }

    gestorPelotas.actualizarSimulacion();

    List<Pelota> pelotas = gestorPelotas.obtenerPelotas();

    StringBuilder json = new StringBuilder("[");
    for (Pelota pelota : pelotas) {
        json.append("{")
            .append("\"x\":").append(pelota.getX()).append(",")
            .append("\"y\":").append(pelota.getY()).append(",")
            .append("\"radio\":").append(pelota.getRadio()).append(",")
            .append("\"color\":\"").append(String.format("#%02x%02x%02x", pelota.getColor().getRed(), pelota.getColor().getGreen(), pelota.getColor().getBlue())).append("\"")
            .append("},");
    }
    if (pelotas.size() > 0) json.deleteCharAt(json.length() - 1);  // Eliminar la última coma
    json.append("]");
    response.setContentType("application/json");
    response.getWriter().write(json.toString());
%>

