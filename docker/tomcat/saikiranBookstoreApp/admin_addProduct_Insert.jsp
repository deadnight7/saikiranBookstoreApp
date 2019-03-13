<%-- 
    Document   : admin_addProduct_Insert
    Created on : 30 Nov, 2012, 11:35:07 PM
    Author     : chirag
--%>

<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="javazoom.upload.DBStore"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
        <jsp:useBean class="product.productBean" scope="session" id="productBean"></jsp:useBean>
                 
<%
    if (productBean.getCompany() == null || 
            productBean.getCompany()  == ""){
        response.sendRedirect("admin_addProduct_1.jsp");
    } else if ( productBean.getCategory() == null || 
                    productBean.getCategory()  == "" ||
                    productBean.getSubcategory()  == null || 
                    productBean.getSubcategory()  == "" ){
        response.sendRedirect("admin_addProduct_2.jsp");
    } else if (productBean.getName() == null || 
                    productBean.getName() == "" ||
                    productBean.getTags() == null || 
                    productBean.getTags() == ""){
        response.sendRedirect("admin_addProduct_3.jsp");
    } else if (productBean.getPrice() == null || 
                    productBean.getPrice() == "" ||
                    productBean.getQuantity() == null || 
                    productBean.getQuantity() == "" ||
                    productBean.getSummary() == null || 
                    productBean.getSummary() == "" ){
        response.sendRedirect("admin_addProduct_4.jsp");
    }
    
    
       double price = 0;
       int quantity = 0;

    try {
        price = Double.parseDouble(productBean.getPrice());
        quantity = Integer.parseInt(productBean.getQuantity());
     
                
%>


        <%
            /*
        INSERT INTO  `saikiran enterprises`.`products` (
`product_id` ,
`product-name` ,
`sub-category-name` ,
`category-name` ,
`company-name` ,
`price` ,
`summary` ,
`tags` ,
`product_qty` ,
`lastUpdated`
)
VALUES (
NULL ,  'Assassins Cedd',  'Action-Game',  'Games',  'EA, Electronic Arts',  '3', 'dcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdc', 'dcdcdcdcdcdcdcdc',  '2', NOW( )
);
 
//Fetch the product id
SELECT  `product_id` 
FROM  `products` 
WHERE  `product-name` =  'Assassins Creed'
 
      //Insert into expenses
 INSERT INTO  `saikiran enterprises`.`expenses` (
`expenses_id` ,
`product_id` ,
`product_name` ,
`price` ,
`purchase_date`
)
VALUES (
NULL ,  '2',  'Ayinga Movie ',  '123456', NOW( )
);  
        */
                String insertQuery = ""
                        + "INSERT INTO  "
                        + "`saikiran enterprises`.`products` "
                        + "(`product_id` ,"
                        + "`product-name` ,"
                        + "`sub-category-name` ,"
                        + "`category-name` ,"
                        + "`company-name` ,"
                        + "`price` ,"
                        + "`summary`, "
                        + "`tags`, "
                        + "`product_qty`, "
                        + "`lastUpdated`, "
                        + "`hits` ) "
                        + "VALUES "
                        + ""
                        + "(NULL ,  "
                        + "'"+productBean.getName() +"',  "
                        + "'"+productBean.getSubcategory()+"',  "
                        + "'"+productBean.getCategory()+"',  "
                        + "'"+productBean.getCompany()+"',  "
                        + "'"+productBean.getPrice()+"', "
                        + "'"+productBean.getSummary()+"', "
                        + "'"+productBean.getTags()+"', "
                        + ""+productBean.getQuantity()+","
                        + "NOW( ),"
                        + " 0  );";
                
            out.print(""+insertQuery);
            
            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            st.execute(insertQuery);
                ResultSet executeQuery = st.executeQuery("SELECT  `product_id` "
                                                         + " FROM  `products` "
                                                         + " WHERE  `product-name` =  '"+productBean.getName() +"'");
                    String ProductId = "";
                    while (executeQuery.next()){
                        ProductId = executeQuery.getString("product_id");
                    }
                    session.setAttribute("productName", productBean.getName());
                    session.setAttribute("productId", ProductId);
                    
                    
                
                ResultSet executeQueryFetchPid = st.executeQuery("SELECT  `product_id` "
                                                        +" FROM  `products` "
                                                        + " WHERE  `product-name` =  '"+productBean.getName() +"' ");
                int pid = 0;
                while (executeQueryFetchPid.next()){
                     pid = executeQueryFetchPid.getInt("product_id");
                 }
                
                st.executeUpdate(" INSERT INTO  `saikiran enterprises`.`expenses` ("
                            +"`expenses_id` ,"
                            +"`product_id` ,"
                            +"`product_name` ,"
                            +"`price` ,"
                            +"`purchase_date`"
                            +")"
                            +"VALUES ("
                            +"NULL ,  '"+pid+"',  '"+productBean.getName()+"',  '"+(quantity*price)+"', NOW( )"
                            +" );  ");
                    response.sendRedirect("productInsertImages.jsp");
                }catch(NumberFormatException e) {
                    response.sendRedirect("admin_addProduct_4.jsp");
                }catch(SQLIntegrityConstraintViolationException e) {
                    response.sendRedirect("admin_addProduct_3.jsp");
                }finally{
                    
                }
        %>
    </body>
</html>
