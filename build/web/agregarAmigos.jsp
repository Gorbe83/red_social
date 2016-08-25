<%-- 
    Document   : agregarAmigos
    Created on : 3/12/2015, 08:31:20 PM
    Author     : Gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="red_social.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession sesion=request.getSession(); 
    String usuario = (String)sesion.getAttribute("usuario"); 
    String id_usuario = (String)sesion.getAttribute("id_usuario");
    String email = (String)sesion.getAttribute("email");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EngiCom</title>
        
        <!-- css -->
    <link href="css/base.min.css" rel="stylesheet">

    <!-- css for this project -->
    <link href="css/project.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">
    
    <link rel="stylesheet" href="css/styles.css">

    <style>
        .avatar_noticia {
            width: 48px;
            height: 48px;
            border-radius: 24px;
        }
    </style>
    <!-- favicon -->
    <!-- ... -->

    <!-- ie -->
            <!--[if lt IE 9]>
                    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>
    <body class="avoid-fout page-brand">
        <header class="header header-transparent header-waterfall">
            <ul class="nav nav-list pull-left">
                    <li>
                            <a data-toggle="menu" href="#menu">
                                    <span class="icon icon-lg">menu</span>
                            </a>
                    </li>
            </ul>
            <div class="header-affix-hide pull-left" data-offset-top="108" data-spy="affix">
                    <a class="header-logo margin-left-no" href="index.jsp">Menú</a>
            </div>
            <ul class="nav nav-list pull-right">
                    <li>
                            <a data-toggle="menu" href="#profile">
                                    <span class="access-hide"><%=usuario%></span>
                                    <span class="avatar"><img alt="avatar" src="images/avatar-001.jpg"></span>
                            </a>
                    </li>
            </ul>
    </header>
        <nav aria-hidden="true" class="menu" id="menu" tabindex="-1">
            <div class="menu-scroll">
                    <div class="menu-content">
                            <a class="menu-logo" href="index.jsp">EngiCom</a>
                            <ul class="nav">
                                    <li>
                                            <a class="waves-attach" href="index.jsp">Inicio</a>
                                    </li>
                                    <li>
                                            <a class="waves-attach" href="misNoticias.jsp">Mis noticias</a>
                                    </li>
                                    <li>
                                            <a class="waves-attach" href="misAmigos.jsp">Mis amigos</a>
                                    </li>
                                    <li>
                                            <a class="waves-attach" href="agregarAmigos.jsp">Agregar amigos</a>
                                    </li>
                            </ul>
                    </div>
            </div>
    </nav>
    <nav aria-hidden="true" class="menu menu-right" id="profile" tabindex="-1">
            <div class="menu-scroll">
                    <div class="menu-top">
                            <div class="menu-top-img">
                                    <img alt="image" src="images/landscape.jpg">
                            </div>
                            <div class="menu-top-info">
                                    <a class="menu-top-user" href="javascript:void(0)"><span class="avatar pull-left"><img alt="image" src="images/avatar-001.jpg"></span><%=usuario%></a>
                            </div>
                    </div>
                    <div class="menu-content">
                            <ul class="nav">
                                    <li>
                                            <a class="waves-attach" href="javascript:void(0)"><span class="icon icon-lg">account_box</span>Mi cuenta</a>
                                    </li>
                                    <li>
                                            <a class="waves-attach" href="javascript:void(0)"><span class="icon icon-lg">settings</span>Configuración</a>
                                    </li>
                                    <li>
                                            <a class="waves-attach" href="cerrarSesion.jsp"><span class="icon icon-lg">exit_to_app</span>Cerrar sesión</a>
                                    </li>
                            </ul>
                    </div>
            </div>
    </nav>
    <div class="content">
        <div class="content-heading" style="background-image: none;">
                    <div class="container">
                            <h1 class="heading">EngiCom</h1>
                    </div>
            </div>
            <div class="container">
                <div class="row">
                    <h3 class="header">Añadir amigos</h3>
                </div>
                <div class="row">
                    <%
                        ConexionSQL conexion = new ConexionSQL();
                        ResultSet result;
                        String sql = "";
                        
                        if(conexion.conecta() != 0)
                        {
                            System.out.print("Error al conectar!");
                        }
                        else {
                            sql = "SELECT u.id_usuario,concat(u.nombre, ' ', u.apellidos) as usuario FROM usuarios u WHERE u.id_usuario NOT IN(SELECT la.id_amigo FROM usuarios u, lista_amigos la WHERE u.id_usuario=la.id_amigo AND la.id_usuario="+id_usuario+") and u.id_usuario<>"+id_usuario;
                        }
                        
                        result = conexion.consulta(sql);
                        if (result.next()) 
                        {
                            result.beforeFirst();
                            %>
                            <form class="form" action="nuevosAmigos.jsp" method="post">
                                 <div class="form-group">
                            <%
                            while(result.next())
                            {
                                %>
                                <div class="checkbox checkbox-adv">
                                    <label for="usuario<%=result.getString("u.id_usuario")%>">
                                        <input class="access-hide" type="checkbox" id="usuario<%=result.getString("u.id_usuario")%>" name="usuarios" value="<%=result.getString("u.id_usuario")%>"><%=result.getString("usuario")%>
                                        <span class="circle"></span><span class="circle-check"></span><span class="circle-icon icon">done</span>
                                    </label>
                                </div>
                                <%
                            }
                            %> 
                                 </div>
                                  <div class="form-group-btn">
                                    <button class="btn btn-brand waves-attach waves-button waves-light" type="submit">Agregar amigos</button>
                                </div>
                            </form> <%
                        }
                        else{
                            out.print("<p>No hay amigos por añadir</p>");
                        }
                        result.close();
                            conexion.cerrar();%>
                </div>
            </div>
    </div>
                    <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/base.min.js"></script>
    
    <!-- js for this project -->
    <script src="js/project.min.js"></script>
    
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
    </body>
</html>