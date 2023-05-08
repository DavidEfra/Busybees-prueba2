<body>        
<%@page import="java.sql.*" %>
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
                    out.println("<h1 align='center' style='font-size: 1.5em;'>Tabla FAQs</h1>");
                    out.println("<br>");    
                    out.println("<table border='1' table width='60%' align='center'>");  
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
</body>    