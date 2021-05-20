/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hashmap;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author z3rh10
 */
public class Jugador {

    private String nombre;
    private GregorianCalendar fechaNac;

    private int edad;
    private String horoscopo;
    private int intentos;

    public Jugador() {
    }

    public Jugador(String nombre, int edad, String horoscopo, int intentos) {
        this.nombre = nombre;
        this.edad = edad;
        this.horoscopo = horoscopo;
        this.intentos = intentos;

    }

//    public Jugador(String nombre, Date fechaNac , int intentos) {
//        this.nombre = nombre;
//        this.fechaNac = fechaNac;
//        this.intentos = intentos;
//
//    }
    public Jugador(String nombre, GregorianCalendar fechaNac, int intentos) {
        this.nombre = nombre;
        this.fechaNac = fechaNac;
        this.intentos = intentos;

    }

//    public int compareTo(Jugador o) {
//        if (intentos < o.intentos) {
//            return -1;
//        }
//        if (intentos > o.intentos) {
//            return 1;
//        }
//        return 0;
//    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public GregorianCalendar getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(GregorianCalendar fechaNac) {
        this.fechaNac = fechaNac;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getHoroscopo() {
        return horoscopo;
    }

    public void setHoroscopo(String horoscopo) {
        this.horoscopo = horoscopo;
    }

    public int getIntentos() {
        return intentos;
    }

    public void setIntentos(int intentos) {
        this.intentos = intentos;
    }

    @Override
    public String toString() {
        return nombre + "," + edad + "," + horoscopo + "," + intentos;
    }

}
