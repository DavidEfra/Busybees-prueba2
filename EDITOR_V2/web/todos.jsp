<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos</title>
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
                width: 100%;
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
                background-color: #2c3e50;
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
                width: 3%;
            }
            .tab {
                width: -2%;
            }
            .tab2 {
                width: 8%;
                height: 22%;
            }
            .tab3 {
                width: 6%;
                height: 22%;
            }
            .tab4 {
                width: 0%;
                height: 22%;
            }

            .tab8 {
                width: 6%;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            select {
                width: 300px;
                height: 40px;
                background-color: #f0f0f0;
                border-color: #000;
                border-radius: 5px;
                font-size: 16px;
                font-weight: bold;
                color: #333;
                padding: 10px 20px;
                cursor: pointer;
                outline: none;
                border: 1px solid gray;
            }
            /* Estilos para las opciones del select */
            select:hover,
            select:focus {
              background-color: #fff;
              box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            option {
            font-size: 16px;
            font-weight: normal;
            color: #444;
            background-color: #fff;
            transition: all 0.3s ease;
            }
            option:hover,
            option:focus {
            background-color: #3b7dda;
            color: #fff;
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
            
            input[type="submit"] {
            display: inline-block;
            padding: 8px 16px;
            margin: 5px;
            font-size: 9px;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
            background-color: #95b0a7;
            border: 2px solid #95b0a7;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #000;
            }

            input[type="submit"]:hover {
            background-color: #fff;
            color: #3b7dda;
            }
            p {
              font-size: 25px;
              font-weight: bold;
              color: #333;
              margin: 0;
              padding: -22px;
              background-color: #f2f2f2;
              border-radius: 5px;
            }

            .est {
              background-color: #f2f2f2;
              color: #333;
              font-size: 18px;
              font-weight: bold;
              width: 400px;
              height: 18px;
              padding: 10px;
              border-radius: 3px;
              box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
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
    </head>
    <body>
        <%@ page import="java.util.Date" %>
        <%@page import="java.sql.*,java.util.* " %>
        <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.text.SimpleDateFormat" %>
    
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
            Connection conectadito = null;
            Statement comandito = null;
            ResultSet resultadito = null;
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conectadito = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                comandito = conectadito.createStatement();
                //PreparedStatement resul = conectadito.prepareStatement("UPDATE REPORTES SET SOLUCION = ?, ESTADO = ?");
            }
            catch(SQLException error){
                out.println(error.toString());
                error.printStackTrace();
            }
            try{
                    out.println("<h1>GERENTE DE MANTENIMIENTO</h1><br>");
                    out.println("<table border='1'>");
                    out.println("<tr>");
                    out.println("<td class ='tab'>Idreporte</td>");
                    out.println("<td width: 10%;>Idusuario</td>");
                    out.println("<td class ='tab'>Descripcion</td>");
                    out.println("<td >Solucion</td>");
                    out.println("<td class ='tab'>Fecha</td>");
                    out.println("<td class ='tab'>Hora</td>");
                    out.println("<td >Idusuario</td>");
                    out.println("<td >Estado</td>");
                    out.println("<td class ='tab8'>Aisgnación</td>");
                    out.println("<td class ='tab8'>    </td>");
                    
                    out.println("</tr>");
                    
                resultadito = comandito.executeQuery("select * from REPORTES where ESTADO = 'EN MANTENIMIENTO' or ESTADO = 'PROGRAMADO'");
                out.println("<table border='1'>");
                resultadito.next();
                do{
                    //out.println("<form action='cambios2.jsp' method='post' name='cambios3'>");
                    String reporte = resultadito.getString("IDREPORTE");
                    String clavee = resultadito.getString("IDUSUARIO");
                    String nombrecito = resultadito.getString("DESCRIPCION");
                    String estado = resultadito.getString("SOLUCION");
                    String fecha = resultadito.getString("FECHA");
                    Time hora = resultadito.getTime("HORA");
                    String estad = resultadito.getString("ESTADO"); 
                    String asignacion = resultadito.getString("PERFIL"); 

                    out.println("<tr>");
                    out.println("<td >" + reporte );
                        /*out.println("<form method=\"post\" action=\"\">");
                        //out.println("<label for=\"reporte\">Idreporte</label>");
                        out.println("<input type=\"hidden\" id=\"reporte\" name=\"reporte\" value=\""+ reporte +"\">");
                        out.println("<input type=\"submit\" value=\"Editar\">");
                        out.println("</form>");*/
                    out.println("</td>");
                    out.println("<td class ='tab1'>" + clavee + "</td>");
                    out.println("<td class ='tab2'>" + nombrecito + "</td>");
                    out.println("<td >" + estado + "</td>");
                    out.println("<td class ='tab3'>" + fecha + "</td>");
                    out.println("<td class ='tab4'>" + hora + "</td>");
                    out.println("<td >" + "Gerente de Mantenimineto" + "</td>");
                    out.println("<td >" + estad + "</td>");
                    out.println("<td >" + asignacion + "</td>");
                    out.println("<td class ='tab8' >");
                        out.println("<form method=\"post\" action=\"\">");
                        //out.println("<label for=\"reporte\">Idreporte</label>");
                        out.println("<input type=\"hidden\" id=\"reporte\" name=\"reporte\" value=\""+ reporte +"\">");
                        out.println("<input type=\"submit\" value=\"Editar\">");
                        out.println("</form>");
                    out.println("</td>");
                    
                    }
                while(resultadito.next());
                    out.println("</table>");
                    //out.println("<input type='submit' name='cambios' value='cambios'>");
                    //response.sendRedirect(request.getContextPath() + "/todos.jsp");
                    out.println("</form>");  
                   // out.println("<script>alert('Bienvenido Gerente de Mantenumiento');</script>");
                 //out.println("</form>");    
                
            }
            catch(SQLException error){
                out.println(error.toString());
            }
            //out.print("<script>alert('Bienvenido Gerente de Manteniento');</script>");
        %>
        <%--<font face="Italic" size="4px">  <br><br>Elige reporte a modificar: </font><br><br>
        <form method="post" action="">
            <label for="reporte">Idreporte</label>
            <input type="text" id="reporte" name="reporte">
            <input type="submit" value="Editar">
        </form>--%>

        <%
        if(request.getMethod().equalsIgnoreCase("post")) {
            String reporte = request.getParameter("reporte");
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                ps = con.prepareStatement("SELECT ESTADO, PERFIL FROM REPORTES WHERE IDREPORTE = ?");           
                ps.setString(1, reporte);
                rs = ps.executeQuery();
                if (rs.next()) {
                    //String SOLUCION1 = rs.getString("SOLUCION");
                    String ESTADO1 = rs.getString("ESTADO");
                    String PERFIL1 = rs.getString("PERFIL");
                    //String FECHA1 = rs.getString("FECHA");

        %>

        <%
            // Obtenemos la fecha y hora actual
            java.util.Date ahora = new java.util.Date();
            // Creamos un objeto SimpleDateFormat con el formato deseado
            SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");
            // Formateamos la fecha y hora actual
            String horaActual = formato.format(ahora);
            // Imprimimos la hora actual
            //out.println("La hora actual es: " + horaActual);
            
            SimpleDateFormat formato1 = new SimpleDateFormat("yyyy-MM-dd");
            String fechaActual = formato1.format(ahora);
            //out.println("La hora actual es: " + fechaActual);
        %>

    </body>
</html>


 <p> Reporte <%= reporte %> </p><br><br>
<form action="<%=request.getRequestURI()%>" method="post">
    <%--<font face="Italic" > Solucion <input type="text"  name="SOLUCION" id="SOLUCION" value="<%=SOLUCION1%>"></font><p>
        <br>--%>
    <div class="eta"> Estado </div><br>
        <%--<input type='hidden' name='ESTADO' value=<%=ESTADO1%>></font><p>--%>
        <select name="ESTADO" id="ESTADO" value=<%=ESTADO1%>>
            <option  value="EN PROGRAMACION">EN PROGRAMACION</option>
            <option value="MANTENIMIENTO FINALIZADO">MANTENIMIENTO FINALIZADO</option>
        </select>
        <br> <br>

        <div> Asignar a: </div><br>
        <select name="PERFIL" id="PERFIL" value=<%=PERFIL1%>>
            <option  value="ingenieroM1">ingenieroM1</option>
            <option value="ingenieroM2">ingenieroM2</option>
            <option value="ingenieroM3">ingenieroM3</option>
        </select>
        <br> <br>

        <input type="hidden" name="reporte" value="<%=reporte%>">
        <%--<input type="hidden" name="fechaActual" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"><%--LA FECHA--%>
        <input type="submit" name="Modificar" value="Modificar">
        <%--<input type="submit" name="guardar" value="guardar">--%>
</form>

<% if(request.getParameter("Modificar") != null) {
    
            //Date fechaActual = new Date();  
            String SOLUCION = request.getParameter("SOLUCION");
            //String HORA = request.getParameter("HORA");
            String ESTADO = request.getParameter("ESTADO");
            String PERFIL = request.getParameter("PERFIL");
            //String FECHA = request.getParameter(horaActual);
            //tring fechaActualizada = request.getParameter("fechaActual");
            try {
                ps = con.prepareStatement("UPDATE REPORTES SET ESTADO = ?, PERFIL = ?, FECHA = ?, HORA = ?   WHERE IDREPORTE = ?");
                //ps.setString(1, SOLUCION);
                ps.setString(1, ESTADO);
                ps.setString(2, PERFIL);
                //ps.setDate(4, new java.sql.Date(fechaActual.getTime()));
                ps.setString(3, fechaActual);
                ps.setString(4, horaActual);
                ps.setString(5, reporte);
                ps.executeUpdate();
                response.sendRedirect(request.getContextPath() + "/todos.jsp");
            } catch (SQLException error) {
                out.println(error.toString());
            }
        }

            } else {
                 out.println("<script>alert('Ese reporte no existe');</script>");
              }
          } catch (SQLException | ClassNotFoundException error) {
              out.println(error.toString());
          } 
              
        }
%> 
</body>
</html>

