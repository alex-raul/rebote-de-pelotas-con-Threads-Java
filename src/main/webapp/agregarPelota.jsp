<%-- 
    Document   : agregarPelota.jsp
    Created on : 16 oct. 2024, 11:31:35 p. m.
    Author     : AlexC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.simulacionpelotasweb.Pelota,com.mycompany.simulacionpelotasweb.GestorPelotas" %>
<%

    GestorPelotas gestorPelotas = (GestorPelotas) application.getAttribute("gestorPelotas");
    if (gestorPelotas == null) {
        gestorPelotas = new GestorPelotas();
        application.setAttribute("gestorPelotas", gestorPelotas);
    }
    float xClic = Float.parseFloat(request.getParameter("x"));
    float yClic = Float.parseFloat(request.getParameter("y"));
    
    // Agregar una nueva pelota en
    gestorPelotas.agregarPelota(xClic, yClic, 800, 600);

    response.setStatus(200);
%>
