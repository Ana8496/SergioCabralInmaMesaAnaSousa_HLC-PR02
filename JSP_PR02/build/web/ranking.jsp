<%-- 
    Document   : ranking
    Created on : 13-may-2021, 20:39:44
    Author     : z3rh10
--%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="hashmap.Jugador"%>
<%@page import="hashmap.JugadorHashmap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Ranking</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <!-- Custom CSS Todas las páginas-->
        <link rel="stylesheet" type="text/css" href="./css/all.css">
        <!-- Custom CSS Index-->
        <!-- <link rel="stylesheet" type="text/css" href="assets/css/index.css"> -->

        <!-- Scripts Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </head>
    <body class="bg-dark" id="fondo">

        <div class="pt-2">
            <nav class="navbar navbar-expand-lg navbar-dark text-center">
                <div class="container-fluid">

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse pt-4" id="navbarNavDropdown">

                        <ul class="navbar-nav">

                            <li class="nav-item">
                                <a class="nav-link px-5" href="index.html"><h2>INICIO</h2></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link px-5" href="juego.jsp"><h2>JUEGO</h2></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active px-5" href="ranking.jsp"><u><h2>RANKING</h2></u></a>
                            </li>

                        </ul>

                    </div>
                </div>
            </nav>
            <%

                Jugador j1 = new Jugador("Sergio", "1998-11-26", 4);
                Jugador j2 = new Jugador("Inma", "1998-09-05", 5);
                Jugador j3 = new Jugador("Ana", "2001-10-23", 6);

            %>

            <%                
                JugadorHashmap jugHas = new JugadorHashmap();

                HashMap<String, Jugador> jug = new HashMap();

                jug = jugHas.devolverTipoHash();

                jugHas.add(j1.getNombre(), j1);
                jugHas.add(j2.getNombre(), j2);
                jugHas.add(j3.getNombre(), j3);

                Set<String> jugs = jug.keySet();

            %>

            <div>
                <c:choose>
                    <c:when test='${param.porIntentos == null && param.porEdad == null }'>

                        <form style="color:white; margin-top: -2%" class="text-center pr-5 pb-4 pl-5">
                            <input type="hidden" name="porIntentos" value="true"/>
                            <br><br>
                            <input type="submit" value="Ordenar por intentos"/>
                        </form> 
                        <form style="color:white; margin-top: -3%" class="text-center pr-5 pb-4 pl-5">
                            <input type="hidden" name="porEdad" value="true"/>
                            <br><br>
                            <input type="submit" value="Ordenar por edad"/>
                        </form>

                        <div>
                            <section class="section-content p-3 text-center">
                                <table class="table pt-5">
                                    <thead class="thead-dark">
                                        <tr style="color:yellow">
                                            <th scope="col" class="tabletitles">JUGADOR</th>
                                            <th scope="col" class="tabletitles">EDAD</th>
                                            <th scope="col" class="tabletitles">SIGNO</th>
                                            <th scope="col" class="tabletitles">INTENTOS</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%                                            
                                            for (String j : jugs) {
                                                String nombre = jug.get(j).getNombre();
                                                int edad = jug.get(j).getEdad();
                                                String signo = jug.get(j).getHoroscopo();
                                                int intentos = jug.get(j).getIntentos();


                                        %>
                                        <tr style="color: white">
                                            <th scope="row" class="tableinfo">
                                                <%                                        out.print(nombre);
                                                %>
                                            </th>
                                            <td class="tableinfo">
                                                <%
                                                    out.print(edad);
                                                %>
                                            </td>
                                            <td class="tableinfo">
                                                <%
                                                    out.print(signo);
                                                %>
                                            </td> 
                                            <td class="tableinfo">
                                                <%
                                                    out.print(intentos);
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </section>
                        </div>

                    </c:when>
                    <c:when test='${param.porIntentos == null}'>

                        <form style="color:white; margin-top: -2%" class="text-center pr-5 pb-4 pl-5">
                            <input type="hidden" name="porIntentos" value="true"/>
                            <br><br>
                            <input type="submit" value="Ordenar por intentos"/>
                        </form>  

                        <!--Si intentos es null, significa que está ordenado por edad, y viceversa -->
                        <h4 class="text-center" style="color:white">Ordenado por edad:</h4>

                        <div>
                            <section class="section-content p-3 text-center">
                                <table class="table pt-5">
                                    <thead class="thead-dark">
                                        <tr style="color:yellow">
                                            <th scope="col" class="tabletitles">JUGADOR</th>
                                            <th scope="col" class="tabletitles">EDAD</th>
                                            <th scope="col" class="tabletitles">SIGNO</th>
                                            <th scope="col" class="tabletitles">INTENTOS</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            Jugador arrayPorEdad[] = new Jugador[jugs.size()];
                                            int contEdad = 0;
                                            int iE, kE;
                                            Jugador auxE;

                                            for (String j : jugs) {

                                                //rellenar un array y desp ordenarlo (pendiente)
                                                String nombre = jug.get(j).getNombre();
                                                int edad = jug.get(j).getEdad();
                                                String signo = jug.get(j).getHoroscopo();
                                                int intentos = jug.get(j).getIntentos();

                                                arrayPorEdad[contEdad] = new Jugador(nombre, edad, signo, intentos);
                                                contEdad = contEdad + 1;
                                            }
                                            
                                            

                                            for (iE = 0; iE < arrayPorEdad.length - 1; iE++) {
                                                for (kE = 0; kE < arrayPorEdad.length - iE - 1; kE++) {
                                                    if(arrayPorEdad[kE + 1].getEdad() < arrayPorEdad[kE].getEdad()) {
                                                        auxE = arrayPorEdad[kE + 1];
                                                        arrayPorEdad[kE + 1] = arrayPorEdad[kE];
                                                        arrayPorEdad[kE] = auxE;
                                                    }
                                                }
                                            }
                                            
                                            for (int z = 0; z < arrayPorEdad.length; z++) {
                                                String nombre = arrayPorEdad[z].getNombre();
                                                int edad = arrayPorEdad[z].getEdad();
                                                String signo = arrayPorEdad[z].getHoroscopo();
                                                int intentos = arrayPorEdad[z].getIntentos();
                                            

                                        %>
                                        <tr style="color: white">
                                            <th scope="row" class="tableinfo">
                                                <%                                                    out.print(nombre);
                                                %>
                                            </th>
                                            <td class="tableinfo">
                                                <%
                                                    out.print(edad);
                                                %>
                                            </td>
                                            <td class="tableinfo">
                                                <%
                                                    out.print(signo);
                                                %>
                                            </td> 
                                            <td class="tableinfo">
                                                <%
                                                    out.print(intentos);
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </section>
                        </div>

                    </c:when>
                    <c:when test='${param.porEdad == null}'>

                        <form style="color:white; margin-top: -2%" class="text-center pr-5 pb-4 pl-5">
                            <input type="hidden" name="porEdad" value="true"/>
                            <br><br>
                            <input type="submit" value="Ordenar por edad"/>
                        </form>  

                        <!--Si edad es null, significa que está ordenado por intentos, y viceversa -->
                        <h4 class="text-center" style="color:white">Ordenado por intentos:</h4>

                        <div>
                            <section class="section-content p-3 text-center">
                                <table class="table pt-5">
                                    <thead class="thead-dark">
                                        <tr style="color:yellow">
                                            <th scope="col" class="tabletitles">JUGADOR</th>
                                            <th scope="col" class="tabletitles">EDAD</th>
                                            <th scope="col" class="tabletitles">SIGNO</th>
                                            <th scope="col" class="tabletitles">INTENTOS</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%                                            
                                            
                                            Jugador arrayPorIntento[] = new Jugador[jugs.size()];
                                            int contIntento = 0;
                                            int iI, kI;
                                            Jugador auxI;
                                            
                                            for (String j : jugs) {

                                                //rellenar un array y desp ordenarlo (pendiente)
                                                String nombre = jug.get(j).getNombre();
                                                int edad = jug.get(j).getEdad();
                                                String signo = jug.get(j).getHoroscopo();
                                                int intentos = jug.get(j).getIntentos();

                                                arrayPorIntento[contIntento] = new Jugador(nombre, edad, signo, intentos);
                                                contIntento = contIntento + 1;
                                            
                                            }
                                            
                                            for (iI = 0; iI < arrayPorIntento.length - 1; iI++) {
                                                for (kI = 0; kI < arrayPorIntento.length - iI - 1; kI++) {
                                                    if(arrayPorIntento[kI + 1].getIntentos() < arrayPorIntento[kI].getIntentos()) {
                                                        auxI = arrayPorIntento[kI + 1];
                                                        arrayPorIntento[kI + 1] = arrayPorIntento[kI];
                                                        arrayPorIntento[kI] = auxI;
                                                    }
                                                }
                                            }
                                            
                                            for (int z = 0; z < arrayPorIntento.length; z++) {
                                                String nombre = arrayPorIntento[z].getNombre();
                                                int edad = arrayPorIntento[z].getEdad();
                                                String signo = arrayPorIntento[z].getHoroscopo();
                                                int intentos =arrayPorIntento[z].getIntentos();
                                            

                                       
                                            
                                        %>
                                        <tr style="color: white">
                                            <th scope="row" class="tableinfo">
                                                <%                                                    out.print(nombre);
                                                %>
                                            </th>
                                            <td class="tableinfo">
                                                <%
                                                    out.print(edad);
                                                %>
                                            </td>
                                            <td class="tableinfo">
                                                <%
                                                    out.print(signo);
                                                %>
                                            </td> 
                                            <td class="tableinfo">
                                                <%
                                                    out.print(intentos);
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                           }
                                        %>
                                    </tbody>
                                </table>
                            </section>
                        </div>

                    </c:when>
                </c:choose>

            </div>




        </div>
    </body>
</html>
