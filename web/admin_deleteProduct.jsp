<%-- 
    Document   : admin_deleteProduct
    Author     : chirag
--%>
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
        
        if (session.getAttribute("admin")== null){
            response.sendRedirect("admin_.jsp");
        }
        %>

        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <div class="container_16">
            <% 
             if (session.getAttribute("productId") != null   && session.getAttribute("productName") != null ){
                String productId = request.getParameter("pid");

                session.getAttribute("productId");
                session.getAttribute("productName");
                 if (request.getParameter("del") != null){
                     //DELETE THE PRODUCT OR SHOW ERROR IN SQL
                     /*
DELETE FROM `products` WHERE `product_id` = 9;# 1 row affected.

DELETE FROM `images` WHERE `product-name` = 'Assasssins Book';# 1 row affected.

 * 
                     */
                     String sqlDeleteProduct = "DELETE FROM `products` WHERE `product_id` = '"+session.getAttribute("productId")+"';";
                     String sqlDeleteProductImgs = "DELETE FROM `images` WHERE `product-name` = '"+session.getAttribute("productName")+"';";
                     Connection c = new DB_Conn().getConnection();
                     Statement st = c.createStatement();
                     st.addBatch(sqlDeleteProduct);
                     st.addBatch(sqlDeleteProductImgs);
                     st.executeBatch();
                     
         %>
                    <div class="grid_16" style="padding: 10px;" id="whiteBox">

                        <br/>
                        <h1 class="grid_15" style="text-align: center;">Product Deleted</h1><hr/>

                                <div class="grid_13 push_3">
                                    <div class="grid_5">
                                        <a href="admin_manageProduct.jsp" id="buy">Manage Products</a>
                                    </div>
                                </div>
                    </div>
                    <%
                 }else {
                     %>
                    <div class="grid_16" style="padding: 10px;" id="whiteBox">

                        <br/>
                        <h1 class="grid_15" style="text-align: center;">Are you sure, Do you want to delete the product<br/><br/><span class="blue">Product Name</span> : <%= session.getAttribute("productName")%><br/> and all the respective images?</h1><hr/>

                        <div class="grid_13 push_1">
                            <div class="grid_5">
                                <a href="admin_deleteProduct.jsp?pid=<%= session.getAttribute("productId")  %>&del=y" id="buy">Yes Delete it Right Away</a>
                            </div>
                            <div class="grid_5">
                                <a href="admin_manageProduct.jsp?pid=<%= session.getAttribute("productId")  %>" id="buy">No, Cancel Deletion</a>
                            </div>
                        </div>
                    </div>
                    <%
                 }
             }else {
                response.sendRedirect("admin_manageProduct.jsp");
             }
            %>
            
        </div>
        
    </body>
</html>
