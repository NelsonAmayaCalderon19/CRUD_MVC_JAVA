<%-- 
    Document   : index
    Created on : 13/01/2019, 05:18:05 PM
    Author     : NELSON
--%>

<%@page import="java.sql.*"%>
<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Principal</title>
        <style>
            th{
                background-color:chartreuse; 
            }
            header{
                <%--background-color:red;--%>
                width: 100%;
                height: 50px;
                background: #DD6255;
                color: white;
                padding-top: 0;
            }
            header label{
                padding: 1px;
            }
            .container{
                width: 80%;
            }
            
            .form{
                
                padding-left: 800px;
            }
     
        </style>
    </head>
    <body>
        <header><br>
            <label style="font-size:25px">Usuarios</label>
        </header>
        <%
            //CONECTANDO A LA BASE DE DATOS
        Connection con;
        String url="jdbc:mysql://localhost/registro_persona_java";
        String Driver="org.gjt.mm.mysql.Driver";
        String user="root";
        String clave="";
        Class.forName(Driver);
        con=DriverManager.getConnection(url,user,clave);
        
        //EMPEZAMOS LISTANDO LOS DATOS DE LA TABLA PERSONA
        PreparedStatement ps;
        ResultSet rs;
        ps=con.prepareStatement("select * from persona");
        rs=ps.executeQuery();
        %>
        <div class="container buscar">
            <h1>Lista de Registrados</h1>
            <hr>
            <a class="btn btn-success btn-lg" href="Agregar.jsp">Nuevo Usuario</a>
            <form class="form">
                <input class="form-control" type="text" name="txtbuscar">
                <input class="btn btn " type="submit" value="Buscar">
                       
            </form>
            <%
            String nombuscar=request.getParameter("txtbuscar");
            if(nombuscar!=null){
        
        ps=con.prepareStatement("select * from persona where Cedula LIKE"+"'%"+nombuscar+"%'");
        rs=ps.executeQuery();
                
            }else {
             ps=con.prepareStatement("select * from persona where Cedula LIKE"+"'%"+"%'");
        rs=ps.executeQuery();   
            }
            %>
        </div>
            <br>
            <br>
            <div class="container">
            <table class="table-bordered" width="100%" height="100%"  border="3">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Apellido</th>
                    <th class="text-center">Cedula</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("Id")%></td>
                    <td class="text-center"><%= rs.getString("Nombre")%></td>
                    <td class="text-center"><%= rs.getString("Apellido")%></td>
                    <td class="text-center"><%= rs.getString("Cedula")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Eliminar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
            <script src="js/jquery.js" type="text/javascript"></script>
            <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
