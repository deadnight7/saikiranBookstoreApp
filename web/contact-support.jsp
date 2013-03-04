<%-- 
    Document   : contact-support
    Created on : 14 Dec, 2012, 12:38:53 AM
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
        
        <style type="text/css">
            .adminMenu {
                margin-top: 10px;
                margin-bottom: 10px;
                margin-right: 0px;
                background: #FFF;
                box-shadow: 0px 0px 10px #333;
            }
            .adminMain {
                margin-top: 10px;
                margin-bottom: 10px;
                background: #FFF;
                box-shadow: 0px -1px 10px #333;
            }
            #leftside {
                cursor: pointer;
            }
            .error {
                color:#FFF;
                background: #CC0000;
                box-shadow: 0px 0px 10px #CC0000;
            }
            
            .error:active {
                color:#FFF;
                background: #CC0000;
                box-shadow: 0px 0px 10px #CC0000;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function (){
                
                var usrname = $('#usrname');
                
                usrname.keyup(function (){
                    if (!isNaN(usrname.attr ('value'))){
                        usrname.addClass('error');
                    }else {
                        usrname.removeClass('error');
                    }
                });
                
                //usrname.addClass('error')
        });
        </script>
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
            <div id="whiteBox" style="padding: 10px;">
                <br/>
                <h1>Contact Us</h1>
                <hr/>
            </div>
        </div>
        
        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="padding: 10px;">
             
                <div class="grid_7 push_1">
                    <div class="grid_5" id="whiteBox" style="margin: 15px;">
                <div class="grid_5">
                    
                    <div class="grid_3 ">
                        Saikiran BookStores
                    </div>
                    <div class="clear ">
                    </div>
                    <div class="grid_1">
                        Email:
                    </div>
                    <div class="grid_3">
                        support@sai_books.com
                    </div>
                    <div class="grid_1">
                        Address:
                    </div>
                    <div class="grid_3">
                        B-3/Shop No 18, Silver Park, Mira Bhyendar Road, Mira Road East
                    </div>
                    <div class="grid_1">
                        Mobile:
                    </div>
                    <div class="grid_3">
                        +91-9004300630
                    </div>
                </div>
            </div>
                    <img src="images/textures/linen.png" style="width: 388px;
height: 218px;
margin: 38px 0px;"/>
                     
                </div>
            </div>
        </div>
    </body>
</html>
