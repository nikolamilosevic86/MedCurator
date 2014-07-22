<%-- 
    Document   : index
    Created on : Jul 18, 2014, 4:20:17 PM
    Author     : nikola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  
  <head data-gwd-animation-mode="quickMode">
    <title>Medical curator</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="generator" content="Google Web Designer 1.0.6.0428">
    <style type="text/css">
      html, body {
        width: 100%;
        height: 100%;
        margin: 0px;
      }
      .gwd-body {
        background-color: transparent;
        -webkit-transform-style: preserve-3d;
        -webkit-transform: perspective(1400px) matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
      }
      .gwd-div-0ig7 {
        position: absolute;
        width: 504px;
        height: 82px;
        left: 442px;
        top: 67px;
        font-size: 45px;
        color: rgb(0, 0, 139);
        border-image-source: none;
        border-color: rgb(26, 137, 233);
        -webkit-transform: translate3d(272px, 83px, 0px);
        -webkit-transform-style: preserve-3d;
      }
      .gwd-img-oxe6 {
        font-size: 45px;
        border-image-source: none;
        border-color: rgb(26, 137, 233);
        -webkit-transform: translate3d(-1px, 0px, 0px);
        -webkit-transform-style: preserve-3d;
      }
      .gwd-span-v84a {
        font-family: Georgia;
      }
      .gwd-div-6xlp {
        position: absolute;
        background-image: none;
        background-color: rgb(213, 215, 254);
        border-top-left-radius: 25px;
        border-top-right-radius: 25px;
        border-bottom-right-radius: 25px;
        border-bottom-left-radius: 25px;
        left: 714px;
        top: 270px;
        width: 450px;
        height: 350px;
      }
    </style>
  </head>
  
  <body class="gwd-body">
    <img src="img/0-doctor.jpg" class="gwd-img-yoab gwd-img-oxe6" width="100%">
    <div class="gwd-div-6xlp">
        <form action="main.jsp" method="POST" style="margin-left:30px;maring-top:50px">
        Log in <br/>
        Email:<input name="email" type="email" id="id_email" placeholder="Enter your email"/><br/>
        Password:<input name="password" type="password" id="id_password" placeholder="Enter your email"/><br/>
        <input type="submit" value="Submit" />
        </form>
    </div>
    <div class="gwd-div-0ig7 editable editable editable"><span class="gwd-span-hl80">Medical curator</span>

    </div>
  </body>

</html>
