<%-- 
    Document   : admin_performance
    Created on : 22 Nov, 2012, 10:20:00 PM
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
            .highlight {
                box-shadow: inset -10px 0px 10px #666;
                background: #E0E0E0;
                border-radius: 0px 27px 27px 0px;
            }
            
            .blueButton {
                background: -webkit-linear-gradient(top,#00AAC9, #026A84);
            }
            
            
            #buy {
                padding: 30px;
                font-size: 17px;
                -webkit-transition:.3s all ease-in-out;
                -moz-transition:.3s all ease-in-out;
            }
            #buy:hover {
                padding: 30px;
                font-size: 17px;
                box-shadow: inset 0px 2px 17px #444;
            }
            /*
            #buy {
                padding: 30px;
                font-size: 17px;
                box-shadow: 0px 2px 7px #444;
                -webkit-transition:.3s all ease-in-out;
                -moz-transition:.3s all ease-in-out;
                background: -webkit-linear-gradient(top,#00AAC9, #026A84);
                background: -moz-linear-gradient(top,#00AAC9, #026A84);
            }
            #buy:active {
                padding: 30px;
                font-size: 17px;
                box-shadow: 0px 2px 7px #444;
                -webkit-box-shadow: inset 0 0 10px #000;
                -moz-box-shadow: inset 0 0 5px #000;
                background: -webkit-linear-gradient(top, #026A84,#00AAC9);
                background: -moz-linear-gradient(top, #026A84,#00AAC9);
            }
            #buy:hover {
                padding: 30px;
                font-size: 17px;
                box-shadow: inset 0px 2px 17px #444;
                background: -webkit-linear-gradient(top, #026A84,#00AAC9);
                background: -moz-linear-gradient(top, #026A84,#00AAC9);
            
            }*/
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
        </style>
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
        
        if (session.getAttribute("admin")== null){
            response.sendRedirect("admin_.jsp");
        }
        %>

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <div class="container_16">
            <div class="grid_16" style="padding: 10px;" id="whiteBox">
                    <div class="grid_3">
                        <br/><h1>Add Product</h1>
                    </div>
                <div>
                        
                <div class="grid_3">
                        <br/><h1>Step 1. Enter Product Company</h1><hr/>
                    </div>
                <div class="grid_3">
                        <br/><h1>Step 2. Enter Category</h1><hr/>
                    </div>
                <div class="grid_3">
                        <br/><h1>Step 3. Enter in Product Name, Tags</h1><hr/>
                    </div>
                <div class="grid_3">
                        <br/><h1>Step 4. Enter in Pricing & Quantity and Description</h1><hr/>
                    </div>
                
                    </div>
                </div>
                <div class="clear"></div>
                <jsp:include page="includesPage/hesders_sidebars/admin_menuSideBar.jsp"></jsp:include>
                
                
                
                <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                    <div class="grid_13">
                        <br/><h1>4 Step Process for Adding Products...</h1><hr/>
                    </div>
                    
                    <div class="grid_7">
                        <a style="
border: 1px solid black;
box-shadow: 0px 2px 10px #333;" href="admin_addProduct_1.jsp" class="grid_5 push_2" id="buy">Start Adding Products right Now...!</a>
                    </div>
                </div>
                    
        </div>
        
    </body>
</html> 
