<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SaiKiran BookStores</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>

        <link rel="stylesheet" href="css/slider.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/slider.js"></script>


<script type="text/javascript" >

    // This is the script for the banner slider

    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 7000
        });
    });
</script>


<script type="text/javascript" src="js/myScript.js"></script>

</head>
<body>

        <%
        if (session.getAttribute("user") == null ){// THen new user, show join now
            %>
            <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
        }
        %>


    <%@include file="includesPage/_search_navigationbar.jsp" %>

    <%@include file="includesPage/_facebookJoin.jsp" %>

    <div id = "banner">
        <div class="container_16">
            <div class="grid_16" style="padding-left: 20px; " id="slider">	
                <ul id="sliderContent">		
                    <!-- Duplicate this code for each image -->				

                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b1.png" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Fountain Pens...</strong>	

                            <br>From the International and Indian markets, we have the variety of the High Class fountain 

                            pens. Available now for you to get your hands on.

                        </span>

                    </li>  
                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b2.png" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Books, Diaries...</strong>				

                            <br>Text Books, Single Lines, Double Lines, Red 'n Blue Lines, Fullscape Books

                            Drawing Books, and all the paper you want to write all throughout to learn 

                            Available now at your doorsteps* 



                        </span>

                    </li>  



                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b5.png" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Kids Colors...</strong>				

                            <br>Collection of Non-Toxic childrens colors available

                            Let your child learn the art of painting at an early age 

                            by having his hands on the colors available here... 

                        </span>

                    </li>  

                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b7.jpg" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Graphic Novels...</strong>				

                            <br>The most amazing titles that you always wanted to get your hands onn.. 

                            Now you have the opportunity to have them all in your personal library.

                            International as well as Indian titles of many authors available

                        </span>

                    </li>   



                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b6.png" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Color World...</strong>				

                            <br>A vast variety of different sets of colors including Oil-Pastels,

                            Pencil Colors, Poster Colors, Acrylic Colors and many more...

                        </span>

                    </li>   

                    <div class="clear sliderImage"></div>  

                </ul>
            </div>
        </div>
    </div>



    <div class="container_16">
        <div id = "contents">
            <!-- LeftSide -->


<%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
            <div id="leftside" class="grid_3">
                <div>
                    <ul id="leftsideNav">
                        <li><a href="#"><strong>Categories</strong></a></li>
                        
                        <%
                        while (rs.next()){
                            String category = rs.getString ("category_name");
                            %>
                            <li><a href="viewProducts_.jsp"><%= category %></a></li>
                        <%
                        }
                        %>
                      
                    </ul>
                </div>
                <div class="adv">
                    <h2><br/>This is The Header of an Advertisement</h2>
                    <p>We offer Advertisement display here </p>
                </div>
            </div>


        </div>

        <!-- Middle -->
        <div id="middle"class="grid_13">
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        </div>
        <!--The Middle Content Div Closing -->
    </div>
    <!--The Center Content Div Closing -->

    <jsp:include page="includesPage/_footer.jsp"></jsp:include>





</body>
</html>



