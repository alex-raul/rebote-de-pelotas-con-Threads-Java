# Simulación de Rebote Amortiguado con Java y Canvas

## Descripción del Proyecto

Este proyecto es una simulación de pelotas que caen y rebotan usando **Java** en el backend y **JavaScript** junto con **HTML5 Canvas** en el frontend. El objetivo principal es representar visualmente pelotas que caen bajo el efecto de la gravedad y rebotan cuando tocan el suelo o se colisionan entre ellas. La simulación utiliza **hilos (threads)** para manejar el movimiento independiente de cada pelota en el backend.

## Características

- **Simulación de 1000 pelotas al iniciar**: Al cargar la página, 1000 pelotas de diferentes tamaños y colores comienzan a caer y rebotar en el canvas.
- **Agregar pelotas dinámicamente**: Los usuarios pueden hacer clic en cualquier parte del canvas para agregar nuevas pelotas en la posición seleccionada sin recargar la página.
- **Colisiones entre pelotas**: Las pelotas colisionan entre sí y rebotan aplicando un modelo básico de física de colisión elástica.
- **Visualización en tiempo real**: Las posiciones de las pelotas se actualizan continuamente en el navegador gracias a las solicitudes asincrónicas (AJAX) y se representan en un canvas HTML5.
- **Interfaz visual moderna**: La simulación presenta una interfaz amigable y visualmente atractiva con un fondo degradado, sombras en los elementos y efectos de hover en los controles.

## Tecnologías Utilizadas

### Backend (Servidor)
- **Java**: Se encarga de la lógica de la simulación, gestión de pelotas y cálculos de colisiones.
- **JSP**: Utilizado para generar el HTML dinámico y exponer los datos de la simulación al frontend mediante JSON.
- **Threads**: Cada pelota tiene su propio hilo para actualizar su posición de forma independiente, simulando el movimiento en tiempo real.

### Frontend (Cliente)
- **HTML5 Canvas**: Utilizado para dibujar las pelotas y mostrar su movimiento en la página.
- **JavaScript**: Controla la interacción con el canvas, maneja las solicitudes AJAX al servidor y actualiza la visualización en tiempo real.
- **CSS**: Mejora la apariencia de la página con un diseño moderno, incluyendo sombras y bordes redondeados en los elementos gráficos.

## Cómo Funciona

1. **Simulación Inicial**: Al cargar la página, el backend genera 1000 pelotas con atributos como posición, velocidad, masa, tamaño y color. Estas pelotas comienzan a moverse en el canvas bajo la influencia de la gravedad.
2. **Interacción del Usuario**: Los usuarios pueden hacer clic en el canvas para agregar más pelotas en cualquier momento. Las nuevas pelotas aparecerán en la ubicación del clic.
3. **Colisiones y Rebote**: Las pelotas rebotan en los bordes del canvas y entre sí, calculando la nueva dirección y velocidad después de cada colisión.
4. **Actualización Continua**: El frontend solicita al servidor las posiciones actualizadas de las pelotas cada 20 ms y redibuja el canvas con la nueva información.

## Requisitos del Sistema

- **Java 8 o superior**.
- **Apache Tomcat** u otro servidor compatible con servlets.
- **Maven** para gestionar dependencias y compilar el proyecto.
- Navegador moderno compatible con HTML5 (Chrome, Firefox, Edge).

## Instrucciones para Ejecutar el Proyecto

1. Clona este repositorio en tu máquina local:
    ```bash
    git clone https://github.com/tu-usuario/simulacion-rebote-amortiguado.git
    ```

2. Importa el proyecto en tu IDE de preferencia (NetBeans, Eclipse, IntelliJ).

3. Asegúrate de tener **Maven** instalado y ejecuta:
    ```bash
    mvn clean install
    ```

4. Despliega el proyecto en **Apache Tomcat** u otro servidor compatible.

5. Abre tu navegador e ingresa a `https://github.com/alex-raul/rebote-de-pelotas-con-Threads-Java` para ver la simulación en acción.

## Capturas de Pantalla

![Simulación de Rebote Amortiguado](ruta-a-la-captura-de-pantalla.png)

