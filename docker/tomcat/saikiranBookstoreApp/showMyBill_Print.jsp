<%-- 
    Document   : showMyBill
    Created on : 21 Nov, 2012, 10:13:42 PM
    Author     : chirag
--%>
<%@page import="java.util.ArrayList"%>
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

            #whiteBox input , textarea{
                width:90px;
                position: relative;
                color:#000;
                border-color:#696969;
                outline: none;
                border-radius:7px 0px 7px 0px;
                padding:5px;
                background: -webkit-linear-gradient(top, #EEE,#FFF);
                background: -moz-linear-gradient(top, #EEE,#FFF);
                box-shadow:0px 0px 3px  #000;
                -webkit-transition: .7s all ease-in-out;
            }

            #whiteBox input :focus{
                color:#000;
                border-color:#696969;
                outline: none;
                background: -webkit-linear-gradient(top, #FFF,#EEE);
                background: -moz-linear-gradient(top, #FFF,#EEE);
                font-family:'Droid';
                box-shadow:0px 0px 7px  #000;
                -webkit-transition: .7s all ease-in-out;
            }

            #whiteBox  textarea:focus{
                color:#000;
                border-color:#696969;
                outline: none;
                background: -webkit-linear-gradient(top, #FFF,#EEE);
                background: -moz-linear-gradient(top, #FFF,#EEE);
                font-family:'Droid';
                box-shadow:0px 0px 7px  #000;
                -webkit-transition: .7s all ease-in-out;

            }
            #whiteBox textarea{
                font-family:'Droid';
            }
            #whiteBox {
                padding-top: 10px;
                padding-bottom: 10px;
                padding: 10px;
            }
            #status {
                margin: 17px;
                padding: 7px;
                font-size: 17px;
                text-align: center;
                box-shadow: 0px 0px 10px #999;
            }
        </style>
    </head>
    <body>
        <%--
 <div id = "" style="background: #AAA; padding: 10px; box-shadow: 0px 10px 10px #555;">
     <div class="container_16"  style="background: #AAA; ">
         <div class="grid_16">
             <div id="" class="grid_5 push_1" style="font-size: 17px; padding: 15px;">
                 <a href="index.jsp">
                     <img style="margin-left: 33px" src="images/logo/icon.png" />
                     SaiKiran BookStores
                 </a>
             </div>
             <div class="grid_8">
                 
                 <p style="text-align: left; color: black; text-shadow: none;" >Contact:
                 +91 9004300647</p> 
                 <p style="text-align: left; color: black; text-shadow: none;" >Address:
                 <br/>B-3/, Shop No 18,
                 Silver Park,
                 Mira Bhyendar Road, 
                 Mira Road East,
                 Mumbai</p> 
                 
             </div>
         </div>
     </div>
 </div>
        --%> 
        <div id = "topWrapper" style="box-shadow: 0px 10px 10px #555;">
            <div class="container_16">
                <div class="grid_16">
                    <div id="logo" class="grid_6"> <a href="index.jsp"><img src="images/logo/icon.png" /></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container_16">
            <!--
            <div class="grid_3" id="whiteBox">
                <h1 style="text-align: center;">Enter an Order Number</h1>
                <hr/><br/> 
                <form>
                    <input style="float: right; width: 130px" type="text" placeholder="Order Number Here..." required/>
                    <input type="submit" value="Show invoice"/>
                </form>
           </div>-->

            <%
                if (request.getParameter("oid") != null) {

                    String OrderId = request.getParameter("oid");
                    String fetchInfoSQL = "SELECT * FROM  `order` WHERE  `order_id` =  '" + OrderId + "' ; ";
                    Connection c = new DB_Conn().getConnection();
                    Statement st = c.createStatement();
                    ResultSet rs1 = st.executeQuery(fetchInfoSQL);
                    while (rs1.next()) {
                        String name,
                                email, address, mobileNum, status;
                        Date ordered_on_date;
                        Time ordered_on_time;

                        name = rs1.getString("shippers_name");
                        email = rs1.getString("shippers_email");
                        address = rs1.getString("address");
                        mobileNum = rs1.getString("mobile_number");
                        ordered_on_date = rs1.getDate("ordered_On");
                        ordered_on_time = rs1.getTime("ordered_On");
                        status = rs1.getString("status");
            %>
            <div class="grid_12 push_2" id="whiteBox" style="margin-top: 30px;">
                <div class="grid_6">
                    <div class="grid_2">
                        To ;
                    </div>
                    <div class="clear">
                    </div>
                    <div class="grid_2">
                        Name :
                    </div>
                    <div class="grid_3">
                        <%= name%>
                    </div>
                    <div class="grid_2">
                        Email:
                    </div>
                    <div class="grid_3">
                        <%= email%>
                    </div>
                    <div class="grid_2">
                        Address:
                    </div>
                    <div class="grid_3">
                        <%= address%>
                    </div>
                    <div class="grid_2">
                        Mobile:
                    </div>
                    <div class="grid_3">
                        <%= mobileNum%>
                    </div>
                    <div class="grid_2">
                        Ordered On:
                    </div>
                    <div class="grid_3">
                        <%= ordered_on_date + ":" + ordered_on_time%>
                    </div>
                </div>
            <div class="grid_5" id="whiteBox" style="margin-top: 30px;">
                <div class="grid_5">
                    <div class="grid_1">
                        From;
                    </div>
                    <div class="grid_3">
                        Saikiran BookStores
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
            </div>
            <%
                }
            %>
            <div id="whiteBox" class="grid_12 push_2">
                <div id="CartTable" style="padding:10px 00px" class="grid_12">
                    <div class="grid_1">
                        <h3>Order No</h3>
                    </div> 
                    <div class="grid_7">
                        <h3 class="push_3">Order Summary</h3> 
                        <div class="clear"></div>
                        <div class="grid_4">
                            Item 
                        </div>
                        <div class="grid_2">
                            Price x Quantity
                        </div>
                    </div>
                    <div class="grid_3 ">
                        <h3>Total Value</h3>
                    </div>

                    <div class="clear"></div>

                    <%
                        /*
                         SELECT  `sales_id` ,  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` 
                         FROM  `order` o
                         INNER JOIN  `sales` s
                         USING (  `order_id` ) 
                         WHERE o.`user_id` =4
                         * 
                         */
                        String sql = "SELECT  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` "
                                + " FROM  `order` o "
                                + " INNER JOIN  `sales` s "
                                + " USING (  `order_id` ) "
                                + " WHERE o.`order_id` = " + OrderId + " "
                                + " ORDER BY `order_id` DESC ";



                        PreparedStatement psmt =
                                c.prepareStatement(sql);

                        ResultSet rs = psmt.executeQuery();

                        int oldOrder = 0;
                        int newOrder;

                        String product_name;
                        double product_price;
                        int product_quantity;
                        Date sold_on_date;
                        Time sold_on_time;
                        double totalPrice = 0;
                        double totalValue = 0;
                        while (rs.next()) {
                            newOrder = rs.getInt("order_id");
                            product_name = rs.getString("product_name");
                            product_price = rs.getDouble("product_price");
                            product_quantity = rs.getInt("product_quantity");
                            sold_on_time = rs.getTime("sold_on");
                            sold_on_date = rs.getDate("sold_on");
                            String orderDateArr[] = sold_on_date.toString().split("-");
                            totalValue = product_quantity * product_price;
                            totalPrice += totalValue;
                            String billNo = "";
                            for (int i = orderDateArr.length - 1; i >= 1; i--) {
                                billNo += orderDateArr[i];
                            }
                            billNo += newOrder;
                            if (oldOrder == newOrder) {
                            // Dont Draw border Type II order Div
%>

                    <!-- Type II Order -->
                    <div class="grid_12">
                        <div class="push_1">
                            <div class="grid_7">
                                <div class="grid_4 ">
                                    <a href="product.jsp?id="></a>
                                    <%= product_name%>
                                </div>
                                <div class="grid_2">
                                    Rs. <%= product_price%> x<%= product_quantity%>
                                </div>
                            </div>
                            <div class="grid_3">
                                <%= totalValue%> 
                            </div>
                        </div>
                    </div>

                    <%
                                            } else {
                                                // Draw New Order Type I order Div
%>

                    <!-- Type I Order -->
                    <div class="grid_12">
                        <div  class="grid_1">
                            <a class="blue" href="showMyBill.jsp?oid=<%= newOrder%>"><%= billNo%></a>
                        </div>
                        <div class="grid_7">
                            <div class="grid_4 ">
                                <%= product_name%> 
                            </div>
                            <div class="grid_2">
                                Rs. <%= product_price%> x<%= product_quantity%>
                            </div>
                        </div>
                        <div class="grid_3">
                            <%= totalValue%> 
                        </div>
                    </div>
                    <div class="clear"></div>

                    <%
                            }
                            oldOrder = newOrder;
                        }

                        totalPrice = Math.ceil(totalPrice);
                    %>

                    <!-- Type I Order -->
                    <div class="clear"></div><br/>
                    <div class="grid_12">
                        <hr class="grid_11"/>
                        <div class="grid_4">
                            Total Order Price
                        </div>
                        <div class="grid_4 push_4">
                            <h1>Rs. <%= totalPrice%></h1> 
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <%
        } else {
        %>
        <div class="container_16">
            <div class="grid_12 push_2" id="whiteBox">
                <br/><h1>No Product Invoice to Print</h1><hr/><br/>
            </div>
        </div>
        <%            }
        %>

        
    </body>
</html>
