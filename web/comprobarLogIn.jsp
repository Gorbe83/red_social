<%-- 
    Document   : comprobarLogIn
    Created on : 26/10/2015, 08:45:26 PM
    Author     : Gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="red_social.ConexionSQL" %>

<%
        ConexionSQL conexion = new ConexionSQL();
        String sql = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        ResultSet result = null;

        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");    
        }  else {
             sql = "SELECT id_usuario,concat(nombre, ' ',apellidos) as usuario, email FROM usuarios WHERE (email='"+email+"' and contrasenia=PASSWORD('"+password+"'));";
         } 

        result = conexion.consulta(sql);
        if (result.next())
        {
            result.beforeFirst();
            HttpSession sesion=request.getSession();
            while(result.next()) {
                sesion.setAttribute("id_usuario", result.getString("id_usuario"));
                sesion.setAttribute("usuario", result.getString("usuario"));
                sesion.setAttribute("email", result.getString("email"));
            }
            result.close();
            conexion.cerrar();

            response.sendRedirect("index.jsp");
        }
        else {
            response.sendRedirect("login.html");
        }
        
 %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
