<%--
    Document   : bandejaMensajes
    Created on : 25/10/2015, 11:10:36 AM
    Author     : Gerardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    HttpSession sesion=request.getSession();
    sesion.invalidate();
    response.sendRedirect("login.html");
%>

<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        
    </body>
</html>
