<%-- 
    Document   : agregarAmigos
    Created on : 3/12/2015, 08:31:20 PM
    Author     : Gerardo
--%>

<%@page import="red_social.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
     
    String id_noticia = request.getParameter("id_noticia");
    String id_autor = (String)sesion.getAttribute("id_usuario");
    String comentario = request.getParameter("comentario");
   ConexionSQL conexion;
   String sql = "";

    conexion = new ConexionSQL();
    if(conexion.conecta() != 0)
    {
        System.out.println("Error al contectar!");
    }  else {
        sql = "INSERT INTO comentarios_noticias(id_noticia,id_autor_com,comentario,fecha) VALUES ('"+id_noticia+"','"+id_autor+"','"+comentario+"',CURDATE())";
    }
    
    conexion.ejecuta(sql);
    conexion.cerrar();
    response.sendRedirect("index.jsp");
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
