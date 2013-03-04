<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>

<%@page import="java.sql.*, database.*" %>
<%
    DB_Conn conn = new DB_Conn();
    Connection con = conn.getConnection();
    Statement st = con.createStatement();
    String sql_getCategory = "SELECT  `category_name` FROM  `category`;";
    String sql_getSubCategory = "SELECT  `sub-category_name` FROM  `sub-category`;";
    String sql_getCompany = "SELECT  `company-name` FROM  `product-company`;";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SaiKiran BookStores</title>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <%@include file="includesPage/_stylesheets.jsp" %>
        <!--
                <link rel="stylesheet" type="text/css" href="css/forms/button.css"/>
        -->
        <link rel="stylesheet" type="text/css" href="css/styles.css"  />

        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>
        <script type="text/javascript" src="js/myScript.js"/></script>
        <script type="text/javascript" src="js/product.js"/></script>

</head>
<body>

    <%
        if (session.getAttribute("email") == null) {%> 


    <%@include file="includesPage/_joinNow.jsp" %>
    <%//@include file="includesPage/_topLogin.jsp" %>

    <%    } else {
    %>

    <%@include file="includesPage/_logout.jsp" %>

    <%        }
    %>

    <%@include file="includesPage/_search_navigationbar.jsp" %>

    <%@include file="includesPage/_facebookJoin.jsp" %>

    <div class="container_16">
        <div class="grid_16" id="productStrip">
            <div class="grid_16">
                <h1 class="bold underlined center" style="font-size:35px; margin:20px auto;" >Add Product</h1>
            </div>
            <div class="grid_13">
                <form method="GET" action="addProduct">
                    <div class="grid_10">
                        <div class="grid_9">
                            <p style="font-size:15px;">Start entering the product information step by step... Into your database</p>
                            <table class="stepTable">
                                <tr>
                                    <td colspan="2"><h1>Step 1. Enter Product Company</h1></td>
                                </tr>
                                <%//Retrieves The Data From product-company table%>
                                <tr>
                                    <td><h4>Select a Company</h4> <br/> <h3 class="center">Or</h3><br/></td>
                                    <td><img src= "images/icons/dropDown.png" alt="dropDown"/>
                                        <select name="company">

                                            <%
                                                ResultSet company = st.executeQuery(sql_getCompany);
                                                while (company.next()) {
                                                    String companyName = company.getString("company-name");
                                            %>

                                            <option name="<%= companyName%>"><%= companyName%></option>

                                            <%
                                                }
                                            %>


                                        </select><img src= "images/icons/dropDown.png" alt="dropDown"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td><h4>Add a Company</h4></td>
                                    <td><input id="companyName" type="text" name= "companyName" tabindex="1" placeholder="eg. Ubisoft/Electronic Arts"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input id="addProductNameBtn" type="button" value="I have done writing name"/>
                                    </td>
                                </tr>
                            </table>
                            <h4 id="step1Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                            <h4 id="step2Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                            <table class="stepTable">
                                <tr>
                                    <td colspan="2"><h1>Step 2. Enter Category</h1></td>
                                </tr>
                                <%//Retrieves The Data From category table%>
                                <tr>
                                    <td><h4>Select a Category</h4> <br/> 
                                        <h3 class="center">Or</h3><br/></td>
                                <script type="text/javascript" src="js/jquery.js"></script>
                                <script type="text/javascript">
                                    $(document).ready (function (){
                                        $('#selectMenuCategory').click(function (){
                                            var category = $(this).attr('value');
                                            //alert ("Aargh " +getCategory);
                                            $.get('getProductSubCategory', 
                                                    { category: category}, 
                                                    function (data){
                                                        $('#selectMenuSubCategory').html(data);
                                                    });
                                        });
                                    });
                                </script>
                                
                                    <td><img src= "images/icons/dropDown.png" alt="dropDown"/>
                                        <select tabindex="3" id="selectMenuCategory" name="category">
                                            <% ResultSet rs = st.executeQuery(sql_getCategory);
                                                while (rs.next()) {
                                                    String category = rs.getString("category_name");
                                            %>
                                            <option value="<%= category%>"><%= category%></option>
                                            <%
                                                }
                                            %>
                                        </select><img src= "images/icons/dropDown.png" alt="dropDown"/></td>

                                </tr>

                                <tr>
                                    <td><h4>Add Category</h4></td>
                                    <td>
                                        <input id="categoryName" type="text" name= "categoryName" tabindex="1" placeholder="eg. Games, Movies, Books"/><br/></td>
                                </tr>
                                <tr  class="needHRule">
                                    <td></td>
                                    <td><input id="addCategoryNameBtn" type="button" value="Add Category"/>
                                    </td>
                                </tr>


                                <%//Retrieves The Data From Sub-category table%>
                                <tr>
                                    <td><h4>Select a Sub-Category</h4> <br/> <h3 class="center">Or</h3><br/></td>
                                    <td>
                                        <img src= "images/icons/dropDown.png" alt="dropDown"/>
                                        <select id="selectMenuSubCategory" name="subCategory">

                                            <%

                                                ResultSet subCategory = st.executeQuery(sql_getSubCategory);

                                                while (subCategory.next()) {
                                                    String subCat = subCategory.getString("sub-category_name");
                                            %>

                                            <option value="<%= subCat%>"><%= subCat%></option>

                                            <%
                                                }
                                                st.close();

                                            %>

                                        </select><img src= "images/icons/dropDown.png" alt="dropDown"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td><h4>Add Sub-Category</h4></td>
                                    <td><input id="SubCategoryName" type="text" name= "SubCategoryName" tabindex="1" placeholder="Action, Adventure, Drama, etc"/><br/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input id="addSubCategoryBtn" type="button" value="Add Sub-Category"/>
                                    </td>
                                </tr>
                            </table>
                        </div>


                        <!--	<div id="productStockDetail">
                                        <h4>Product In Stock</h4>
                                        <h5>Will be delivered in 5 days</h5>
                                </div>-->
                        <div class="clear"></div>
                        <h1>Step 3. Enter Pricing information</h1>
                        <input type="text" name= "price" tabindex="1" placeholder="eg.Rs 7899/-"/><br/>
                        <br/>
                        <h1>Step 4. Enter in Product Name &AMP; Quantity</h1>
                        <input id="productName" type="text" name= "productName"  placeholder="Product Name"/><br/>
                        <br/>
                        <input id="productQty" type="text" name= "productQty"  placeholder="Quantity"/><br/>
                        <br/>
                        <h1>Step 5. Enter in Tags and Description</h1>
                        <input id="tags" type="text" name= "tags" placeholder="Write in tags here without commas"/><br/>
                              <br/>  
                        <h1>Summary / Description Of the Product</h1>
                        <textarea name="summary" class="grid_9" rows="17"></textarea>

                        <input id="greenBtn" type="submit" value ="I have Done Adding the Product Info." />
                    </div>
            </form>
               <div class="clear"></div>
              <br/>
            </div>
            <%--This separates out the Image and the main Content --%>

            <div class="clear"></div>
        </div>
    </div>
</div>

<div class="container_16">
    <div class="grid_16" id="productStrip"> <a href="http:google.com">
            <div class="ProductHeading">
                <div class="grid_12">
                    <h2 class="heading">Top Most Viewed Products Currently</h2>
                </div>
                <div id="viewMore" class="grid_3">
                    <h6 class="blue">View More</h6>
                </div>
            </div>
        </a>
        <div class="clear"></div>

        <div id="productList" class="grid_3"> 
            <a href="http:www.google.com"><img src="images/crap%20imgs/bg-linen.jpg" /></a>
            <p id="info">
                <a href="http:www.google.com"><span class="blue">Book blue Longest one to test that does it works??</span></a><br/>
                By Author Name<br/>
                <span class="red">Rs. 1000</span>
            <p>            
        </div>
        <div id="productList" class="grid_3"> <a href="http:www.google.com"><img src="images/crap%20imgs/bg-linen.jpg" /></a>
            <p id="info"><a href="http:www.google.com"><span class="blue">Book blue Longest one to test that does it works??</span></a><br/>
                By Author Name<br/>
                <span class="red">Rs. 1000</span>
            <p>            
        </div>
        <div id="productList" class="grid_3"> <a href="http:www.google.com"><img src="images/crap%20imgs/bg-linen.jpg" /></a>
            <p id="info"><a href="http:www.google.com"><span class="blue">Book blue Longest one to test that does it works??</span></a><br/>
                By Author Name<br/>
                <span class="red">Rs. 1000</span>
            <p>            
        </div>
        <div id="productList" class="grid_3"> <a href="http:www.google.com"><img src="images/crap%20imgs/bg-linen.jpg" /></a>
            <p id="info"><a href="http:www.google.com"><span class="blue">Book blue Longest one to test that does it works??</span></a><br/>
                By Author Name<br/>
                <span class="red">Rs. 1000</span>
            <p>            
        </div>
        <div id="productList" class="grid_3"> <a href="http:www.google.com"><img src="images/crap%20imgs/bg-linen.jpg" /></a>
            <p id="info"><a href="http:www.google.com"><span class="blue">Book blue Longest one to test that does it works??</span></a><br/>
                By Author Name<br/>
                <span class="red">Rs. 1000</span>
            <p>            
        </div>
    </div>
</div>



<div id = "footer">
    <div class="container_16">

        <div class="grid_16" >
            <div class="grid_3">
                <ul>
                    <li><strong>Help</strong></li>
                    <li><a href="faq.html">Payments</a></li>
                    <li><a href="faq.html">Shipping</a></li>
                    <li><a href="faq.html">Cancellation &amp; Returns</a></li>
                </ul>
            </div>
            <div class="grid_3">
                <ul>
                    <li><strong>SaiKiran</strong></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="faq.html">Careers</a></li>
                </ul>
            </div>
            <div class="grid_3">
                <ul>
                    <li><strong>Misc</strong></li>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="faq.html">Affiliate</a></li>
                    <li><a href="http://www.facebook.html">Facebook</a></li>
                </ul>
            </div>

            <div class="grid_5">
                <br/><h2>Safe and Secure Shopping</h2><p>
                    All major credit and debit cards are accepted. We also accept payments by Internet Banking, Cash on Delivery and Equated Monthly Installments(EMI).</p>

            </div>

        </div>

        <div id="clear"/>
        <div class="grid_16">	
            <p>Copyrights &copy; 2012 SaiKiran BookStores - The online library</p>
        </div>
    </div>
</div>

</body>
</html>
