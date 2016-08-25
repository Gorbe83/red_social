<%-- 
    Document   : guarda-usuario
    Created on : 30/11/2015, 06:52:36 PM
    Author     : Gerardo
--%>

<%@page import="red_social.Usuario"%>
<%@page import="red_social.Sistema"%>

<jsp:useBean id="usuario" scope="session" class="red_social.Usuario">
    <jsp:setProperty name="usuario" property="nombre" />
    <jsp:setProperty name="usuario" property="apellidos" />
    <jsp:setProperty name="usuario" property="email" />
    <jsp:setProperty name="usuario" property="contrasenia" />
    <jsp:setProperty name="usuario" property="fech_nac" />
    <jsp:setProperty name="usuario" property="genero" />
</jsp:useBean>

<% 
    String nombre = usuario.getNombre();
    String apellidos = usuario.getApellidos();
    String email = usuario.getEmail();
    String contrasenia = usuario.getContrasenia();
    String fech_nac = usuario.getFech_nac();
    String genero = usuario.getGenero();
    
    usuario.agregarUsuario(nombre, apellidos, email, contrasenia, genero, fech_nac);
    Sistema sistema = new Sistema();
    sistema.mandarMensaje(usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Alta de usuario</title>
    </head>
    <body>
        <h1><%=usuario.resultado%></h1>
        <h2><%=sistema.resultado%></h2>
    </body>
</html>
