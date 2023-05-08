<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<%
   // obtener los valores enviados desde el formulario HTML
   String id_Reporte = request.getParameter("id_Reporte");
   String estado = request.getParameter("estado");
   String solucion = request.getParameter("solucion");

   Connection conn = null;
   PreparedStatement statement = null;
   
   try {
      // establecer conexión a la base de datos
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");

      // crear la consulta para actualizar los valores en la tabla
      String query = "UPDATE REPORTES SET SOLUCION = ?, ESTADO = ?, FECHA = ?, HORA = ? WHERE IDREPORTE = ?";

      // preparar la consulta con los valores obtenidos del formulario y la fecha y hora actual
      statement = conn.prepareStatement(query);
      statement.setString(1, solucion);
      statement.setString(2, estado);
      statement.setDate(3, new java.sql.Date(new Date().getTime()));
      statement.setTime(4, new java.sql.Time(new Date().getTime()));
      statement.setString(5, id_Reporte);
      

      // ejecutar la consulta
      int filasActualizadas = statement.executeUpdate();

      // verificar si la actualización se realizó correctamente
      if(filasActualizadas > 0 ) {
         out.println("<h3>Los datos se han actualizado correctamente</h3>");
         
    
      } else {
         out.println("<h3>No se han actualizado los datos</h3>");

      }
   } catch(Exception e) {
      out.println("Error: " + e.getMessage());
   } finally {
      // cerrar la conexión a la base de datos y el statement
      try {
         if(statement != null) statement.close();
         if(conn != null) conn.close();
      } catch(Exception e) {
         out.println("Error al cerrar la conexión: " + e.getMessage());
      }
   }
%>


<a href="indexINGM.jsp"><button>CONFIRMAR</button></a>
