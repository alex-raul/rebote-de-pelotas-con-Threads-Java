# Ejercicio de Simulación de Rebote Amortiguado de Pelotas utilizando Threads en Java.

## Descripción 

Es una simulación de pelotas que caen y rebotan usando **Java** en el backend. El objetivo principal es representar visualmente pelotas que caen bajo el efecto de la gravedad y rebotan cuando tocan el suelo o se colisionan entre ellas. La simulación utiliza **hilos (threads)** para manejar el movimiento independiente de cada pelota en el backend.

## Características

- **Simulación de 1000 pelotas al iniciar**: Al cargar la página, 100 pelotas de diferentes tamaños y colores comienzan a caer y rebotar en el canvas.
- **Agregar pelotas dinámicamente**: Al hacer clic en cualquier parte del canvas para agregar nuevas pelotas en la posición seleccionada.
- **Colisiones entre pelotas**: Las pelotas colisionan entre sí y rebotan aplicando un modelo básico de física de colisión elástica.
- **Visualización en tiempo real**: Las posiciones de las pelotas se actualizan continuamente en el navegador gracias a las solicitudes asincrónicas (AJAX) y se representan en un canvas HTML5.

## Tecnologías Utilizadas

### Backend (Servidor)
- **Java**: Se encarga de la lógica de la simulación, gestión de pelotas y cálculos de colisiones.
- **JSP**: Utilizado para generar el HTML dinámico y exponer los datos de la simulación al frontend mediante JSON.
- **Threads**: Cada pelota tiene su propio hilo para actualizar su posición de forma independiente, simulando el movimiento en tiempo real.



## Requisitos del Sistema

- **Java 8 o superior**.
- **Apache Tomcat** u otro servidor compatible con servlets.
- **Maven** para gestionar dependencias y compilar el proyecto.
- Navegador moderno compatible con HTML5.

## Instrucciones para Ejecutar el Proyecto

1. Clona este repositorio en tu máquina local:
    ```bash
    git clone [https://github.com/tu-usuario/simulacion-rebote-amortiguado.git](https://github.com/alex-raul/rebote-de-pelotas-con-Threads-Java
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

