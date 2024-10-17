package com.mycompany.simulacionpelotasweb;
import java.awt.Color;
import java.util.Random;

public class Pelota implements Runnable {
    private float x, y;  
    private float velocidadX, velocidadY;  
    private float g = 9.8f;  
    private float amortiguacion = 0.8f;  
    private float radio;
    private int width, height;  
    private Color color;
    private float masa;
    
    public Pelota(float x, float y, float radio, int width, int height) {
        this.x = x;
        this.y = y;
        this.radio = radio;
        this.width = width;
        this.height = height;

        Random rand = new Random();
        this.velocidadX = rand.nextFloat() * 5 - 2.5f;  
        this.velocidadY = 0;

        this.masa = this.radio;  
        this.color = new Color(rand.nextInt(256), rand.nextInt(256), rand.nextInt(256));  // Color aleatorio
    }

    public void actualizar() {
        velocidadY += g * 0.1;
        x += velocidadX;
        y += velocidadY;

        if (y + radio >= height) {
            y = height - radio;
            velocidadY = -velocidadY * amortiguacion;
        }
        if (x - radio <= 0 || x + radio >= width) {
            velocidadX = -velocidadX;
        }
    }
    

    @Override
    public void run() {
        while (true) {
            actualizar();  //posición en cada ciclo
            try {
                Thread.sleep(20);  
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    public float getMasa() {
        return masa;  
    }


    public float getX() { return x; }
    public float getY() { return y; }
    public float getRadio() { return radio; }
    public Color getColor() { return color; }

    public float getVelocidadX() { return velocidadX; }
    public float getVelocidadY() { return velocidadY; }
    
    public void setVelocidadX(float velocidadX) { this.velocidadX = velocidadX; }
    public void setVelocidadY(float velocidadY) { this.velocidadY = velocidadY; }
}
