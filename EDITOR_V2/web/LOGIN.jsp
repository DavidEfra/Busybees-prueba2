<%@page import="java.sql.*" %>
<html>
    <head>
        <title>Generar Reporte a FAQ</title>
        <style>
            body {
                background-color: #f2f2f2;
            }
           
            form {
                display: flex;
                font-size: 16px;
                font-weight: bold;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                margin: 0 auto;
                max-width: 500px;
              }

              label {
                font-weight: 600;
                margin-bottom: 5px;
                font-size: 20px;
                font-weight: bold;
              }
              

              input[type="text"], input[type="password"], input[type="submit"] {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                margin-bottom: 10px;
                width: 100%;
                font-size: 16px;
                font-weight: bold;
                box-sizing: border-box;
                text-align: center;
              }
                     
             
              input[type="submit"] {
                background-color: #F7A44C;
                color: white;
                transition: all 0.3s ease;
              }

              input[type="submit"]:hover {
                background-color: #F7664C;
                cursor: pointer;
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
        
        <form method="post">
           
            <br>
            <label for="PERFIL">PERFIL</label>
            <input type="text" id="PERFIL" name="PERFIL"><br>
            <label for="Contraseña">CONTRASEÑA</label>
            <input type="text" id="Contraseña" name="Contraseña"><br>
            <input type="submit" name="submit" value="Iniciar sesion">
            <br>
            <br>
        </form>

        <% 
            if (request.getParameter("PERFIL") != null && !request.getParameter("PERFIL").isEmpty()
                && request.getParameter("Contraseña") != null && !request.getParameter("Contraseña").isEmpty()) {

                String PERFIL = request.getParameter("PERFIL");
                String Contraseña = request.getParameter("Contraseña");

                Connection conectadito = null;
                Statement comandito = null;
                ResultSet resultadito = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conectadito = DriverManager.getConnection("jdbc:mysql://localhost:3306/REPORTES?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                    comandito = conectadito.createStatement();

                    PreparedStatement ps = conectadito.prepareStatement("SELECT * FROM PERFILES WHERE IDPERFIL = ?");
                    ps.setString(1, PERFIL);
                    resultadito = ps.executeQuery();

                    while (resultadito.next()) {
                        String PERFIL_DB = resultadito.getString("IDPERFIL");
                        String CONTRASEÑA_DB = resultadito.getString("CONTRASEÑA");

                       
                       if(PERFIL_DB.equalsIgnoreCase("asistente") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("ASISTENTE.jsp");
            }
                        else if(PERFIL_DB.equalsIgnoreCase("editor") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                           response.sendRedirect("EDITOR.jsp");
                        }   
                        else if(PERFIL_DB.equalsIgnoreCase("gerenteS") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("Gerente_Soporte.jsp");
                        }
                        else if(PERFIL_DB.equalsIgnoreCase("gerenteM") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("todos.jsp");
                        }
                        //aqui empiezan Ingenieros
                        else if(PERFIL_DB.equalsIgnoreCase("ingenieroS1") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("index.jsp");
                        }
                        else if(PERFIL_DB.equalsIgnoreCase("ingenieroM1") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("indexINGM.jsp");
                        }
                        else if(PERFIL_DB.equalsIgnoreCase("ingenieroS2") && CONTRASEÑA_DB.equals(Contraseña)) {
                        session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("index.jsp");
                        }
                        else if(PERFIL_DB.equalsIgnoreCase("ingenieroM2") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("indexINGM.jsp");
                        }else if(PERFIL_DB.equalsIgnoreCase("ingenieroS3") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("index.jsp");
                        }
                        else if(PERFIL_DB.equalsIgnoreCase("ingenieroM3") && CONTRASEÑA_DB.equals(Contraseña)) {
                            session.setAttribute("PERFIL", PERFIL_DB);
                            response.sendRedirect("indexINGM.jsp");
                        }
                        

                       
                    }   
                }
                catch(SQLException error){
                    out.println(error.toString());
                }

            } else {
              ;
            }
            %>
            
    </body>
</html>
