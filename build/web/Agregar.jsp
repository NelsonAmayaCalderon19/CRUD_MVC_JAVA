<%-- 
    Document   : Agregar
    Created on : 13/01/2019, 05:52:17 PM
    Author     : NELSON
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Agregar</title>
        <style>
            h1{
                border-style: dotted;
                border-color:#ec971f;
            }
            
        </style>
    </head>
    <body>
        <div class="container">
          <h1>Agregar Registro</h1>
          <hr>
          <form action="" method="post" class="form-control" style="width: 500px; height: auto">
              <label>Nombre: </label>
              <input type="text" name="txtNombre" class="form-control"/><br>
              <label>Apellido: </label>
              <input type="text" name="txtApellido" class="form-control"/><br>
              <label>Cedula: </label>
              <input type="text" name="txtCedula" class="form-control"/><br>
              <input type="submit" name="guardar" value="Guardar" class="btn btn-primary btn-lg"/><br><br>
              <a href="index.jsp">Regresar-Cancelar</a>
                  
          </form>
        </div>
        
    </body>
</html>
<%
        //CONECTANDO A LA BASE DE DATOS
        Connection con;
        String url="jdbc:mysql://localhost/registro_persona_java";
        String Driver="org.gjt.mm.mysql.Driver";
        String user="root";
        String clave="";
        Class.forName(Driver);
        con=DriverManager.getConnection(url,user,clave);
        
        PreparedStatement ps;
        String nom, ape, ced;
        nom=request.getParameter("txtNombre");
        ape=request.getParameter("txtApellido");
        ced=request.getParameter("txtCedula");
        if(nom!=null && ape!=null && ced!=null){
            ps=con.prepareStatement("insert into persona(Nombre,Apellido,Cedula) values('"+nom+"','"+ape+"','"+ced+"')");
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        }
%>