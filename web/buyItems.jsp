<%-- 
    Document   : buyItems
    Created on : 5 Nov, 2012, 12:23:58 PM
    Author     : chirag
--%>

<%@page import="user.user"%>
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
            .shippingAddress {
                background: #EEE; 
                padding: 10px; 
                border: 2px solid #CCC; 
                border-radius: 10px 0px 10px 0px;
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
        %>

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <%
            user User;
            String email=null;
           if ((session.getAttribute("user")==null)){
               //response.sendRedirect("index.jsp");
           }else {
               User = (user)session.getAttribute("user");
               email = User.getUserEmail();
        %>
        <div class="container_16">
            <div class="grid_16" id="whiteBox" style="padding: 10px;">
                <div class="grid_8">
                    <h1>Buy Items</h1> <br/>
                    <form method="post" action="buyItems">
                        <div class="grid_2">
                            Name
                        </div>
                        <div class="grid_5">
                            <input type="text" class="name"  name="name" />
                        </div>
                        <div class="clear"></div><br/>
                        <div class="grid_2">
                            Mobile No
                        </div>
                        <div class="grid_5">
                            <input type="text" class="mobile" maxlength="10" name="mobile" />
                        </div>
                        <div class="grid_2">
                            Address
                        </div>
                        <div class="grid_5">
                            <textarea class="address"  name="address"></textarea>    
                        </div>
                        <div class="grid_2">
                            City
                        </div>
                        <div class="grid_5">
                            <input  type="text" value="Mumbai" disabled/> We Do not accept any orders outside Mumbai
                        </div>
                        <div class="clear"></div><br/>
                        <div class="grid_5" >
                            <input  type="submit" id="greenBtn" value="Add Details"/>
                        </div>
                    </form>
                </div>
                <%
               if (User.getAddress() != null && User.getMobileNum() != null && User.getUserEmail() != null && User.getUsername() != null){
                   %>
                   <div class="grid_7 shippingAddress" id="useInfo">
                    <h1> <strong></strong>This is my Shipping Address</h1> <br/>
                        <div class="grid_1">
                            Name
                        </div>
                        <div class="grid_5">
                            <span id ="userName"><%= User.getUsername() %></span>
                        </div>
                        <div class="clear"></div>
                        <div class="grid_1">
                            Mobile
                        </div>
                        <div class="grid_5">
                            <span id ="mobile"><%= User.getMobileNum() %></span>
                        </div>
                        <div class="grid_1">
                            Address
                        </div>
                        <div class="grid_5">
                            <span id ="useAddress"><%= User.getAddress() %></span> 
                        </div>
                        <div class="clear"></div>
                    </div>
                   <script type="text/javascript" src="js/jquery.js"></script>
                   <script type="text/javascript">
                       $(document).ready(function (){
                           $('#useInfo').click(function (){
                           var userName = $('#userName').text();
                           var mobile = $('#mobile').text();
                           var address = $('#useAddress').text();
                           
                            //alert (userName +" "+mobile+" "+address);
                               $('.name').attr('value', userName);
                               $('.address').attr('value', address);
                               $('.mobile').attr('value', mobile);
                           });
                       });
                   </script>
        <%
               }else {
               %>
                    <a href="userinfo.jsp">
                        <div class="grid_7 shippingAddress">
                            <h1> <strong></strong>Add your Details for quick Checkout</h1>
                        </div>
                    </a>
                <%
               }
          }
         %>
            </div>
        </div>
    </body>
</html>
