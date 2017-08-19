<%-- 
    Document   : addToCart
    Author     : chirag
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SaiKiran BookStores - Cart</title>
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/myScript.js"></script>

        <style type="text/css">
            #loginBtn {
                margin:15px auto;
                padding:5px;
                color:#000;
                text-shadow: 0 1px 0 white;
                border-radius:5px;
                background: -webkit-linear-gradient(top, #aee800, #8fbe00);
                background: -moz-linear-gradient(top, #aee800, #8fbe00);
                text-align:center;
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);
                -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);
                -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);

            }
            #loginBtn:hover {
                color:#000;
                border-radius:7px;
                text-shadow: 0 -1px 0 white;
                text-align:center;
                background: -webkit-linear-gradient(top, #8fbe00,#aee800);
                background: -moz-linear-gradient(top, #8fbe00,#aee800);
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4);
                cursor:pointer;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="cart" scope="session" class="cart.cart"/>

        <%
            if (session.getAttribute("user") == null) {// THen new user, show join now
%>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        %>

        <%@include file="includesPage/_search_navigationbar.jsp" %>

        <%@include file="includesPage/_facebookJoin.jsp" %>

        <div class="container_16">
            <div class="grid_16" id="whiteBox">
                <div class="grid_8 push_3" >
                    <h1 class="push_2" style="padding:10px 00px">Products In your Cart</h1>

                    <%
                        user User = new user();
                        session.getAttribute("user");
                        //out.println(session.getAttribute("user"));
                        User = (user) session.getAttribute("user");
                        if (session.getAttribute("user") == null) {
                    %>
                    <h3 class="showForm" id="loginBtn" style="padding:10px 00px">Please Login before buying...</h3>

                    <%                } else {
                        //out.println("login by " + User.getUserEmail());

                    %>
                    <h3 class="push_2" >Your Cart contains following...</h3>


                    <%
                    
                            out.println("<br/>Total value price of the cart " + cart.getTotalPriceOfCart());
                            ArrayList<String> productNames = new ArrayList();
                            ArrayList<Double> productPrices = new ArrayList();
                            ArrayList<Integer> Qty = new ArrayList();
                            ArrayList<Integer> ids = new ArrayList();

                            productNames = cart.getProductNames();
                            productPrices = cart.getPrices();
                            Qty = cart.getQty();
                            ids = cart.getId();
                    %>


                    <div id="CartTable" style="padding:10px 00px" class="grid_11">
                        <div class="grid_5">
                            <h2>Name Of Product</h2> 
                        </div>
                        <div class="grid_2">
                            <h2>Price</h2>
                        </div>
                        <div class="grid_2">
                            <h2>Quantity</h2>
                        </div>

                        <%
                            for (int i = 0; i < productNames.size(); i++) {
                        %>

                        <div class="grid_5">
                            <%=productNames.get(i)%>
                        </div>
                        <div class="grid_2">
                            Rs. <%=productPrices.get(i)%>
                        </div>
                        <div class="grid_1">
                            x<%=Qty.get(i)%>
                        </div>
                        <div class="grid_2">
                            Rs. <%= Qty.get(i) * productPrices.get(i)%>
                        </div>

                        <%
                            }
                            productNames.clear();
                            productPrices.clear();

                        %>
                        <br/>

                        <div class="grid_5">
                            <strong>Total Price of your Cart</strong>
                        </div>

                        <div class="grid_3 push_3">
                            Rs <%= Math.ceil(cart.getTotalPriceOfCart()) %>
                        </div>
                        <div class="clear"></div>

                        <br/>
                        <br/>
                        <a href="buyItems.jsp">
                            <div class="grid_3" id="greenBtn">
                                Buy These Items
                            </div>
                        </a>
                        <a href="viewProducts_.jsp">
                            <div class="grid_3" id="greenBtn">
                                Continue Shopping
                            </div>
                        </a>
                    </div>

                    <br/>
                    <br/>
                    
                    
                    <br/>
                    <%
                            }
                    %>
                </div>

            </div>
        </div>
    </body>
</html>
