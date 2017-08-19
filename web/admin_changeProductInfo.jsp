<%-- 
    Document   : admin_changeProductInfo
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
            if (session.getAttribute("user") == null) {// THen new user, show join now
%>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        
        if (session.getAttribute("admin")== null){
            response.sendRedirect("admin_.jsp");
        }
        %>
        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>
        <div class="container_16">
            <% String tags = request.getParameter("tags");
                String productName = request.getParameter("productName");
                String s_quantity = (String)session.getAttribute("quantity");
                String s_addQuantity = request.getParameter("addQuantity");
                String s_productPrice = request.getParameter("productPrice");
                String summary = request.getParameter("summary");

                int quantity, addQuantity, totalQuantity; 
                double productPrice;

                if (session.getAttribute("productId") != null && session.getAttribute("productName") != null) {
                    
                    if (request.getParameter("del") != null) {
                        //String productId = request.getParameter("pid");
                        session.getAttribute("productId");
                        session.getAttribute("productName");
                        int pid = Integer.parseInt((String)session.getAttribute("productId"));
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                        addQuantity = Integer.parseInt(request.getParameter("addQuantity"));
                        productPrice = Double.parseDouble(request.getParameter("price"));
                        totalQuantity = quantity+addQuantity;
                        summary = request.getParameter("summary");
                        tags = request.getParameter("tags");
                        
                        /*
UPDATE  `products` SET  `product-name` =  'XPS Seriator v2',
 `price` =  '865.77',
 `tags` =  'XPS Seriator Mobile Phone',
 `product_qty` =  '5',
 `lastUpdated` = NOW( ) ,
 `summary` =  'qwert yuio p' WHERE  `products`.`product_id` =10
                        
  INSERT INTO  `saikiran enterprises`.`expenses` (
 `expenses_id` ,
    `product_id` ,
    `product_name` ,
    `price` ,
    `purchase_date`
    )
    VALUES (
    NULL ,  '123',  'ghth',  '456', NOW( )
    );
                        */
                        //UPDATE THE PRODUCT OR SHOW ERROR IN SQL
                     
                        String sqlUpdateProduct =  " UPDATE  `products` "
                        +" SET  `product-name` =  '"+productName+"',"
                        +" `price` =  '"+productPrice+"',"
                        +" `tags` =  '"+tags+"',"
                        +" `product_qty` =  '"+totalQuantity+"',"
                        +" `lastUpdated` = NOW( ) ,"
                        +" `summary` =  '"+summary+"' WHERE  `products`.`product_id` ="+pid+" ";
                        double expenses_d = productPrice * addQuantity;
                        int expenses = (int)expenses_d;
                        String sqlUpdateExpenses = "INSERT INTO  `saikiran enterprises`.`expenses` ("
+"  `expenses_id` , "
 +"   `product_id` ,"
 +"   `product_name` , "
  +"  `price` , "
   +" `purchase_date` "
 +"   ) "
 +"   VALUES ( "
 +"   NULL ,  '"+pid+"',  '"+productName+"',  '"+expenses+"', NOW( ) )";
                        
                        Connection c = new DB_Conn().getConnection();
                        Statement st = c.createStatement();
                        st.executeUpdate(sqlUpdateExpenses) ;
                        st.executeUpdate(sqlUpdateProduct);
                        //out.print (sqlUpdateExpenses+" "+sqlUpdateProduct);
                        

            %>
            <div class="grid_16" style="padding: 10px;" id="whiteBox">

                <br/>
                <h1 class="grid_15" style="text-align: center;">Product information Updated</h1><hr/>

                <div class="grid_13 push_3">
                    <div class="grid_5">
                        <a href="admin_manageProduct.jsp" id="buy">Manage Products</a>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="grid_16" style="padding: 10px;" id="whiteBox">

                
                <%
                    try {
                        
                        quantity = Integer.parseInt(s_quantity);
                        addQuantity = Integer.parseInt(s_addQuantity);
                        productPrice = Double.parseDouble(s_productPrice);
                        totalQuantity = quantity+addQuantity;
                        if (totalQuantity <= 0  || productPrice <= 0){
                            %>
                
                                        <br/>
                                        <h1 class="grid_15" style="text-align: center;">Product cannot be updated because the quantity is less than zero<br/><br/><span class="blue">Product Name</span> : <%= session.getAttribute("productName")%></h1><hr/>

                                        <div class="grid_13 push_1">
                                            <div class="grid_7">
                                                <a href="admin_manageProduct.jsp?pid=<%= session.getAttribute("productId")%>" id="buy">Cancel Updating</a>
                                            </div>
                                        </div>

                                        <div class="clear"></div>
                                        <hr/>

                <%
                       }else {

                        %>
                        
                        <form action="admin_changeProductInfo.jsp" method="post">
                        <input type="hidden" name="tags" value="<%= tags %>"/>
                        <input type="hidden" name="productName" value="<%= productName %>"/>
                        <input type="hidden" name="summary" value="<%= summary %>"/>
                        <input type="hidden" name="quantity" value="<%= s_quantity %>"/>
                        <input type="hidden" name="addQuantity" value="<%= s_addQuantity %>"/>
                        <input type="hidden" name="price" value="<%= productPrice %>"/>
                        <input type="hidden" name="del" value="y"/>
                        
                                        <br/>
                                        <h1 class="grid_15" style="text-align: center;">Are you sure, Do you want to update the product<br/><br/><span class="blue">Product Name</span> : <%= session.getAttribute("productName")%></h1><hr/>

                                        <div class="grid_13 push_1">
                                            <div class="grid_5">
                                                <input type="submit" id="buy" style="border-color: #FFF; width: 190px;" value="Update Product"/>
                                            </div>
                                            <div class="grid_6">
                                                <a href="admin_manageProduct.jsp?pid=<%= session.getAttribute("productId")%>" id="buy">No, Cancel Updating</a>
                                            </div>
                                        </div>
                                </form>
                                        <div class="clear"></div>
                                        <hr/>
                                        <div class="grid_10 push_3">
                                            <div class="grid_2">
                                                Search Tags
                                            </div>
                                            <div class="grid_5">
                                                <%= tags %>
                                            </div>
                                            <div class="clear"></div><br/>
                                            <div class="grid_2">
                                                Product Name
                                            </div>
                                            <div class="grid_5">
                                                <%= productName %>
                                            </div>
                                            <div class="clear"></div><br/>
                                            <div class="grid_2">
                                                Product Quantity in Stock
                                            </div>
                                            <div class="grid_5">
                                                <%= quantity %> <br/><h1>+</h1>
                                            </div>
                                            <div class="clear"></div>
                                            <div class="grid_2">
                                                Added Product Quantity
                                            </div>
                                            <div class="grid_5">
                                                <%= addQuantity %>
                                            </div>
                                            <div class="clear"></div><br/>
                                            <div class="grid_2">
                                                Product Price: Rs.
                                            </div>
                                            <div class="grid_5">
                                                <%= productPrice %>
                                            </div>
                                            <div class="clear"></div><br/>
                                            <div class="grid_2">
                                                Description / Summary
                                            </div>
                                            <div class="grid_5">
                                                <%= summary %>
                                            </div>
                                        <%
                       
                       }
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("admin_manageProduct.jsp?pid=" + session.getAttribute("productId"));
                    }

                %>
            </div>
        </div>
        <%
                }
            } else {
                response.sendRedirect("admin_manageProduct.jsp");
            }
        %>

    </div>

</body>
</html>
