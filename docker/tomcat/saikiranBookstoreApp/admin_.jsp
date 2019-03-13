<%-- 
    Document   : admin
    Created on : 25 Nov, 2012, 6:12:25 PM
    Author     : chirag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SaiKiran BookStores</title>
        <jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

        <%@page import="java.sql.*, database.*" %>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>
        <script src="js/myScript.js"></script>
    </head>
    <body>
        
        
        <%
        if (session.getAttribute("user") == null ){// THen new user, show join now
            %>
            <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
        }
        %>

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <div class="container_16">
            <div class="grid_13 push_2" id="whiteBox" style="padding:10px 0px 10px 0px;">
                <h1 class="push_4" style="padding: 10px;" >Administrator Login</h1>    
                <hr/> <br/><div class="grid_9 push_2" style="padding:10px;">
                        <form method="post" action="admin_login">
                            <div class="grid_2">
                                Email
                            </div>
                            <div class="grid_5">
                                <input type="text" name="email" placeholder="xyz@xyz.com" />
                            </div>
                            <div class="clear"></div><br/>
                            
                            <div class="grid_2">
                                Password 
                            </div>
                            <div class="grid_5">
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/><br/> 
                                <input id="greenBtn" type="submit" value="Login"/>
                            </div>
                            <div class="clear"></div><br/>
                        </form>
                    </div>
                </div>
        </div>
    </body>
</html>
