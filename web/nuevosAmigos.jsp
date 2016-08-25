<%-- 
    Document   : nuevosAmigos
    Created on : 4/12/2015, 09:07:56 AM
    Author     : Gerardo
--%>

<%@page import="red_social.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
     
    String[] totalAmigos = request.getParameterValues("usuarios");
    String valores = "";
    int i = 0;
    while(i < totalAmigos.length - 1)
    {
        valores += "("+(String)sesion.getAttribute("id_usuario")+","+totalAmigos[i]+"),";
        i++;
    }
    
    valores += "("+(String)sesion.getAttribute("id_usuario")+","+totalAmigos[i]+")";
    
   ConexionSQL conexion;
   String sql = "";

    conexion = new ConexionSQL();
    if(conexion.conecta() != 0)
    {
        System.out.println("Error al contectar!");
    }  else {
        sql = "INSERT INTO lista_amigos(id_usuario,id_amigo) VALUES "+valores;
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
