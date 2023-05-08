<head>
    <link rel="stylesheet" href="estilos.css" type="text/css"/>
    <style type="text/css">
            body {
                background-color: #f2f2f2;
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

              h1{
                  padding-right: 20%;
                  font-size: 20px;
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
</head>    
<body>        
    
        <%@page import="java.sql.*" %>
        
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
                }
                catch(SQLException error){
                    out.println(error.toString());
                    error.printStackTrace();
                }
                try{
                    out.println("<h1 align='center' style='font-size: 1.5em;'>EDITOR</h1>");
                    out.println("<h3 align='center' style='font-size: 1.5em;'>Tabla de reportes</h1>");
                    out.println("<br>"); 
                    out.println("<table border='1'>");  
                    out.println("<tr>");
                    out.println("<td width='5%'>#reporte</td>");
                    out.println("<td width='5%'>idusuario</td>");
                    out.println("<td width='30%'>descripcion</td>");
                    out.println("<td width='30%'>solucion</td>");
                    out.println("<td width='10%'>fecha</td>");
                    out.println("<td width='10%'>hora</td>");
                    out.println("<td width='10%'>estado</td>");
                    out.println("</tr>");
                    
                    resultadito = comandito.executeQuery("select * from REPORTES where ESTADO='CERRADO'");

                    resultadito.next();
                do{
                    
                    String reporte = resultadito.getString("IDREPORTE");
                    String usuario = resultadito.getString("IDUSUARIO");
                    String descripcion = resultadito.getString("DESCRIPCION");
                    String solucion = resultadito.getString("SOLUCION");
                    Date fecha = resultadito.getDate("FECHA");
                    Time hora = resultadito.getTime("HORA");
                    String estado = resultadito.getString("ESTADO");
                    
                    out.println("<tr>");
                    out.println("<td width='5%' align='center'>" + reporte + "</td>    ");
                    out.println("<td width='5%'>" + usuario + "</td>"); 
                    out.println("<td width='30%'>" + descripcion + "</td>");
                    out.println("<td width='30%'>" + solucion + "</td>");
                    out.println("<td width='10%'>" + fecha + "</td>");
                    out.println("<td width='10%'>" + hora + "</td>");
                    out.println("<td width='10%'>" + estado + "</td>");
                    out.println("</tr>");
                    
                }
                while(resultadito.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
        
        
        <%
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
                   
                    out.println("<br>");
                    out.println("<h1 align='right' style='font-size: 1.5em;'>Tabla FAQs</h1>");
                    out.println("<h1 align='left' style='font-size: 1.5em;'>Crear FAQ</h1>");
                    out.println("<br>");    
                    out.println("<table border='1' table width='60%' align='right'>");  
                    out.println("<tr>");
                    out.println("<td width='5%'>#FAQ</td>");
                    out.println("<td width='30%'>Problemea</td>");
                    out.println("<td width='30%'>Solucion</td>");
                    out.println("</tr>");
                    
                    resultaditoF = comanditoF.executeQuery("select * from FAQs");
                    resultaditoF.next();
                do{
                    
                    String reporte = resultaditoF.getString("IDFAQ");
                    String usuario = resultaditoF.getString("PREGUNTA");
                    String descripcion = resultaditoF.getString("RESPUESTA");
                    
                    
                    out.println("<tr>");
                    out.println("<td width='5%' align='center'>" + reporte + "</td>");
                    out.println("<td width='30%'>" + usuario + "</td>"); 
                    out.println("<td width='30%'>" + descripcion + "</td>");
                    out.println("</tr>");
                    
                }
                while(resultaditoF.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
            <form>
                
                <label for="numero_FAQ">Número de FAQ</label>
                <input type="text" id="numero_reporte" name="numero_reporte"><br><br>
                <label for="pregunta" >Pregunta:</label>
                <input type="text" id="pregunta" name="pregunta"><br><br>
                <label for="respuesta" >Respuesta:</label>
                <input type="text" id="respuesta" name="respuesta"><br><br>
                <div class="sumit">
                <input type="submit" name="CREAR" value="CREAR">
                </div>
              </form>
                    <%
            if (request.getParameter("CREAR") != null) {

                String numero_reporte = request.getParameter("numero_reporte");
                String pregunta = request.getParameter("pregunta");
                String respuesta = request.getParameter("respuesta");

                Connection con = null;
                Statement sta = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                    sta = con.createStatement();

                    sta.executeUpdate("INSERT INTO FAQs VALUES('" + numero_reporte + "','" + pregunta + "','" + respuesta + "')");
                     response.sendRedirect(request.getContextPath() + "/EDITOR.jsp");
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
       
        <BR>
        <BR>
        <h1 align='left'>Generar Reporte a FAQ</h1>
        <form>
            <label for="numero_reporte">Número de reporte:</label>
            <input type="text" id="numero_reporte" name="numero_reporte"><br>
            <div class="sumit">
            <input type="submit" name="submit" value="Crear">
            </div>
        </form>
         
<%
    if (request.getParameter("numero_reporte") != null) {
        String numero_reporte = request.getParameter("numero_reporte");
        String pregunta = "";
        String respuesta = "";
        String estado = "";

        // Consultar la descripción y solución correspondientes al número de reporte
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            ps = con.prepareStatement("SELECT DESCRIPCION, SOLUCION, ESTADO FROM REPORTES WHERE IDREPORTE = ?");
            ps.setString(1, numero_reporte);
            rs = ps.executeQuery();
            if (rs.next()) {
                pregunta = rs.getString("DESCRIPCION");
                respuesta = rs.getString("SOLUCION");
                estado = rs.getString("ESTADO");
            }
        } catch (SQLException | ClassNotFoundException error) {
            out.println(error.toString());
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (ps != null) ps.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }

        // Insertar el nuevo FAQ en la tabla FAQs
        con = null;
        PreparedStatement insert = null;
        try {
            if (estado.equals("CERRADO")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            insert = con.prepareStatement("INSERT INTO FAQs (IDFAQ, PREGUNTA, RESPUESTA) VALUES (?, ?, ?)");
            insert.setString(1, numero_reporte);
            insert.setString(2, pregunta);
            insert.setString(3, respuesta);
            insert.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/EDITOR.jsp");
            out.println("<script>alert('FAQ guardado con éxito');</script>");
             }   
            
        } catch (SQLException | ClassNotFoundException error) {
            out.println(error.toString());
        } finally {
            try { if (insert != null) insert.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }
    }
%>
        <BR>
        <BR>
        <h1>Consultar FAQ</h1>
        <form>
            <label for="numero_FAQ">Número de FAQ:</label>
            <input type="text" id="numero_FAQ" name="numero_FAQ">
            <div class="sumit">
            <input type="submit" name="Consultar" value="Consultar">
            </div>
        </form>

<%
    if (request.getParameter("Consultar") != null){
        String numero_FAQ = request.getParameter("numero_FAQ");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            ps = con.prepareStatement("SELECT PREGUNTA, RESPUESTA FROM FAQs WHERE IDFAQ = ?");           
            ps.setString(1, numero_FAQ);
            rs = ps.executeQuery();
            if (rs.next()) {
                String preguntaC = rs.getString("PREGUNTA");
                String respuestaC = rs.getString("RESPUESTA");
    %>
        <BR>
        <form method="post" action="">
            <label for="pregunta">Pregunta:</label><bR>
            <input type="text" id="pregunta" name="pregunta" value="<%=preguntaC%>" size="50" style="width: 40%; height: 40px;"><br>
            <label for="respuesta">Respuesta:</label><bR>
            <input type="text" id="respuesta" name="respuesta" value="<%=respuestaC%>" style="width: 40%; height: 40px;"><br>
            <input type="hidden" name="numero_FAQ" value="<%=numero_FAQ%>">
            <div class="sumit">
            <input type="submit" name="cambiar" value="cambiar">
            </div>
        </form>
    <% if(request.getParameter("cambiar") != null) {
                String preguntaNueva = request.getParameter("pregunta");
                String respuestaNueva = request.getParameter("respuesta");
                try {
                    ps = con.prepareStatement("UPDATE FAQs SET PREGUNTA = ?, RESPUESTA = ? WHERE IDFAQ = ?");
                    ps.setString(1, preguntaNueva);
                    ps.setString(2, respuestaNueva);
                    ps.setString(3, numero_FAQ);
                    ps.executeUpdate();
                    response.sendRedirect(request.getContextPath() + "/EDITOR.jsp");
                } catch (SQLException error) {
                    out.println(error.toString());
                }
            }

    
                } else {
                     out.println("<script>alert('Ese reporte no existe');</script>");
                  }
              } catch (SQLException | ClassNotFoundException error) {
                  out.println(error.toString());
              } finally {
                  try { if (rs != null) rs.close(); } catch (SQLException e) {}
                  try { if (ps != null) ps.close(); } catch (SQLException e) {}
                  try { if (con != null) con.close(); } catch (SQLException e) {}
              }
              
            }
            %>
            <BR>
            <BR>
<h1>Eliminar FAQ</h1>  
<BR>
<form method="post" action="">
    <label for="numero_FAQ">Número de FAQ:</label>
    <input type="text" id="numero_FAQ" name="numero_FAQ">
    <input type="submit" name="eliminar" value="Eliminar">
</form>
        
<%
if(request.getParameter("eliminar") != null) {
    String numero_FAQ = request.getParameter("numero_FAQ");
    Connection con = null;
    PreparedStatement ps = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
        ps = con.prepareStatement("DELETE FROM FAQs WHERE IDFAQ = ?");
        ps.setString(1, numero_FAQ);
        int rows = ps.executeUpdate(); 
        if (rows > 0) {
             out.println("<script>alert('FAQ eliminado exitosamente');</script>");
        } else {
             out.println("<script>alert('No se puedo eliminar el FAQ');</script>");
        }
         response.sendRedirect(request.getContextPath() + "/EDITOR.jsp");
    } catch (SQLException | ClassNotFoundException error) {
        out.println(error.toString());
    } finally {
        try { if (ps != null) ps.close(); } catch (SQLException e) {}
        try { if (con != null) con.close(); } catch (SQLException e) {}
    }
}
%>

    <BR>
    <h1>FORO</h1>  
    <BR>
    <form method="post" action="FORO.jsp" target="_blank">
        <input type="submit" name="FORO" value="FORO">
    </form>


    </body>