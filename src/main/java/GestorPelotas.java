package com.mycompany.simulacionpelotasweb;

//import static java.lang.Math.random;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

// logica. gesto y controlador 
public class GestorPelotas {
    private List<Pelota> pelotas = new ArrayList<>();
    private Random random = new Random(); 

    public void agregarPelota(float x, float y, int width, int height) {
        float radio = random.nextFloat() * (30 - 10) + 10;  
        Pelota nuevaPelota = new Pelota(x, y, radio, width, height);
        pelotas.add(nuevaPelota);

        Thread hilo = new Thread(nuevaPelota);  // Cada pelota en un hilo
        hilo.start();
        
    }

    public List<Pelota> obtenerPelotas() {
        return pelotas;
    }
    
    public void agregarPelotasIniciales(int cantidad, int width, int height) {
        for (int i = 0; i < cantidad; i++) {
            
            float x = random.nextFloat() * width;
            float y = random.nextFloat() * height;
            agregarPelota(x, y, width, height);
        }
    }
    
    public void verificarColisiones() {
        for (int i = 0; i < pelotas.size(); i++) {
            Pelota pelota1 = pelotas.get(i);
            for (int j = i + 1; j < pelotas.size(); j++) {
                Pelota pelota2 = pelotas.get(j);
                if (hayColision(pelota1, pelota2)) {
                    //System.out.println("Colisión detectada zzzz.");
                    rebotarPelotas(pelota1, pelota2);
                }
            }
        }
    }
    private boolean hayColision(Pelota p1, Pelota p2) {
        float dx = p1.getX() - p2.getX();
        float dy = p1.getY() - p2.getY();
        float distancia = (float) Math.sqrt(dx * dx + dy * dy);
        
        return distancia <= (p1.getRadio() + p2.getRadio());
    }
    private void rebotarPelotas(Pelota p1, Pelota p2) {
        float dx = p1.getX() - p2.getX();
        float dy = p1.getY() - p2.getY();
        float distancia = (float) Math.sqrt(dx * dx + dy * dy);

        float nx = dx / distancia;
        float ny = dy / distancia;

        float vxRelativo = p1.getVelocidadX() - p2.getVelocidadX();
        float vyRelativo = p1.getVelocidadY() - p2.getVelocidadY();

        float velocidadRelativa = vxRelativo * nx + vyRelativo * ny;

        if (velocidadRelativa > 0) {
            return;  
        }

        float impulso = (2 * velocidadRelativa) / (p1.getMasa() + p2.getMasa());

        p1.setVelocidadX(p1.getVelocidadX() - impulso * p2.getMasa() * nx);
        p1.setVelocidadY(p1.getVelocidadY() - impulso * p2.getMasa() * ny);

        p2.setVelocidadX(p2.getVelocidadX() + impulso * p1.getMasa() * nx);
        p2.setVelocidadY(p2.getVelocidadY() + impulso * p1.getMasa() * ny);
    }
    public void actualizarSimulacion() {
        for (Pelota pelota : pelotas) {
            pelota.actualizar();  
        }
        verificarColisiones();  
    }

}
