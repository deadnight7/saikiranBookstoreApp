<%-- 
    Document   : admin_manageProduct
    Author     : chirag
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SaiKiran BookStores</title>
    <link rel="shortcut icon" href="images/logo/ico.ico"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/text.css"/>
    <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
    <link rel="stylesheet" type="text/css" href="css/product.css"  />
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>

    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/myScript.js"></script>
    <style type="text/css">
        .imageGallery {
            width: 270px;
            margin: 11px;
            padding: 8px;
            border: 1px solid #CCC;
            text-align: center;
        }
        .alert {
            box-shadow: -20px 0px 0px #C00;
        }
    </style>
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
            <div class="grid_16" style="padding: 10px;" id="whiteBox">

                <br/>
                <h1 class="grid_15">Manage Product Information</h1><hr/>

            </div>
            <jsp:include page="includesPage/hesders_sidebars/admin_menuSideBar.jsp"></jsp:include>
                
        <%--
        SELECT * 
        FROM  `products` p
        INNER JOIN  `images` i
        USING (  `product-name` ) 
        WHERE p.`product_id` = 2
        --%>
        <%

            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            
            //Fetch the (PID) Product ID 
            String productId = request.getParameter("pid");
            if (request.getParameter("pid") == null || request.getParameter("pid") == "" || request.getParameter("pid") == "null") {

                String sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `product_qty` ASC ";
                Statement st1 = c.createStatement();
                ResultSet rs = st1.executeQuery(sqlFetchItems.toString());
%>
            <div id="middle"class="grid_13">
                 <div class="grid_13" id="whiteBox">
                     
                        <style>
                            p {
                                margin: 10px 0px;
                            }
                        </style>
                    <div class="ProductHeading">
                        <div class="grid_12">
                            <h1 class="grid_8">
                                    Choose a Product to <span class="blue">Edit</span>
                                </h1>
                            
                            <script type="text/javascript">
                                $(document).ready(function(){
                                    $('#sortBy').change(function (){
                                        var sortBy = $('#sortBy').attr('value');
                                        if (sortBy != ""){
                                            //alert(" "+$('#sortBy').attr('value'));
                                            $.get('admin_manageProduct_1.jsp', {sortBy : sortBy}, function (data){
                                                //alert(data);
                                                
                                                $('#productContent').fadeOut(200, function (){
                                                $('#productContent').html("");
                                                    $('#productContent').fadeIn(200);
                                                    $('#productContent').html(data);
                                                });
                                            });
                                        }
                                    });
                                });
                            </script>
                            <div class="grid_2">
                                <select id="sortBy" style="margin:  -2px;">
                                    <option value="qa">Sort By Quantity Low to High</option>
                                    <option  value="qd">Sort By Quantity High to Low</option>
                                    <option value="pa">Sort By Price Low to High</option>
                                    <option  value="pd">Sort By Price High to Low</option>
                                    <option  value="ha">Sort By Hits Low to High</option>
                                    <option  value="hd">Sort By Hits High to Low</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                     <div class="grid_12 productListing">
                        <div class="clear"></div>
                            <div id="productContent">
            <%
                while (rs.next()) {
                    /*
                     product-name	product_id	sub-category-name	category-name	company-name	price	summary	image-id	image-name*/
                    String product_id = rs.getString("product_id");

                    String product_name = rs.getString("product-name");

                    String sub_category_name = rs.getString("sub-category-name");

                    String category_name = rs.getString("category-name");

                    String company_name = rs.getString("company-name");

                    String price = rs.getString("price");

                    String summary = rs.getString("summary");

                    int qty = rs.getInt("product_qty");

                    String hits = rs.getString("hits");

                    String image_name = rs.getString("image-name");
                    /*
                     out.println("<br/>"+product_id+
                     "<br/>"+product_name+
                     "<br/>"+sub_category_name+
                     "<br/>"+category_name+
                     "<br/>"+company_name+
                     "<br/>"+price+
                     "<br/>"+summary+
                     "<br/>"+image_name);
                     */
                    String alert="";
                    if (qty<5){
                           alert = "alert";
                    }
        %>
        <div class="clear"></div>
        
        <div class="grid_13 <%= alert %>">
        <div class="grid_2">
            <a href="admin_manageProduct.jsp?pid=<%=product_id%>"><img src="<%= image_name%>" /></a>
        </div>
            <div class="grid_6">
                <p id="info"><a href="admin_manageProduct.jsp?pid=<%=product_id%>"><h3><span class="blue"> <%=product_name%></span></h3></a>By <%= company_name + " " + category_name%><br/><span class="red">Rs. <%= price%></span></p>
                <p style="display: inline;">Views <span class="blue"><%= hits %></span></p>
                
            </div>
            <div class="grid_4">
                <p><%=sub_category_name%></p>
                <div class="grid_3" style="display: inline;">
                    <h1 style="display: inline;"><%= qty %></h1> <a href="admin_manageProduct.jsp?pid=<%= product_id%>" id="greenBtn" style="display: inline;">Edit Product</a> 
                </div>
                <p>Quantity</p>
            </div>
        </div>
        <div class="clear"></div>
        <%
            }
        %>
                     </div>
                 </div>
               </div>
            </div>
        <%
        } else {
                
            String sqlFetchProductInfo = "SELECT * "
                    + "FROM  `products` p "
                    + "INNER JOIN  `images` i "
                    + "USING (  `product-name` ) "
                    + "WHERE p.`product_id` = '"+productId+"' ";
            
            String company = "", productName = "", searchTags = "",
                    category = "", subCategory = "",
                    quantity = "", price = "",
                    image_id, summary = "", imageName = "";


            ArrayList<String> productImages = new ArrayList<String>();
            ArrayList<String> productImagesId = new ArrayList<String>();
            productImages.clear();
            productImagesId.clear();

            ResultSet rs = st.executeQuery(sqlFetchProductInfo);

            while (rs.next()) {

                company = rs.getString("company-name");
                productName = rs.getString("product-name");
                searchTags = rs.getString("tags");
                category = rs.getString("category-name");
                subCategory = rs.getString("sub-category-name");
                quantity = rs.getString("product_qty");
                price = rs.getString("price");
                summary = rs.getString("summary");
                imageName = rs.getString("image-name");
                image_id = rs.getString("image-id");

                productImages.add(imageName);
                productImagesId.add(image_id);
            }
            
            session.setAttribute("productId", productId);
            session.setAttribute("productName", productName);
        %>

        <div class="grid_13"  style="padding: 10px 0px 10px 0px;" id="whiteBox">
            <h1 style="padding: 10px; text-align: center;" class="grid_12"><span class="blue"><%=company%></span> <%=productName%></h1><hr/>
            <form method="post" action="admin_changeProductInfo.jsp">
                <div class="grid_7">
                    <h3 style="padding: 10px; "><%=category%> > <%=subCategory%></h3>
                </div>
                <div class="grid_5">
                    <a href="admin_deleteProduct.jsp?pid=<%= productId%>" id="greenBtn">[x] Delete this Item</a>
                </div><!--
                <div class="grid_5">
                    <h3  style="padding: 10px; float: right;" class="red">Selling Meter : 956</h3>
                </div>-->
                <div class="clear"></div><br/>

                <div class="grid_13"  style="padding: 10px; ">
                    <div class="grid_2">
                        Search Tags
                    </div>
                    <div class="grid_5">
                        <textarea name="tags"><%=searchTags%></textarea>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        Product Name
                    </div>
                    <div class="grid_5">
                        <input type="text" name="productName" value="<%=productName%>"/>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        Product Quantity in Stock<%
                        session.setAttribute("quantity", quantity);
                        %>
                    </div>
                    <div class="grid_5">
                        <input type="text" name="quantity" value="<%=quantity%>" style="width: 75px;" disabled/><h1>+</h1>
                    </div>
                    <div class="clear"></div>
                    <div class="grid_2">
                        Add Product Quantity
                    </div>
                    <div class="grid_5">
                        <input type="text" name="addQuantity" value="0" style="width: 75px;"/>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        Product Price: Rs.
                    </div>
                    <div class="grid_5">
                        <input type="text" name="productPrice" value="<%=price%>">
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        Description / Summary
                    </div>
                    <div class="grid_5">
                        <textarea name="summary" cols="50" rows="20"><%= summary%></textarea>
                    </div>
                </div>

                <div class="grid_5">
                    <input type="submit" id="greenBtn" value="Save Changes" />
                </div>
            </form>
        </div>

        <style type="text/css">
            .enhance {
                width : 430px;
                -webkit-transition:.3s all ease-in-out;
                -moz-transition:.3s all ease-in-out;
            }
        </style>
        
        <script type="text/javascript">
            $(document).ready(function (){
                $('.imageGallery').css('opacity','0.4');
                $('.imageGallery').mouseover(function (){
                    //      fadeTo (speed, opacity, callback)
                    $(this).fadeTo(100,     1,      function (){
                        $('.imageGallery').not(this).fadeTo(100, 0.4);
                        $('.imageGallery').css('-webkit-transition','.3s all ease-in-out');
                        $('.imageGallery').css('-moz-transition','.3s all ease-in-out');
                    })
                });
                $('.imageGallery').mouseout(function (){
                    $('.imageGallery').css('opacity','0.4');
                });
            });         
        </script>
        <div class="grid_16" id="whiteBox">
            <br/>
            <h1 class="grid_7">Product Image Gallery <span class="red">Click to delete</span></h1>
            <div class="grid_5">
                <a href="productInsertImages.jsp?pid=<%= productId%>" id="greenBtn"> [+] Start Adding Images for this Item</a>
            </div><div class="clear"></div><br/>
            <hr/>

            <%
            if (productImagesId.size() == 1){
                //Dont delete the product Image
                //Deletion will result into void of join syntax 
                //which then lead to the No display of product from the list
            
    %>
            
                <img class="imageGallery" src="<%= productImages.get(0)%>"/>
            
            <%
                }else {
                            for (int i = 0; i < productImagesId.size(); i++) {
                        %>
                        <a href="admin_deleteImage.jsp?iid=<%= productImagesId.get(i)%>">
                            <img class="imageGallery" src="<%= productImages.get(i)%>"/>
                        </a>
                        <%
                        }
                
                    }
                }
            %>
            <%--
                <a href="deleteImage.jsp?id=1">
                    <img class="imageGallery" src="images/productImages/q1.jpeg"/>
                </a>
                <a href="deleteImage.jsp?id=1">
                    <img class="imageGallery" src="images/productImages/q2.jpeg"/>
                </a>
                <a href="deleteImage.jsp?id=1">
                    <img class="imageGallery" src="images/productImages/q3.jpeg"/>
                </a>

                <a href="deleteImage.jsp?id=1">
                    <img class="imageGallery" src="images/productImages/q1.jpeg"/>
                </a>
                <a href="deleteImage.jsp?id=1">
                    <img class="imageGallery" src="images/productImages/q3.jpeg"/>
                </a>
            --%>

        </div>
    </div>
</body>
</html>
