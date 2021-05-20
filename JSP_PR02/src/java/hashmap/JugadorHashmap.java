package hashmap;

/**
 *
 * @author z3rh10
 */
import java.text.*;
import java.util.*;
import java.time.*;
import java.time.format.*;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.stream.Collectors;

public class JugadorHashmap {

    public static final HashMap<String, Jugador> jugHash = new HashMap<String, Jugador>();

    public JugadorHashmap() {
    }

   
    

//    public void add1(String nombre, Date fechaNac, int intentos) {
//        int edadAct = calcularEdad(fechaNac);
//        int diaNac = calcularDiaNac(fechaNac);
//        int mesNac = calcularMesNac(fechaNac);
//        String horoscopo = signo(diaNac, mesNac);
//
//        Jugador j = new Jugador(nombre, edadAct, horoscopo, intentos);
//        jug.put(nombre, j);
//    }
    public HashMap devolverTipoHash() {
        return jugHash;
    }

    public void addPredeterminado(Jugador j) {

        jugHash.put(j.getNombre(), j);

    }

    public void add(String nombre, Jugador j) {
//        int edadAct = calcularEdad(j.getFechaNac());
        int edadAct = calcularEdad(j.getFechaNacString());
        int diaNac = calcularDiaNac(j.getFechaNacString());
        int mesNac = calcularMesNac(j.getFechaNacString());
        int intentos = j.getIntentos();

        String horoscopo = signo(diaNac, mesNac);

        Jugador jnew = new Jugador(nombre, edadAct, horoscopo, intentos);
        jugHash.put(nombre, jnew);
    }

    public int calcularEdad(String nacimiento) {

        String[] partes = nacimiento.split("-");
        //año input type date
        int edad = 2021 - Integer.parseInt(partes[0]);

        return edad;

    }

    private int calcularDiaNac(String fechaNac) {

        String[] partes = fechaNac.split("-");
        //dia input type date
        int dia = Integer.parseInt(partes[2]);

        return dia;

    }

    private int calcularMesNac(String fechaNac) {

        String[] partes = fechaNac.split("-");

        int mes = Integer.parseInt(partes[1]);

        return mes;

    }

    public String signo(int dia, int mes) {
        String signo = "";
        switch (mes) {
            case 1:
                if (dia > 21) {
                    signo = "ACUARIO";
                } else {
                    signo = "CAPRICORNIO";
                }
                break;
            case 2:
                if (dia > 19) {
                    signo = "PISCIS";
                } else {
                    signo = "ACUARIO";
                }
                break;
            case 3:
                if (dia > 20) {
                    signo = "ARIES";
                } else {
                    signo = "PISCIS";
                }
                break;
            case 4:
                if (dia > 20) {
                    signo = "TAURO";
                } else {
                    signo = "ARIES";
                }
                break;
            case 5:
                if (dia > 21) {
                    signo = "GEMINIS";
                } else {
                    signo = "TAURO";
                }
                break;
            case 6:
                if (dia > 20) {
                    signo = "CANCER";
                } else {
                    signo = "GEMINIS";
                }
                break;
            case 7:
                if (dia > 22) {
                    signo = "LEO";
                } else {
                    signo = "CANCER";
                }
                break;
            case 8:
                if (dia > 21) {
                    signo = "VIRGO";
                } else {
                    signo = "LEO";
                }
                break;
            case 9:
                if (dia > 22) {
                    signo = "LIBRA";
                } else {
                    signo = "VIRGO";
                }
                break;
            case 10:
                if (dia > 22) {
                    signo = "ESCORPION";
                } else {
                    signo = "LIBRA";
                }
                break;
            case 11:
                if (dia > 21) {
                    signo = "SAGITARIO";
                } else {
                    signo = "ESCORPION";
                }
                break;
            case 12:
                if (dia > 21) {
                    signo = "CAPRICORNIO";
                } else {
                    signo = "SAGITARIO";
                }
                break;
        }
        return signo;
    }

    public String toString() {
        String ret = "";
        for (Jugador j : jugHash.values()) {
            ret += j + "\n";
        }

        return ret;
    }

    public Collection<Jugador> getList() {
        return jugHash.values();
    }

}
