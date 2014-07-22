<%-- 
    Document   : register
    Created on : Jul 18, 2014, 4:29:25 PM
    Author     : nikola
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String dbAddress = "jdbc:mysql://localhost:3306/";
    String dbName = "TiralExtraction";
    String userName = "root";
    String pass = "";

    String jdbcDriver = "com.mysql.jdbc.Driver";
    Statement statement;

    Connection con;
    String docid = request.getParameter("docid");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String password2 = request.getParameter("password2");
    String affiliation = request.getParameter("affiliation");
    String role = "user";
    if(password == null || !password.equals(password2) || password.length()<5)
    {
         
    }else{
    Class.forName(jdbcDriver);
    con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
    String prest = "INSERT INTO Users (email, password, affilliation,user_role ) VALUES (?, ?, ?,?)";
    PreparedStatement preparedStatement = con.prepareStatement(prest);
    preparedStatement.setString(1, email);
    preparedStatement.setString(2, password);
    preparedStatement.setString(3, affiliation);
    preparedStatement.setString(4, role);
    preparedStatement.executeUpdate();
    
    session.setAttribute("email", email);
    session.setAttribute("affiliation", affiliation);
    session.setAttribute("role", role);
    session.setAttribute("isLoggedIn", "true");
    response.sendRedirect("main.jsp");

    String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    if (isLoggedIn == null) {
        response.sendRedirect("login.jsp");
    }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
                <form action="register.jsp" method="POST" style="margin-left:30px;maring-top:50px">
        Register <br/>
        Email:<input name="email" type="email" id="id_email" placeholder="Enter your email"/><br/>
        Password:<input name="password" type="password" id="id_password" placeholder="Enter your password"/><br/>
        Confirm password:<input name="password2" type="password" id="id_password2" placeholder="Confirm your password"/><br/>
        Affiliation:<input name="affiliation" type="text" id="id_affiliation" placeholder="Institution you are working with"/><br/>
       
        <input type="submit" value="Submit" />
        <br/><a href="login.jsp">Login</a>
        </form>
    </body>
</html>
