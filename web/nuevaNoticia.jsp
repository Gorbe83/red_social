<%-- 
    Document   : agregarAmigos
    Created on : 3/12/2015, 08:31:20 PM
    Author     : Gerardo
--%>

<%@page import="red_social.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
     
    String noticia = request.getParameter("noticia");
    String id_autor = (String)sesion.getAttribute("id_usuario");
   ConexionSQL conexion;
   String sql = "";

    conexion = new ConexionSQL();
    if(conexion.conecta() != 0)
    {
        System.out.println("Error al contectar!");
    }  else {
        sql = "INSERT INTO noticias(id_autor,noticia,fecha) VALUES ('"+id_autor+"','"+noticia+"',CURDATE())";
    }
    
    conexion.ejecuta(sql);
    conexion.cerrar();
    response.sendRedirect("misNoticias.jsp");
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
