<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos</title>
        <link rel="stylesheet" href="estilos.css" type="text/css"/>
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
        
        
        <font face="Century Gothic" size="-1" >

        <%@page import="java.sql.*" %>
        <%@page import="java.util.Date" %>
        <%@page import="java.text.SimpleDateFormat" %>
        <%@page import="java.time.*" %>
        <%@page import="java.time.format.DateTimeFormatter" %>
        <%  String USER = (String) session.getAttribute("PERFIL");
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
            }
            catch(SQLException error){
                out.println(error.toString());
                error.printStackTrace();
            }
            try{
                    out.println("<h1>GERENTE DE SOPORTE</h1><br>");
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
                  
                resultadito = comandito.executeQuery("select * from REPORTES");
                out.println("<table>");
                resultadito.next();
                do{
                    String reporte = resultadito.getString("IDREPORTE");
                    String clavee = resultadito.getString("IDUSUARIO");
                    String nombrecito = resultadito.getString("DESCRIPCION");
                    String solucion = resultadito.getString("SOLUCION");
                    Date fecha = resultadito.getDate("FECHA");
                    Time hora = resultadito.getTime("HORA");
                    String estado = resultadito.getString("ESTADO");
                    String perfil = resultadito.getString("PERFIL");
                                   
                     out.println("<table border='1'>");
                    out.println("<tr>");
                    out.println("<td width='5%'>" + reporte + "</td>");
                    out.println("<td width='8%'>" + clavee + "</td>");
                    out.println("<td width='8%'>" + nombrecito + "</td>");
                    out.println("<td width='8%'>"+solucion+"</td>");
                    out.println("<td width='8%'>" + fecha + "</td>");
                    out.println("<td width='8%'>" + hora + "</td>");
                    out.println("<td width='8%'>" + estado + "</td>");
                    out.println("<td width='8%'>" + perfil + "</td>");
                    out.println("<form method=\"post\" action=\"\">");
                    out.println("<td class ='tab8' >");
                        out.println("<input type=\"hidden\" id=\"reporte\" name=\"reporte\" value=\""+ reporte +"\">");
                        out.println("<input type=\"submit\" value=\"Consultar\">");
                        out.println("</form>");
                    out.println("</td>");
                        out.println("</td>");    
                        out.println("</tr>");
                    }
                while(resultadito.next());
                    out.println("</table>");
                   //out.println("</form>");    
               
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
     <%-- </font>  
    <br><div class="f1"> <font face="Century Gothic" size="+2" ><center> BUSCAR REPORTE </font>
    <form method="post" action="">
    <label for="reporte">No. de reporte</label>
    <input type="text" id="reporte" name="reporte">
    <input type="submit" value="Consultar"><br><br>
    </form></center></div>--%>
        <%
    if(request.getMethod().equalsIgnoreCase("post")) {
        String reporte = request.getParameter("reporte");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            ps = con.prepareStatement("SELECT FECHA, HORA, ESTADO, PERFIL FROM REPORTES WHERE IDREPORTE = ?");          
            ps.setString(1, reporte);
            rs = ps.executeQuery();
            if (rs.next()) {
                String FECHA1 = rs.getString("FECHA");
                String HORA1 = rs.getString("HORA");
                String ESTADO1 = rs.getString("ESTADO");
                
                String PERFIL1 = rs.getString("PERFIL");
               
    %>
       
       
    <br><div class="f1">
        <br>
        <font face="Century Gothic" size="+2"><center> GERENTE DE SOPORTE  </font>
             <p><br> Reporte <%= reporte %> </p><br><br>
        <form  method="post">
         <font face="Century Gothic"> Fecha 
         <input type="date" name="FECHA" id="FECHA" value="<%= java.time.LocalDate.now() %>" class="input-field"></font><p>
                <font face="Century Gothic">  Hora 
         <input type="time" name="HORA" id="HORA" value="<%= LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm")) %>"></font><p>
              
              
        <font face="Century Gothic">Estado:
            <select name="ESTADO" id="ESTADO" onChange="actualizarAsignacion()">
                <option value="no">Seleccione una opción</option>
                <option value="EN MANTENIMIENTO">EN MANTENIMIENTO</option>
                <option value="EN PROCESO">EN PROCESO</option>
            </select>
        </font>

        <font face="Century Gothic">Asignar a:
            <select name="PERFIL" id="PERFIL" value="<%=PERFIL1%>">
                <option value="Gerente de Mantenimiento">Gerente de Mantenimiento</option>
                <option value="ingenieroS1">ingenieroS1</option>
                <option value="ingenieroS2">ingenieroS2</option>
                <option value="ingenieroS3">ingenieroS3</option>
            </select>
            <br> 
        </font>

        <script type="text/javascript">
            function actualizarAsignacion() {
                var estadoSelect = document.getElementById("ESTADO");
                var perfilSelect = document.getElementById("PERFIL");
                var perfilOptions = perfilSelect.options;

                if (estadoSelect.value === "EN MANTENIMIENTO") {
                    // Mostrar opciones para Gerente de Mantenimiento
                    perfilOptions[0].style.display = "block";
                    perfilOptions[1].style.display = "none";
                    perfilOptions[2].style.display = "none";
                    perfilOptions[3].style.display = "none";
                } else {
                    // Mostrar opciones para ingenieroS1, ingenieroS2, y ingenieroS3
                    perfilOptions[0].style.display = "none";
                    perfilOptions[1].style.display = "block";
                    perfilOptions[2].style.display = "block";
                    perfilOptions[3].style.display = "block";
                }
            }

            // Ejecutar actualizarAsignacion() al cargar la página para establecer las opciones iniciales
            actualizarAsignacion();
        </script>


            
        <input type="hidden" name="reporte" value="<%=reporte%>">
        <input type="submit" name="cambiar" value="cambiar">
                 
         </form></center></div>
               
    <% if(request.getParameter("cambiar") != null) {
             
                String FECHA = request.getParameter("FECHA");
                String HORA = request.getParameter("HORA");
                String ESTADO = request.getParameter("ESTADO"); 
                String PERFIL = request.getParameter("PERFIL");
               
                try {
                    ps = con.prepareStatement("UPDATE REPORTES SET FECHA = ?, HORA = ?, ESTADO = ?, PERFIL=? WHERE IDREPORTE = ?");
               
                    ps.setString(1, FECHA);
                    ps.setString(2, HORA);
                    ps.setString(3, ESTADO);
                    ps.setString(4, PERFIL);
                    ps.setString(5, reporte);
                    ps.executeUpdate();
                    response.sendRedirect(request.getContextPath() + "/Gerente_Soporte.jsp");
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
           
            