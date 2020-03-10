<%-- 
    Document   : Editar
    Created on : 13/01/2019, 05:45:32 PM
    Author     : NELSON
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Editar</title>
    </head>
    <body>
         <%
            //CONECTANDO A LA BASE DE DATOS
        Connection con;
        String url="jdbc:mysql://localhost/registro_persona_java";
        String Driver="org.gjt.mm.mysql.Driver";
        String user="root";
        String clave="";
        Class.forName(Driver);
        con=DriverManager.getConnection(url,user,clave);
        
        //EMPEZAMOS LISTANDO LOS DATOS DE LA TABLA PERSONA PERO DE LA FINA SELECCIONADA
        PreparedStatement ps;
        ResultSet rs;
        int id=Integer.parseInt(request.getParameter("id"));
        ps=con.prepareStatement("select * from persona where id="+id);
        rs=ps.executeQuery();
        while(rs.next()){
        
        
        %>
        <div class="container">
          <h1>Modificar Registro</h1>
          <hr>
          <form action="" method="post" class="form-control" style="width: 500px; height: auto">
              <label>ID: </label>
              <input type="text" readonly="" name="txtId" class="form-control" value="<%= rs.getInt("Id")%>"/><br>
              <label>Nombre: </label>
              <input type="text" name="txtNombre" class="form-control" value="<%= rs.getString("Nombre")%>"/><br>
              <label>Apellido: </label>
              <input type="text" name="txtApellido" class="form-control" value="<%= rs.getString("Apellido")%>"/><br>
              <label>Cedula: </label>
              <input type="text" name="txtCedula" class="form-control" value="<%= rs.getString("Cedula")%>"/><br>
              <input type="submit" name="guardar" value="Guardar" class="btn btn-primary btn-lg"/><br><br>
              <a href="index.jsp">Regresar-Cancelar</a>
                  
          </form>
          <%}
          %>
        </div>
    </body>
</html>
<%
String nom, ape, ced;
        nom=request.getParameter("txtNombre");
        ape=request.getParameter("txtApellido");
        ced=request.getParameter("txtCedula");
        if(nom!=null && ape!=null && ced!=null){
            ps=con.prepareStatement("update persona set Nombre='"+nom+"',Apellido='"+ape+"',Cedula='"+ced+"' where Id="+id);
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        }
%>