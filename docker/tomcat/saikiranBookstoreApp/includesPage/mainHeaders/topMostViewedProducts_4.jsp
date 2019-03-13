<%-- 
    Document   : topMostViewedProducts
    Created on : 13 Dec, 2012, 6:45:53 PM
    Author     : chirag
--%>

        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="database.DB_Conn"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.util.ArrayList"%>

        <style type="text/css">
            .prodGrid {
                margin: 10px;
                margin-right: -12px;
                margin-left: 36px;
            }
        </style>
<div class="grid_13" id="productStrip"> 
                       <a href="viewProducts_.jsp">
                           <div class="ProductHeading">
                               <div class="grid_12">
                                   <h2 class="heading">Top Most Viewed Products Currently</h2>
                               </div>
                               <!--<div id="viewMore" class="grid_3">
                                   <h6 class="blue">View More</h6>
                               </div>-->
                           </div>
                       </a>
                       <div class="clear"></div>
<%
 String sqlTopMostProds = "SELECT * "
+" FROM  `products` p"
+" INNER JOIN  `images` i"
+" USING (  `product-name` ) "
 + "WHERE `product_qty` > 5 "
+" GROUP BY  `product-name` "
+" ORDER BY  `hits` DESC "
 + " LIMIT 0,16 ";
 
 
 ArrayList<String> topMost = new ArrayList<String>();
 topMost.clear();
 Connection c = new DB_Conn().getConnection();
 Statement st = c.createStatement();
 ResultSet rs = st.executeQuery(sqlTopMostProds);
 String name, productId, category, subCategory, company, imageName, price;
 int i= 1;
 
 while (rs.next()){ 
     
      price = rs.getString("price");
      imageName = rs.getString("image-name");
      productId = rs.getString("product_id");
      name = rs.getString("product-name");
      subCategory = rs.getString("sub-category-name");
      category = rs.getString("category-name");
      company = rs.getString("company-name");
      %>
                <div id="productList" class="grid_3 prodGrid"> 
                    <a href="product.jsp?id=<%= productId %>"><img src="<%= imageName %>" /></a>
                    <p id="info">
                        <a href="product.jsp?id="><span class="blue"><%= name %></span></a><br/>
                        By <%= company %> <%= category %><br/>
                        <span class="red">Rs. <%= price %></span>
                    </p>            
                </div>
                       <%
    if (i%4 == 0){
        %>
                <div class="clear"></div>
                       <%
    }
      i++;
 }
 
 if (i == 0){
%>
                <div class="clear"></div><div id="productList" class="grid_3 prodGrid"> 
                    <a href="product.jsp"><img src="images/textures/linen.png" /></a>
                    <p id="info">
                        <a href="product.jsp?id="><span class="blue">No Product Added in Database</span></a><br/>
                        <br/>
                        <span class="red">Rs. 0</span>
                    </p>            
                </div>
                       <%
}
%>
            </div>