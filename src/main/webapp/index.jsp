
<%@ page import="java.util.List" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.simulacionpelotasweb.Pelota,com.mycompany.simulacionpelotasweb.GestorPelotas" %>

<%
    // Crear un nuevo gestor de pelotas cada vez que se carga la página
    GestorPelotas gestorPelotas = new GestorPelotas();
    application.setAttribute("gestorPelotas", gestorPelotas);

    // Agregar 1000 pelotas iniciales
    gestorPelotas.agregarPelotasIniciales(200, 800, 600);

    // Obtener la lista de pelotas
    List<Pelota> pelotas = gestorPelotas.obtenerPelotas();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simulación de Rebote Amortiguado pelotas</title>
    <style>
        canvas {
            border: 1px solid black;
        }
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: linear-gradient(to bottom, #e6f7ff, #ffffff);
            margin: 0;
            padding: 20px;
        }

        h1 {
            font-size: 2em;
            color: #333;
            text-shadow: 1px 1px 2px #999;
        }

        #canvas {
            border: 2px solid #333;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            background: radial-gradient(circle at 50% 50%, #ffffff, #d9f7ff);
        }

        .controls {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .controls button {
            padding: 10px 15px;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .controls button:hover {
            background-color: #555;
        }

        .info {
            margin-top: 15px;
            font-size: 1em;
            color: #333;
        }
    </style>
    <script>
        window.onload = function() {
            var canvas = document.getElementById("canvas");
            var ctx = canvas.getContext("2d");

            // Función para dibujar las pelotas en el canvas
            function dibujarPelotas(pelotas) {
                var canvas = document.getElementById("canvas");
                var ctx = canvas.getContext("2d");

                ctx.clearRect(0, 0, canvas.width, canvas.height);  // Limpiar el canvas antes de dibujar

                pelotas.forEach(function(pelota) {
                    console.log("Dibujando pelota en: X=" + pelota.x + ", Y=" + pelota.y + ", Radio=" + pelota.radio);
                    ctx.beginPath();
                    ctx.arc(pelota.x, pelota.y, pelota.radio, 0, 2 * Math.PI);
                    ctx.fillStyle = pelota.color;  // Asegúrate de que el color sea válido
                    ctx.fill();
                    ctx.stroke();
                });
            }

            // Función para obtener las pelotas del servidor y actualizarlas en el canvas
            function actualizarSimulacion() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "obtenerPelotas.jsp", true);
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        var pelotas = JSON.parse(xhr.responseText);  // Obtener las pelotas desde el servidor
                        dibujarPelotas(pelotas);  // Dibujarlas en el canvas
                    }
                };
                xhr.send();
            }

            //clic 
            canvas.addEventListener("click", function(event) {
                var rect = canvas.getBoundingClientRect();
                var x = event.clientX - rect.left;
                var y = event.clientY - rect.top;

                // para agregar una nueva pe
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "agregarPelota.jsp?x=" + x + "&y=" + y, true);
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        actualizarSimulacion(); 
                    }
                };
                xhr.send();  
            });

            
            setInterval(actualizarSimulacion, 20);
        };
    </script>
    
</head>
<body>
<h1>Simulación de Rebote Amortiguado</h1>
<canvas id="canvas" width="800" height="600"></canvas>
</body>
</html>
