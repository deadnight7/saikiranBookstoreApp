<%-- 
    Document   : admin_manageProduct
    Created on : 26 Nov, 2012, 7:48:56 PM
    Author     : chirag
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


           <div class="clear"></div>
        <%

            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            
            //Fetch the (PID) Product ID 
            String productId = request.getParameter("sortBy");
            
            
                String sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` ";
                       // + " ORDER BY `hits` DESC ";
                
                if (productId.equals("qa")){
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `product_qty` ASC ";
                } else if(productId.equals("qd")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `product_qty` DESC ";
                } else if(productId.equals("ha")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `hits` ASC ";
                } else if(productId.equals("hd")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `hits` DESC ";
                    //price
                }  else if(productId.equals("pa")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `price` ASC ";
                } else if(productId.equals("pd")) {
                    sqlFetchItems = "SELECT * FROM  `products` p "
                        + "INNER JOIN  `images` i "
                        + "USING (  `product-name` ) "
                        + "GROUP BY  `product-name` "
                        + " ORDER BY `price` DESC ";
                    //price
                } 
          //out.print(""+productId+sqlFetchItems);      
                Statement st1 = c.createStatement();
                ResultSet rs = st1.executeQuery(sqlFetchItems.toString());

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
        <%
        
            %>
