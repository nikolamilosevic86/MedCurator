<%-- 
    Document   : login
    Created on : Jul 18, 2014, 4:28:50 PM
    Author     : nikola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="main.jsp" method="POST" style="margin-left:30px;maring-top:50px">
        Log in <br/>
        Email:<input name="email" type="email" id="id_email" placeholder="Enter your email"/><br/>
        Password:<input name="password" type="password" id="id_password" placeholder="Enter your password"/><br/>
        <input type="submit" value="Submit" /><br/>
               <a href="register.jsp">Register</a>
        </form>
 

    </body>
</html>
