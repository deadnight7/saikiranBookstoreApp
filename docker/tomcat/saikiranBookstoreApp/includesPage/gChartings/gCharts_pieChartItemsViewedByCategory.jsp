<%-- 
    Document   : gCharts_pieDiagram1
    Created on : 2 Dec, 2012, 12:01:13 AM
    Author     : chirag
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

            <!--Loading the AJAX API-->
                <script type="text/javascript" src="js/gclibrary/jsapi.js"></script>
                <script type="text/javascript" src="js/gclibrary/core.js"></script>
                <script type="text/javascript" src="js/gclibrary/core1.js"></script>
                
                <div class="grid_13"  style="padding: 10px 0px 10px 0px;" id="whiteBox">

                    <script type="text/javascript">
                        
                      // Load the Visualization API and the piechart package.
                      google.load('visualization', '1.0', {'packages':['corechart']});

                      // Set a callback to run when the Google Visualization API is loaded.
                      google.setOnLoadCallback(drawChart);

                      // Callback that creates and populates a data table,
                      // instantiates the pie chart, passes in the data and
                      // draws it.
                      function drawChart() {
                          //// Create the data table.
                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Category');
                        data.addColumn('number', 'Views');
                        
<%                      
    String getPie = "SELECT  `category-name` , SUM(  `hits` ) as hits"
+" FROM  `products` "
+" GROUP BY  `category-name` "
+" ORDER BY  `hits` DESC ";
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    ResultSet rs = st.executeQuery(getPie);
    
    ArrayList<Integer> salesArr = new  ArrayList<Integer>();
    salesArr.clear();
    ArrayList<String> categoryArr = new  ArrayList<String>();
    categoryArr.clear();
    //out.print("data.addRows([");
    while (rs.next()){
        String category = rs.getString ("category-name");
        int sales = rs.getInt ("hits");
        categoryArr.add(category);
        salesArr.add(sales);
    }
    //out.print("]);");
    
    int i = 0;
    out.print("data.addRows([");
    while (i <= (categoryArr.size()-1) ){
        if (i <= categoryArr.size()-1){
                   out.println("['"+categoryArr.get(i) +"',  "+salesArr.get(i)+"],");
        }
        else {
                  out.println("['"+categoryArr.get(i) +"',  "+salesArr.get(i)+"]");
       }
       i++;
    }
    out.print("]);");
%>
                       
                        /*
                         data.addRows([
                          ['Books', 3],
                          ['Electronics', 1],
                          ['Games', 1],
                          ['Computers', 1],
                          ['Apprale', 2]
                        ]);
                         */

                        // Set chart options
                        var options = {'title':'Items viewed by Category',
                                       'width':720,
                                       'height':320};

                        // Instantiate and draw our chart, passing in some options.
                        var chart = new google.visualization.PieChart(document.getElementById('chart_div_pieChart1'));
                        chart.draw(data, options);
                      }
                        
                    </script>
                    <div id="chart_div_pieChart1"></div>                  
                </div>
                        
                   <%--   
            <div class="grid_16"  style="padding: 10px 0px 10px 0px;" id="whiteBox">
                <script type="text/javascript">
                  google.setOnLoadCallback(drawChart);
                      function drawChart() {
                    var data 
                        = google.visualization.arrayToDataTable([
                      ['Year', 'Sales', 'Expenses'],
                      ['1',  1000,      400],
                      ['2',  1170,      460],
                      ['3',  660,       1120],
                      ['4',  1030,      540],
                      ['5',  600,      650],
                      ['6',  780,      890],
                      ['7',  555,      457],
                      ['8',  456,      125],
                      ['9',  500,      756],
                      ['10',  1030,      630],
                      ['11',  660,      780],
                      ['12',  478,      445],
                      ['13',  50,      540],
                      ['14',  450,      235],
                      ['15',  1234,      667]
                    ]);

                    var options = {
                      title: 'Company Performance',
                        vAxis: {title: "Items Sold"},
                        hAxis: {title: "Days of November"}
                    };

                    var chart = new google.visualization.LineChart(document.getElementById('chart_div_line'));
                    chart.draw(data, options);
                  }
                </script>
                <div id="chart_div_line" style="width: 900px; height: 300px;"></div>
            </div> 
       --%>  
