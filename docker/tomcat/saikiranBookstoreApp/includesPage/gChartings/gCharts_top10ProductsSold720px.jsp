<%-- 
    Document   : gCharts_pieDiagram1
    Created on : 2 Dec, 2012, 12:01:13 AM
    Author     : chirag
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.DB_Conn"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                <%/*
                SELECT COUNT(  `product_name` *  `product_quantity` ) AS solds,  `product_name` 
FROM  `sales` 
GROUP BY  `product_name` 
ORDER BY solds DESC 
                */
                
                
                String top10products = "SELECT COUNT(  `product_name` *  `product_quantity` ) AS solds,  `product_name` "
                                +" FROM  `sales` "
                                +" GROUP BY  `product_name` "
                                +" ORDER BY solds DESC  "
                                +" LIMIT 0 , 10 ;";

                    Connection c = new DB_Conn().getConnection();
                    Statement st = c.createStatement();
                    
                    ArrayList<String> product = new ArrayList<String> ();
                    ArrayList<Integer> hits = new ArrayList<Integer> ();
                    
                    
                    product.clear();
                    hits.clear();
                    
                    ResultSet rs = st.executeQuery(top10products);
                    while (rs.next()){
                        product.add(rs.getString("product_name"));
                        hits.add(rs.getInt("solds"));
                    }
                %>
                
            <!--Loading the AJAX API-->
                <script type="text/javascript" src="js/gclibrary/jsapi.js"></script>
                <script type="text/javascript" src="js/gclibrary/core.js"></script>
                <script type="text/javascript" src="js/gclibrary/core1.js"></script>
                    
            <div class="grid_13"  style="padding: 10px 0px 10px 0px;" id="whiteBox">
                <script type="text/javascript" src="js/jquery.js"></script>
                <script type="text/javascript">
                            google.setOnLoadCallback(drawChart);
                    <%--        var graphData = <% 
                                      out.print("[ "
                                                + "['Day', 'Sales'],");
                                      int i=0;
                                       while (i<= soldOn.size()-1){
                                            if (i< soldOn.size()-1){
                                               out.println("['Day "+soldOn.get(i) +"',  "+price.get(i) +" ],");
                                            }
                                            else {
                                               out.println("['"+soldOn.get(i) +"',  "+price.get(i) +" ]");
                                            }
                                            i++;
                                        }
                                        out.print("];");
                            %>;--%>
                                    
                            function drawChart() {
                              var data = google.visualization.arrayToDataTable
                              <%--([
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
                              ]);--%>
                  <% out.print("([ "
                                          + "['Product Name', 'Units Sold' ], ");
                                int i = 0 ;
                                 while (i<= hits.size()-1){
                                      if (i< hits.size()-1){
                                         out.println(
                                                 "['"+product.get(i)+" ',  "
                                                 +hits.get(i)+"  ],");
                                      }
                                      else {
                                         out.println(
                                                 "['"+product.get(i)+"',  "
                                                 +hits.get(i)+"  ] ");
                                      }
                                      i++;
                                  }
                                out.print("]);");
                      %>
                      var options = {
                                title: 'Top 10 products unit sold',
                                  vAxis: {title: "Units Sold"},
                                  hAxis: {title: "Product Names"}
                              };

                              var chart = new google.visualization.LineChart(document.getElementById('chart_div_lineTop10Sold'));
                              chart.draw(data, options);
                            }
              
                </script>
                <div id="chart_div_lineTop10Sold" style="width: 720px; height: 300px;"></div>
                
            </div> 
      
                 
