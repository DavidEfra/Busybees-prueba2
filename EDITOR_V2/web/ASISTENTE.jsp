<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Asistente :)</title>
  <link rel="stylesheet" href="estilos.css" type="text/css"/>
 
</head>
 <style type="text/css">
            body {
                background-color: #f2f2f2;
            }
            h1 {
                color: blue;
            }

            table {
                font-family: "Helvetica Neue", sans-serif;
                border-collapse: collapse;
                
                margin: 0 auto;
                margin-bottom: 40px;
                color: #444;
                background: #fff;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                border: 2px;
            }
            
            thead {
                background-color: #f2f2f2;
                text-transform: uppercase;
                font-size: 14px;
                font-weight: 700;
              }

            th {
                background-color: #EFA250;
                color: white;
                font-weight: bold;
                text-align: left;
                padding: 8px;
            }

            td {
                border-bottom: 2px solid #ddd;
                width: 6%;
                padding: 8px;
            }
            .tab {
                width: 5%;
            }

            .tab8 {
                width: 7%;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            select {
                width: 200px;
                height: 40px;
                background-color: #f0f0f0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                font-weight: bold;
                color: #333;
                padding: 10px 20px;
                cursor: pointer;
                outline: none;
            }

            /* Estilos para las opciones del select */
            option {
                background-color: #fff;
                color: #333;
                font-size: 16px;
            }
            
            h1 {
            font-size: 35px;
            line-height: 1.2;
            margin: 0;
            padding: 0;
            color: #333;
            font-family: 'Italic';
            text-align: center;
            }

            /* Estilos para la clase "h1-destacado" */
            .h1-destacado {
            font-size: 60px;
            font-weight: bold;
            color: #ff9a00;
            text-align: center;
            margin-bottom: 40px;
            }
            .boton-container button {
                appearance: none;
                border: none;
                background: transparent;
                color: #FFFFFF;
                font-size: 16px;
                font-weight: bold;
                padding: 12px 30px;
                cursor: pointer;
                text-align: center;
                transition: transform 0.2s ease-in-out;
              }
            .boton-container {
                display: flex;
                justify-content: space-between;
                border: none;
                background-color: transparent;
                text-align: center;
              }

            .boton-container a {
                text-decoration: none;
                color: #fff;
                background-color: #c0392b;
                border: none;
                text-align: center;
                font-size: 18px;
                font-weight: 600;
                box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
                transition: transform 0.3s ease-in-out;
                
              }

            .boton-container a:hover {
                transform: translate(0px, 2px);
                background-color: #F45444;
                box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
              }

            .boton-container a:active {
                transform: translate(1px, 1px);
                box-shadow: none;
              }

              @media screen and (max-width: 768px) {
            .boton-container {
                  flex-direction: column;
                }

        </style>

<body>      
    
<%@page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
    
           
        <%  
            String USER = (String) session.getAttribute("PERFIL");
            if (USER != null) {
            out.println("Bienvenido, " + USER);
            }
            if ("gerenteS".equals(USER)) {
                %>
                <div class="boton-container">
                    <a href='LOGIN.jsp'><button>Cerrar Sesion</button></a>
                    <a href='ASISTENTE.jsp' ><button >Asistente</button></a>
                    <a href='Gerente_Soporte.jsp' ><button >gerente de soporte</button></a>
                    <a href='todos.jsp' ><button >Gerente de mantenimiento</button></a>
                    <a href='index.jsp' ><button >Ingeniero de soporte</button></a>
                    <a href='indexINGM.jsp' ><button >Ingeniero de mantenimiento</button></a>
                    <a href='EDITOR.jsp'><button>Editor</button></a>
                    <BR>
                </div>
                <%
            }else if("gerenteM".equals(USER)) {
                %>
                <div class="boton-container">
                    <a href='LOGIN.jsp'><button>Cerrar Sesion</button></a>
                    <a href='ASISTENTE.jsp' ><button disabled>Asistente</button></a>
                    <a href='Gerente_Soporte.jsp' ><button disabled>gerente de soporte</button></a>
                    <a href='todos.jsp' ><button >Gerente de mantenimiento</button></a>
                    <a href='index.jsp' ><button disabled>Ingeniero de soporte</button></a>
                    <a href='indexINGM.jsp' ><button disabled>Ingeniero de mantenimiento</button></a>
                    <a href='EDITOR.jsp'><button disabled>Editor</button></a>
                    <BR>
                </div>
                <%
                    }else if("editor".equals(USER)) {
                %>
                <div class="boton-container">
                    <a href='LOGIN.jsp'><button>Cerrar Sesion</button></a>
                    <a href='ASISTENTE.jsp' ><button disabled>Asistente</button></a>
                    <a href='Gerente_Soporte.jsp' ><button disabled>gerente de soporte</button></a>
                    <a href='todos.jsp' ><button disabled>Gerente de mantenimiento</button></a>
                    <a href='index.jsp' ><button disabled>Ingeniero de soporte</button></a>
                    <a href='indexINGM.jsp' ><button disabled>Ingeniero de mantenimiento</button></a>
                    <a href='EDITOR.jsp'><button >Editor</button></a>
                    <BR>
                </div>
                <%
                }else if("asistente".equals(USER)) {
                %>
                <div class="boton-container">
                    <a href='LOGIN.jsp'><button>Cerrar Sesion</button></a>
                    <a href='ASISTENTE.jsp' ><button >Asistente</button></a>
                    <a href='Gerente_Soporte.jsp' ><button disabled>gerente de soporte</button></a>
                    <a href='todos.jsp' ><button disabled>Gerente de mantenimiento</button></a>
                    <a href='index.jsp' ><button disabled>Ingeniero de soporte</button></a>
                    <a href='indexINGM.jsp' ><button disabled>Ingeniero de mantenimiento</button></a>
                    <a href='EDITOR.jsp'><button disabled>Editor</button></a>
                    <BR>
                </div>
                <%
                    }else if ("ingenieroS1".equals(USER) || "ingenieroS2".equals(USER) || "ingenieroS3".equals(USER)) {

                %>
                <div class="boton-container">
                    <a href='LOGIN.jsp'><button>Cerrar Sesion</button></a>
                    <a href='ASISTENTE.jsp' ><button disabled>Asistente</button></a>
                    <a href='Gerente_Soporte.jsp' ><button disabled>gerente de soporte</button></a>
                    <a href='todos.jsp' ><button disabled>Gerente de mantenimiento</button></a>
                    <a href='index.jsp' ><button >Ingeniero de soporte</button></a>
                    <a href='indexINGM.jsp' ><button disabled>Ingeniero de mantenimiento</button></a>
                    <a href='EDITOR.jsp'><button disabled>Editor</button></a>
                    <BR>
                </div>
                <%
                       }else if ("ingenieroM1".equals(USER) || "ingenieroM2".equals(USER) || "ingenieroM3".equals(USER)) {

                %>
                <div class="boton-container">
                    <a href='LOGIN.jsp'><button>Cerrar Sesion</button></a>
                    <a href='ASISTENTE.jsp' ><button disabled>Asistente</button></a>
                    <a href='Gerente_Soporte.jsp' ><button disabled>gerente de soporte</button></a>
                    <a href='todos.jsp' ><button disabled>Gerente de mantenimiento</button></a>
                    <a href='index.jsp' ><button disabled>Ingeniero de soporte</button></a>
                    <a href='indexINGM.jsp' ><button >Ingeniero de mantenimiento</button></a>
                    <a href='EDITOR.jsp'><button disabled>Editor</button></a>
                    <BR>
                </div>
                <%
                }
            Connection conectaditoF = null;
            Statement comanditoF = null;
            ResultSet resultaditoF = null;
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conectaditoF = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                comanditoF = conectaditoF.createStatement();
            }
            catch(SQLException error){
                out.println(error.toString());
                error.printStackTrace();
            }
            try{
                    out.println("<h1 align='center' style='font-size: 1.5em;'>ASISTENTE</h1>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<h1 align='right' style='font-size: 1.5em;'>Tabla Reportes</h1>");
                    out.println("<br>");    
                    out.println("<table border='1' table width='70%' align='right'>"); 
                    out.println("<table class='tabla-reportes'>"); 
                    out.println("<tr>");
                    out.println("<td width='10s%'>Id reporte</td>");
                    out.println("<td width='10%'>Id usuario</td>");
                    out.println("<td width='10%'>Descripcion</td>");
                    out.println("<td width='10%'>Solucion</td>");
                    out.println("<td width='10%'>Fecha</td>");
                    out.println("<td width='10%'>Hora</td>");
                    out.println("<td width='10%'>Estado</td>");
                    
                    out.println("</tr>");
                    
                    resultaditoF = comanditoF.executeQuery("select * from REPORTES");
                    resultaditoF.next();
                do{
                    
                    String idreporte = resultaditoF.getString("IDREPORTE");
                    String idusuario = resultaditoF.getString("IDUSUARIO");
                    String descripcion = resultaditoF.getString("DESCRIPCION");
                    String solucion = resultaditoF.getString("SOLUCION");
                    String fecha = resultaditoF.getString("FECHA");
                    String hora = resultaditoF.getString("HORA");
                    String estado = resultaditoF.getString("ESTADO");
                    String perfil = resultaditoF.getString("PERFIL");
                    
                    
                    out.println("<tr>");
                    out.println("<td width='10%'>" + idreporte + "</td>");
                    out.println("<td width='10%'>" + idusuario + "</td>"); 
                    out.println("<td width='10%'>" + descripcion + "</td>");
                    out.println("<td width='10%'>" + solucion + "</td>");
                    out.println("<td width='10%'>" + fecha + "</td>");
                    out.println("<td width='10%'>" + hora + "</td>");
                    out.println("<td width='10%'>" + estado + "</td>");
                    out.println("</tr>");
                    
                }
                while(resultaditoF.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
            <form method="post" action="" >
                
                <label for="Idusuario" >Id usuario </label>
                <input type="text" id="Idusuario" name="Idusuario"><br><br>
                
                <label for="Descripcion" >Descripcion </label>
                <input type="text" id="Descripcion" name="Descripcion"><br><br>
                
                              
                <label for="Fecha">Fecha</label>
                <input type="date" id="Fecha"  name="Fecha"  value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" class="input-field"><br><br>
                
                <label for="Hora">Hora</label>
                <input type="time" id="Hora" name="Hora"  value="<%= LocalTime.now(ZoneId.of("America/Mexico_City")).format(DateTimeFormatter.ofPattern("HH:mm")) %>"><br><br>
          
                                
                <input type="submit"  name="guardar" value="Guardar">
                
              </form>
                    <%
            if (request.getParameter("Idusuario") != null &&
                request.getParameter("Descripcion") != null &&
                request.getParameter("Fecha") != null &&
                request.getParameter("Hora") != null &&
                request.getParameter("guardar") != null) { 

                String Idusuario = request.getParameter("Idusuario");
                String Descripcion = request.getParameter("Descripcion");
                String Solucion = "sin solucion";
                String Fecha = request.getParameter("Fecha");
                String Hora = request.getParameter("Hora");
                String Estado = "ABIERTO";
                String Perfil = "sin asignar";
                Connection con = null;
                Statement sta = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                    sta = con.createStatement();

                    sta.executeUpdate("INSERT INTO REPORTES VALUES(default ,'" + Idusuario + "','" + Descripcion + "','" + Solucion + "','" + Fecha + "','" + Hora + "','" + Estado + "','" + Perfil + "')");

                     response.sendRedirect(request.getContextPath() + "/ASISTENTE.jsp");
                    out.println("<script>alert('Los datos han sido guardados');</script>");
                } catch (SQLException error) {
                    out.println(error.toString());
                } catch (ClassNotFoundException error) {
                    out.println(error.toString());
                } finally {
                    try {
                        if (sta != null) {
                            sta.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException error) {
                        out.println(error.toString());
                    }
                }
            }
            %>
            
           
            
</html>