<%-- 
    Document   : topMostViewedProducts
    Author     : chirag
--%>

        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="database.DB_Conn"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.util.ArrayList"%>

<div class="grid_16" id="productStrip"> 
                       <a href="viewProducts_.jsp">
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
<%
 String sqlTopMostProds = "SELECT * "
+" FROM  `products` p"
+" INNER JOIN  `images` i"
+" USING (  `product-name` ) "
 + "WHERE `product_qty` > 5 "
+" GROUP BY  `product-name` "
+" ORDER BY  `lastUpdated` DESC "
 + " LIMIT 0,5 ";
 
 
 ArrayList<String> topMost = new ArrayList<String>();
 topMost.clear();
 Connection c = new DB_Conn().getConnection();
 Statement st = c.createStatement();
 ResultSet rs = st.executeQuery(sqlTopMostProds);
 String name, productId, category, subCategory, company, imageName, price;
 while (rs.next()){ 
        price = rs.getString("price");
      imageName = rs.getString("image-name");
      productId = rs.getString("product_id");
      name = rs.getString("product-name");
      subCategory = rs.getString("sub-category-name");
      category = rs.getString("category-name");
      company = rs.getString("company-name");
      %>
                <div id="productList" class="grid_3"> 
                    <a href="product.jsp?id=<%= productId %>"><img src="<%= imageName %>" /></a>
                    <p id="info">
                        <a href="product.jsp?id="><span class="blue"><%= name %></span></a><br/>
                        By <%= company %> <%= category %><br/>
                        <span class="red">Rs. <%= price %></span>
                    <p>            
                </div>
                       <%
 }
%>
            </div>