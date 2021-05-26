<%-- 
    Document   : juego
    Created on : 13-may-2021, 20:36:53
    Author     : z3rh10
--%>
<%@page language="java" import = "java.util.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Juego</title>
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
                                <a class="nav-link active px-5" href="juego.jsp"><u><h2>JUEGO</h2></u></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link px-5" href="ranking.jsp"><h2>RANKING</h2></a>
                            </li>

                        </ul>

                    </div>
                </div>
            </nav>
            <jsp:useBean id="clock" class="fecha.JspCalendar" />

            <h1 style="color:white" class="text-center pt-3"><%= clock.getDayOfMonth()%>-<%= clock.getMonthInt()%>-<%= clock.getYear()%></h1>

            <%
                Integer intentos = (Integer) application.getAttribute("c_intentos");
                application.setAttribute("c_intentos", 0);

            %>

            <%!
                int numSecreto = (int) (Math.random() * 100 + 1);
                int v_intentos = 0;
                                                            %>


            <c:choose>
                <c:when test='${param.nombre == null}'>

                    <form style="color:white" class="text-center pr-5 pb-5 pl-5">
                        <strong>Introduce tu nombre</strong>
                        <br>
                        <input type="text" name="nombre" required="required"/>
                        <br><br>
                        <strong>Introduce tu Fecha de nacimiento</strong>
                        <br>
                        <input type="date" name="fechaNac" required="required"/>
                        <br><br>
                        <input type="submit" value="Comenzar"/>
                    </form>  

                </c:when>

                <c:when test='${param.nombre != null}'>

                    <%                        if (intentos == null || intentos == 0) {

                            intentos = 1;

                            v_intentos = intentos;
                    %>

                    <h3 style="color:white" class="text-center pt-3">${param.nombre}, adivina el número del 1 al 100</h3>
                    <hr>
                    <form style="color:white" class="text-center pr-5 pb-5 pl-5" action="juego.jsp" method="get">
                        <strong>El numero secreto es...</strong>
                        <br>
                        <input type="text" name="miNumero" required="required"
                               minlength="1" maxlength="3" size="2" class="text-center"
                               min="1"
                               max="100"/>
                        <br><br>
                        <input type="hidden" value="${param.nombre}" name="nombre"/>
                        <input type="hidden" value="${param.fechaNac}" name="fechaNac"/>
                        <input type="hidden" value="<%= v_intentos%>" name="intentos"/>
                        <input type="hidden" value="<%= numSecreto%>" name="nSecreto"/> 
                        <input type="submit" value="Comprobar"/>
                    </form>

                    <%
                    } else {
                        /* return visit */
                    %>

                    <h3 style="color:white" class="text-center pt-3"><b><i>Intentos: <%= intentos%></i></b></h3>

                    <c:choose>
                        <c:when test='${param.miNumero == param.nSecreto && param.intentos > 0}'>

                            <h3 style="color:white" class="text-center pt-3">¡Has ganado en <%= intentos%> intentos con el numero ${param.miNumero}! , el numero secreto era: <%= numSecreto%></h3>
                            <%

                                v_intentos = intentos;
                                application.setAttribute("c_intentos", 0);


                            %>

                            <form style="color:white" class="text-center pr-5 pb-5 pl-5" action="CrearJugador" method="GET">
                                <input type="hidden" value="${param.nombre}" name="nombre"/>
                                <input type="hidden" value="${param.fechaNac}" name="fechaNac"/>
                                <input type="hidden" value="<%= v_intentos%>" name="intentos"/>
                                <input type="submit" value="Guardar jugada"/>
                            </form>  
                            

                        </c:when>
                        <c:when test='${param.miNumero != param.nSecreto}'>
                            <c:if test='${param.miNumero > param.nSecreto}'>
                                <h3 style="color:white" class="text-center">EL SECRETO ES MENOR QUE TU NUMERO</h3>
                            </c:if>
                            <c:if test='${param.miNumero < param.nSecreto}'>
                                <h3 style="color:white" class="text-center">EL SECRETO ES MAYOR QUE TU NUMERO</h3>
                            </c:if>
                            <%                               
                                out.println("-----------" + numSecreto + "(Secreto)");

                                intentos += 1;
                                v_intentos = intentos;
                            %>
                            


                            <h3 style="color:white" class="text-center pt-3">${param.nombre}, adivina el número del 1 al 100</h3>
                            <hr>
                            <form style="color:white" class="text-center pr-5 pb-5 pl-5" action="juego.jsp" method="get">
                                <strong>El numero secreto es...</strong>
                                <br>
                                <input type="text" name="miNumero" required="required"
                                       minlength="1" maxlength="3" size="2" class="text-center"
                                       min="1"
                                       max="100"/>
                                <br><br>
                                <input type="hidden" value="${param.nombre}" name="nombre"/>
                                <input type="hidden" value="${param.fechaNac}" name="fechaNac"/>
                                <input type="hidden" value="<%= v_intentos%>" name="intentos"/>
                                <input type="hidden" value="<%= numSecreto%>" name="nSecreto"/>
                                <input type="submit" value="Comprobar"/>
                            </form>

                        </c:when>




                    </c:choose>
                    <%
                        }
                        application.setAttribute("c_intentos", intentos);


                    %>






                </c:when>

            </c:choose>



        </div>
    </body>
</html>
