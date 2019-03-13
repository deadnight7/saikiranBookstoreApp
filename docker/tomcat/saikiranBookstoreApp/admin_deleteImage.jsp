<%-- 
    Document   : admin_deleteImage
    Created on : 27 Nov, 2012, 10:45:41 PM
    Author     : chirag
--%>

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
            width: 300px;
            margin: 11px auto;
            padding: 8px;
            border: 1px solid #CCC;
            text-align: center;
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

        <%
            String imageId = request.getParameter("iid");
            String confirm = request.getParameter("d");
            session.getAttribute("productId");
            session.getAttribute("productName");
            if (request.getParameter("iid") == null && session.getAttribute("productId") == null) {
                //No Image selected for delete

        %>
        <div class="grid_16" style="padding: 10px;" id="whiteBox">

            <br/>
            <h1 class="grid_15" style="text-align: center;">Please select an Image for deleting...</h1><hr/>

            <div class="grid_13 push_3">
                <div class="grid_5">
                    <a href="admin_manageProduct.jsp" id="buy">Edit products</a>
                </div>
            </div>
        </div>
        <%    } else {
                
                    //Delete it right away
                    /*
                    DELETE FROM  `images` 
                    WHERE  `image-id` =  '5'
                    */
                    String sqlDeleteImg = "DELETE FROM  `images` "
                    +" WHERE  `image-id` =  '"+imageId+"'; ";
                    
                    Connection c = new DB_Conn().getConnection();
                    Statement st = c.createStatement();
                                        if (st.execute(sqlDeleteImg)){
                                            %>
                            <div class="grid_16" style="padding: 10px;" id="whiteBox">

                                <br/>
                                <h1 class="grid_15" style="text-align: center;">Product Image deleted</h1><hr/>

                                <div class="grid_13 push_3">
                                    <div class="grid_5">
                                        <a href="admin_manageProduct.jsp?pid=<%=session.getAttribute("productId")%>" id="buy">Edit products</a>
                                    </div>
                                </div>
                            </div>
                            <%
                                        }
                
        %>
        
        <div class="grid_16" style="padding: 10px;" id="whiteBox">

            <br/>
            <h1 class="grid_15" style="text-align: center;">Product Image deleted</h1><hr/>

            <div class="grid_13 push_3">
                <div class="grid_5">
                    <a href="admin_manageProduct.jsp" id="buy">Edit products</a>
                </div>
            </div>
        </div>

        <div class="grid_6 push_5" style="padding: 10px;" id="whiteBox">
            
                <img class="push_2" src="images/icons/gnome-dev-trash-full.png"/>
            
        </div>
        <%
                }
     
        %>

    </div>

</body>
</html>
