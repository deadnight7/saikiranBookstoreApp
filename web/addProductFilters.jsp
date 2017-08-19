<%-- 
    Document   : addProductFilters
    Author     : chirag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("cat") != null ){
        //Check the category from the product bean 
        // set the session
        String category = request.getParameter("cat");
        session.setAttribute("cat", category);
    }
    if (request.getParameter("scat") != null ){
        //Check the scategory from the product bean 
        // set the session
        String subcategory = request.getParameter("scat");
        session.setAttribute("scat", subcategory);
    }
    response.sendRedirect("viewProducts_.jsp");
%>
