<%-- 
    Document   : Eliminar
    Created on : 13/01/2019, 05:45:48 PM
    Author     : NELSON
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
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
       
        int id=Integer.parseInt(request.getParameter("id"));
        ps=con.prepareStatement("delete from persona where id="+id);
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
        
        
        
        %>
    </body>
</html>
