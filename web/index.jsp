<%-- 
    Document   : index
    Created on : 3/12/2015, 06:55:40 PM
    Author     : Gerardo
--%>

<%@page import="red_social.Comentarios"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="red_social.ConexionSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

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
                    <div class="col-lg-8 col-md-10">
                        <form class="form" action="nuevaNoticia.jsp" method="post">
                            <textarea class="form-control" rows="3" name="noticia" placeholder="¿Qué estás pensando?" required></textarea>
                            <br>
                            <button class="btn btn-brand waves-attach waves-button waves-light waves-effect" type="submit">Enviar noticia</button>
                        </form>
                    </div>
                </div>
               <%
               ConexionSQL conexion = new ConexionSQL();
               ResultSet result = null;
               String sql = "";
                //Obtener id's de amigos que yo agregue y agregarlos a un string separados por coma
                String contactos = "";
                
               if(conexion.conecta() != 0)
                {
                    System.out.println("Error al contectar!");
                }  else {
                sql = "SELECT id_amigo FROM lista_amigos WHERE id_usuario="+id_usuario;
               }
               
                result = conexion.consulta(sql);
                if (result.next()) 
                {
                    result.beforeFirst();
                    while(result.next())
                    {
                        contactos += result.getString("id_amigo")+",";
                    }
                }
                result.close();
                
                if(!"".equals(contactos))
                {
                    String misContactos = contactos.substring(0, contactos.length()-1);
                
                    //Obtener comentarios de las noticias
                    List<Comentarios> comentarios = new ArrayList<Comentarios>();
                    sql = "SELECT c.id_noticia,concat(u.nombre, ' ',u.apellidos) as usuario,c.comentario,c.fecha FROM usuarios u, comentarios_noticias c WHERE u.id_usuario=c.id_autor_com and id_noticia IN(SELECT id_noticia FROM noticias n, usuarios u WHERE n.id_autor=u.id_usuario AND n.id_autor IN ("+misContactos+")) ORDER BY id_noticia";
                    result = conexion.consulta(sql);
                    if (result.next()) 
                    {
                        result.beforeFirst();
                        while(result.next())
                        {
                            comentarios.add(new Comentarios(result.getString("id_noticia"),result.getString("usuario"),result.getString("comentario"),result.getString("fecha")));
                        }
                        result.close();
                    }
                    
                    //Buscar noticias por amigos que yo agregue
                    sql = "SELECT id_noticia,id_autor,concat(u.nombre, ' ',u. apellidos) as usuario,noticia,fecha FROM noticias n, usuarios u WHERE n.id_autor=u.id_usuario AND n.id_autor IN ("+misContactos+") ORDER BY fecha DESC;";                     
                    
                    result = conexion.consulta(sql);
                    String sqlComentario = "";
                    if (result.next()) 
                    {
                        result.beforeFirst();
                        int i = 0;
                        while(result.next())
                        {
                            i = 0;
                            %>
                                <div class="card-wrap">
                                        <div class="row">
                                                <div class="col-lg-3 col-md-10 col-sm-6">
                                                        <div class="card">
                                                                <div class="card-main">
                                                                        <div class="card-inner">
                                                                                <div class="card-heading">
                                                                                    <div class="demo-blog minilogo"><img src="images/avatar-001.jpg" class="avatar_noticia"/>
                                                                                        <strong>&nbsp;&nbsp;<%=result.getString("usuario")%></strong>
                                                                                            <span>&nbsp;&nbsp;<%=result.getString("fecha")%></span>
                                                                                    </div>
                                                                                </div>
                                                                                <p>
                                                                                       <%=result.getString("noticia")%>.
                                                                                </p>
                                                                        </div>
                                                                        <div class="card-action">
                                                                            <form class="form" name="forma<%=result.getString("id_noticia")%>" action="comentarNoticia.jsp" method="post">
                                                                                 <div class="card-action-btn">
                                                                                    <textarea class="form-control" name="comentario" rows="1" required placeholder="Comenta"></textarea>
                                                                                 </div>
                                                                                <div class="card-action-btn pull-right">
                                                                                    <a class="fbtn fbtn-brand waves-attach waves-circle waves-light waves-effect" onclick="javascript:document.forms['forma<%=result.getString("id_noticia")%>'].submit();"><span class="icon">check</span></a>
                                                                                </div>
                                                                                <input type="hidden" name="id_noticia" value="<%=result.getString("id_noticia")%>">
                                                                            </form>
                                                                                <%
                                                                                while(i < comentarios.size()) {
                                                                                    if(result.getString("id_noticia").equals(comentarios.get(i).getId_noticia())) {
                                                                                        %>
                                                                                            <br><br>
                                                                                            <p><%=comentarios.get(i).getAutor()%> dijo: <%=comentarios.get(i).getComentario()%></p>
                                                                                        <%
                                                                                        comentarios.remove(i);
                                                                                    }
                                                                                    else
                                                                                        i++;
                                                                                }
                                                                                %>

                                                                        </div>
                                                                        
                                                                </div> 
                                                                
                                                        </div>
                                                        
                                                </div>
                                                
                                        </div>
                                        
                                </div>
                          <%
                           }
                        }
                    else {
                        %><p>No hay noticias actualmente</p><%
                    }
        }
        else {
            %><p>No hay noticias actualmente</p><%
        }
                
                result.close();
                conexion.cerrar();
        %>
        </div>   
        <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/base.min.js"></script>
    
    <!-- js for this project -->
    <script src="js/project.min.js"></script>
    
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
    </body>
</html>
