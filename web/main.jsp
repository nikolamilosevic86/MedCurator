<%-- 
    Document   : main
    Created on : Jul 18, 2014, 4:34:29 PM
    Author     : nikola
--%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="java.io.StringWriter"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="java.io.StringReader"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="Helpers.ClinicalArm" %>
<%@ page import ="Helpers.Weight" %>
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
    Class.forName(jdbcDriver);
    con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
    String prest = "SELECT * FROM Users  WHERE email=? AND password=?";
    PreparedStatement preparedStatement = con.prepareStatement(prest);
    preparedStatement.setString(1, email);
    preparedStatement.setString(2, password);
    ResultSet rs = preparedStatement.executeQuery();
    while (rs.next()) {
        session.setAttribute("email", rs.getString(1));
        session.setAttribute("affiliation", rs.getString(3));
        session.setAttribute("role", rs.getString(4));
        session.setAttribute("isLoggedIn", "true");
    }

    String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    if (isLoggedIn == null) {
        response.sendRedirect("login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medical curator - main</title>
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css">
    </head>
    <body>
        <div id ="topdiv">

        </div>
        <div id="leftmenu">
            <ul>
                <%                con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
                    prest = "SELECT * FROM DocumentDetails";
                    preparedStatement = con.prepareStatement(prest);
                    rs = preparedStatement.executeQuery();
                    LinkedList<String> ids = new LinkedList<String>();
                    LinkedList<String> PMCs = new LinkedList<String>();
                    while (rs.next()) {
                        ids.add(rs.getString(1));
                        PMCs.add(rs.getString(2));
                }
                for (int i = 0; i < ids.size(); i += 1) {%>

                <li><a href="?docid=<%=ids.get(i)%>">PMC<%=PMCs.get(i)%></a></li>

                <% }
                %>
            </ul>
        </div>
        <%
            String PMC = "";
            String Title = "";
            String Authors = "";
            String Abstract = "";
            String LongAbstract = "";
            String URL = "";
            String XML = "";

            if (docid != null && !docid.equals("")) {
                Class.forName(jdbcDriver);
                con = DriverManager.getConnection(dbAddress + dbName, userName, pass);
                prest = "SELECT * FROM DocumentDetails  WHERE id=?";
                preparedStatement = con.prepareStatement(prest);
                preparedStatement.setString(1, docid);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    PMC = rs.getString(2);
                    Title = rs.getString(3);
                    Authors = rs.getString(4);
                    Abstract = rs.getString(5);
                    LongAbstract = rs.getString(6);
                    URL = rs.getString(7);
                    XML = rs.getString(8);

                }
            }
            LinkedList<ClinicalArm> arms = new LinkedList<ClinicalArm>();
            prest = "SELECT * FROM ArmDetails  WHERE DocumentID=?";
            preparedStatement = con.prepareStatement(prest);
            preparedStatement.setString(1, docid);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                ClinicalArm ca = new ClinicalArm();
                int arm_id = rs.getInt(1);
                ca.setArmName(rs.getString(2));
                ca.setNoPatients(rs.getInt(3));
                ca.setNoMale(rs.getInt(4));
                ca.setNoFemale(rs.getInt(5));
                String query2 = "SELECT * FROM WeightDetails  WHERE ArmID=?";
                PreparedStatement preparedStatement2 = con.prepareStatement(query2);
                preparedStatement2.setString(1, arm_id + "");
                ResultSet rs2 = preparedStatement2.executeQuery();
                while (rs2.next()) {
                    Weight w = new Weight();
                    w.setWeightCategory(rs2.getString(3));
                    w.setWeightValue(rs2.getString(4));
                    w.setWeightUnit(rs2.getString(5));
                    ca.weights.add(w);
                }

                arms.add(ca);
            }

        %>
        <div id="main">
            <ul>
                <li><b>DocID:</b> <%=docid%></li>
                <li><b>Title:</b> <%=Title%></li>
                <li><b>Authors:</b> <%=Authors%></li>
                <li><b>PMC:</b> PMC<%=PMC%></li>
                <li><b>Abstract:</b> <%=Abstract%></li>
                <li><b>Long Abstract:</b> <%=LongAbstract%></li>
                <li><b>URL:</b> <a href="<%=URL%>" target="_blank"><%=URL%></a></li>
                <li><b>Clinical arms:</b></li>
                <ul>
                    <% for (int i = 0; i < arms.size(); i++) {
                    %>
                    <li><%=arms.get(i).getArmName()%></li>
                    <ul>
                        <li><b>Patients:</b> <%=arms.get(i).getNoPatients()%></li>
                        <li><b>Number of Male:</b> <%=arms.get(i).getNoMale()%></li>
                        <li><b>Number of Female:</b> <%=arms.get(i).getNoFemale()%></li>
                            <% for (int j = 0; j < arms.get(i).weights.size(); j++) {
                            %>
                        <li><b><%=arms.get(i).weights.get(j).getWeightCategory()%>:</b>
                            <%=arms.get(i).weights.get(j).getWeightValue()%>  <%=arms.get(i).weights.get(j).getWeightUnit()%>
                        </li>
                        <%
                             }%>
                    </ul>
                    <%
                        }%>
                </ul>
            </ul>

        </div>
        <%
            NodeList tablesxml = null;
            String tables = "";
            if (!XML.equals("")) {
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                factory.setNamespaceAware(true);
                factory.setValidating(false);
                DocumentBuilder builder = factory.newDocumentBuilder();
                InputSource is = new InputSource(new StringReader(XML));
                Document parse = builder.parse(is);
                tablesxml = parse.getElementsByTagName("table-wrap");
                for (int i = 0; i < tablesxml.getLength(); i++) {
                    StringWriter sw = new StringWriter();
                    Transformer serializer = TransformerFactory.newInstance().newTransformer();
                    serializer.transform(new DOMSource(tablesxml.item(i)), new StreamResult(sw));
                    tables += sw.toString() + "<br/>";
                }
            }
        %>
        <div id="document">
            <%=tables%>
        </div>

    </body>

</html>
