<%--
    Document   : databaseEditor
    Created on : Aug 21, 2014, 4:37:06 PM
    Author     : nikola
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String dbAddress = "jdbc:mysql://localhost:3306/";
    String dbName = "TiralExtraction";
    String userName = "root";
    String pass = "";

    String jdbcDriver = "com.mysql.jdbc.Driver";
    Statement statement;

    Connection con;
    String isLoggedIn = (String)session.getAttribute("isLoggedIn");
    String role = (String)session.getAttribute("role");
    if(isLoggedIn.equals("true"))
    {
        String table = request.getParameter("table");//Arm or ArmProperty
        String type = request.getParameter("type"); //update, insert or delete
        if(table.equals("ArmProperty"))
        {
            String id = request.getParameter("id");
            if(type.equals("update")){
            String ArmId = request.getParameter("ArmId");
            String PropertyName = request.getParameter("PropertyName");
            String Value = request.getParameter("PropertyValue");
            String Unit = request.getParameter("PropertyUnit");
            Class.forName(jdbcDriver);
            con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
            String prest = "UPDATE ArmProperty SET PropertyName=?,Value=?,ValueUnit=? WHERE id=?";
            PreparedStatement preparedStatement = con.prepareStatement(prest);
            preparedStatement.setString(1, PropertyName);
            preparedStatement.setString(2, Value);
            preparedStatement.setString(3, Unit);
            preparedStatement.setString(4, id);
            preparedStatement.executeUpdate();
            }
            else
                if(type.equals("delete"))
                {
                    Class.forName(jdbcDriver);
                    con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
                    String prest = "DELETE FROM ArmProperty WHERE id=?";
                    PreparedStatement preparedStatement = con.prepareStatement(prest);
                    preparedStatement.setString(1, id);
                    preparedStatement.executeUpdate();
                }
            else
                    if(type.equals("insert"))
                    {
                    String ArmId = request.getParameter("ArmId");
                    String PropertyName = request.getParameter("PropertyName");
                    String Value = request.getParameter("PropertyValue");
                    String Unit = request.getParameter("PropertyUnit");
                    Class.forName(jdbcDriver);
                    con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
                    String prest = "INSERT INTO ArmProperty (ArmID,PropertyName,Value,ValueUnit) VALUES(?,?,?,?) ";
                    PreparedStatement preparedStatement = con.prepareStatement(prest);
                    preparedStatement.setString(1, ArmId);
                    preparedStatement.setString(2, PropertyName);
                    preparedStatement.setString(3, Value);
                    preparedStatement.setString(4, Unit);
                    preparedStatement.executeUpdate();
                    }
        }
        if(table.equals("Arm"))
        {
            if(type.equals("update")){
            String ArmId = request.getParameter("ArmId");
            String DocumentID = request.getParameter("DocumentID");
            String ArmName = request.getParameter("ArmName");
            Class.forName(jdbcDriver);
            con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
            String prest = "UPDATE ArmDetails SET ArmName=? WHERE id=?";
            PreparedStatement preparedStatement = con.prepareStatement(prest);
            preparedStatement.setString(1, ArmName);
            preparedStatement.setString(2, ArmId);
            preparedStatement.executeUpdate();
        }
            else
                if(type.equals("delete"))
                {
                    String ArmId = request.getParameter("ArmId");
                    Class.forName(jdbcDriver);
                    con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
                    String prest = "DELETE FROM ArmProperty WHERE ArmId=?";
                    PreparedStatement preparedStatement = con.prepareStatement(prest);
                    preparedStatement.setString(1, ArmId);
                    preparedStatement.executeUpdate();
                    prest = "DELETE FROM ArmDetails WHERE id=?";
                    preparedStatement = con.prepareStatement(prest);
                    preparedStatement.setString(1, ArmId);
                    preparedStatement.executeUpdate();
                }
             else
                    if(type.equals("insert"))
                    {
                    String DocumentID = request.getParameter("DocumentID");
                    String ArmName = request.getParameter("ArmName");
                    Class.forName(jdbcDriver);
                    con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
                    String prest = "INSERT INTO ArmDetails (ArmName,DocumentID) VALUES(?,?) ";
                    PreparedStatement preparedStatement = con.prepareStatement(prest);
                    preparedStatement.setString(1, ArmName);
                    preparedStatement.setString(2, DocumentID);
                    preparedStatement.executeUpdate();
                    }
        }
    }
    out.print("Done");
    out.flush();
    %>
</html>