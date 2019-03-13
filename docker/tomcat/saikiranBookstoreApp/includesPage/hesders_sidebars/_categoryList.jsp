<%-- 
    Document   : _categoryList
    Created on : 15 Nov, 2012, 11:26:20 PM
    Author     : chirag
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

<%
    ArrayList category =  product.getCategory();
    %>
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Categories</strong></a></li>   
    <%
    for (int i=0;i<category.size(); i++){
        %>         
                            <li><a href="addProductFilters.jsp?cat=<%= category.get(i) %>"><%= category.get(i) %></a></li>
        <%
    }%>
                        </ul>
                    </div>
    <%
    
    /*

                <div id="leftside" class="grid_3">
                    
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Categories</strong></a></li>
                            <li><a href="#">Books</a></li>
                            <li><a href="#">Calculators</a></li>
                            <li><a href="#">Art Supplies</a></li>
                            <li><a href="#">Office Supplies</a></li>
                            <li><a href="#">School Supplies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Movies</a></li>
                        </ul>
                    </div>
*/
%>
