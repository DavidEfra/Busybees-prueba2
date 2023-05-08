<%@ page import="java.sql.*" %>

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
                    out.println("<td width='10%'>asignado</td>");
                    out.println("</tr>");   
                    
                    String consulta = "SELECT * FROM REPORTES WHERE PERFIL = '" + USER + "'";
                     resultadito = comandito.executeQuery(consulta);
                    resultadito.next();
                do{
                    
                    String reporte = resultadito.getString("IDREPORTE");
                    String usuario = resultadito.getString("IDUSUARIO");
                    String descripcion = resultadito.getString("DESCRIPCION");
                    String solucion = resultadito.getString("SOLUCION");
                    Date fecha = resultadito.getDate("FECHA");
                    Time hora = resultadito.getTime("HORA");
                    String estado = resultadito.getString("ESTADO");
                    String asignado = resultadito.getString("PERFIL");
                    
                    out.println("<tr>");
                    out.println("<td width='5%' align='center'>" + reporte + "</td>    ");
                    out.println("<td width='5%'>" + usuario + "</td>"); 
                    out.println("<td width='30%'>" + descripcion + "</td>");
                    out.println("<td width='30%'>" + solucion + "</td>");
                    out.println("<td width='10%'>" + fecha + "</td>");
                    out.println("<td width='10%'>" + hora + "</td>");
                    out.println("<td width='10%'>" + estado + "</td>");
                    out.println("<td width='10%'>" + asignado + "</td>");
                    out.println("</tr>");
                    
                }
                while(resultadito.next());
                    out.println("<table border='1'>");
                                    
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
        
        
            <h1>Ingeniero de Soporte </h1>
        <h3> (cambio de estado y solucion de reporte)</h3>
	<form method="post" action="cambiar_estado.jsp">
            <label for="id_Reporte"    >ID del reporte:</label>
		<input type="text" name="id_Reporte" id="id_Reporte" required><br><br>
                <label for="solucion" class="sol" >Solucion:</label>
		<textarea name="solucion" id="solucion" required></textarea><br><br>
                <label for="estado" class="est" id="estado">Estado:</label>
		<select name="estado">
			<option value="SOLUCIONADO">SOLUCIONADO</option>
			<option value="CERRADO">CERRADO</option>
		</select><br><br>
		<input type="submit" value="Cambiar estado y solucion">
	</form>
