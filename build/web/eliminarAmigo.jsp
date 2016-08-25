<%-- 
    Document   : agregarAmigos
    Created on : 3/12/2015, 08:31:20 PM
    Author     : Gerardo
--%>

<%@page import="red_social.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
     
    String id_amigo = request.getParameter("id_amigo");
    String id_usuario = (String)sesion.getAttribute("id_usuario");
   ConexionSQL conexion;
   String sql = "";

    conexion = new ConexionSQL();
    if(conexion.conecta() != 0)
    {
        System.out.println("Error al contectar!");
    }  else {
        sql = "DELETE FROM lista_amigos WHERE id_amigo="+id_amigo+" AND id_usuario="+id_usuario;
    }
    
    conexion.ejecuta(sql);
    
    conexion.cerrar();
    response.sendRedirect("misAmigos.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
