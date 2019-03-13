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

        <style type="text/css">
            #buy {
                border-radius: 17px;
            }
            #buy:hover {
                border-radius: 17px;
            }
        </style>
        <div class="container_16">
            <div class="grid_16" style="padding: 10px;" id="whiteBox">
                <br/>
                <h1 class="grid_15" style="text-align: center;">Monthly Activity Graph - Expenses, Sales, Profits  </h1><hr/>
                <div class="grid_10 push_3"><form>
                     Select Month
                     
                <select name="month" class="graphLoad" id="month">
                    <option value="12">December</option>
                    <option value="11">November</option>
                    <option value="10">October</option>
                    <option value="09">September</option>
                    <option value="08">August</option>
                    <option value="07">July</option>
                    <option value="06">June</option>
                    <option value="05">May</option>
                    <option value="04">April</option>
                    <option value="03">March</option>
                    <option value="02">February</option>
                    <option value="01">January</option>
                </select>
                Select Year
                <select name="year" class="graphLoad" id="year">
                    <%
                        for (int i =12 ;i<35;i++){
                            %>
                            <option value="20<%=i%>">20<%=i%></option>
                    <%
                        }
                    %>
                </select><br/>
                <div class="grid_7">
                    <input class="grid_4" type="submit" id="buy" value="Refresh">
                </div>
                </form></div>
                <div class="clear"></div>
                <div id="loadLineChart">
                </div>
                
                <%
                Date date = new Date();
                date.getMonth();
                String status;
                int month, year;
                year = 2013;
                month = (date.getMonth()+1);
                String monthInWords = "";
                //out.print(""+month+" "+year);
                if (request.getParameter ("status")!= null || request.getParameter("month") != null ||request.getParameter("year") != null){
                    try{
                        status = request.getParameter("status");
                        month = Integer.parseInt(request.getParameter("month"));
                        year = Integer.parseInt(request.getParameter("year"));
                    } catch (NumberFormatException e){
                        //response.sendRedirect("/MyCartApplication/");
                        out.print(""+e);
                    }
                };
                
                /*
# ITEMS iSSUED BY DAY  ------------SQL1 
#---> SOLD BUT STATUS = PENDING
SELECT DAY(  `ordered_On` ) AS pendingOrderDate, SUM(  `total_order_price` ) AS pricePending
FROM  `order` 
WHERE (
 `ordered_On` LIKE  '2012-11%'
)
AND (
 `status` =  'pending'
)
GROUP BY DATE(  `ordered_On` ) 
#-------------------------------------------
# ITEMS approved BY DAY --------------SQL2
#---> SOLD BUT STATUS = approved
SELECT DAY(  `ordered_On` ) AS approvedOrderDate, SUM(  `total_order_price` ) AS priceApproved
FROM  `order` 
WHERE (
 `ordered_On` LIKE  '2012-11%'
)
AND (
 `status` =  'approved'
)
GROUP BY DATE(  `ordered_On` ) 
#------------------------------------
 # ITEMS sold BY DAY 
#---> SOLD BUT STATUS = delivered
SELECT DAY(  `ordered_On` ) AS deliveredOrderDate, SUM(  `total_order_price` ) AS priceDelivered
FROM  `order` 
WHERE (
 `ordered_On` LIKE  '2012-11%'
)
AND (
 `status` =  'delivered'
)
GROUP BY DATE(  `ordered_On` ) 
#---------------------------------------
#EXPENSES 
SELECT DAY(  `purchase_date` ) AS purchaseDate, SUM(  `price` ) AS expense
FROM  `expenses` 
WHERE  `purchase_date` LIKE  '2012-1%'
 
 
 
 * 
 *   */
                
                String sqlPendingOrders = "SELECT DAY(  `ordered_On` ) AS OrderDate, SUM(  `total_order_price` ) AS price "
                                     +" FROM  `order` "
                                    +" WHERE ("
                                    +" `ordered_On` LIKE  '"+year+"%'"
                                    +" ) "
                                    +" AND "
                                    + "("
                                    +" MONTH(`ordered_On`) ='"+month+"'"
                                    +" ) "
                                    +" AND ("
                                    +" `status` =  'pending'"
                                    +" )"
                                   +" GROUP BY DATE(  `ordered_On` )";
                    
                String sqlApprovedOrders= "SELECT DAY(  `ordered_On` ) AS OrderDate, SUM(  `total_order_price` ) AS price "
                                     +" FROM  `order` "
                                    +" WHERE ("
                                    +" `ordered_On` LIKE  '"+year+"%'"
                                    +" ) "
                                    +" AND "
                                    + "("
                                    +" MONTH(`ordered_On`) = '"+month+"'"
                                    +" ) "
                                    +" AND ("
                                    +" `status` =  'approved'"
                                    +" )"
                                   +" GROUP BY DATE(  `ordered_On` )";
                
                String sqlDelivredOrders= "SELECT DAY(  `ordered_On` ) AS OrderDate, SUM(  `total_order_price` ) AS price "
                                     +" FROM  `order` "
                                    +" WHERE ("
                                    +" `ordered_On` LIKE  '"+year+"%'"
                                    +" ) "
                                    +" AND "
                                    + "("
                                    +" MONTH(`ordered_On`) ='"+month+"'"
                                    +" ) "
                                    +" AND ("
                                    +" `status` =  'delivered'"
                                    +" )"
                                   +" GROUP BY DATE(  `ordered_On` )";
                
                String sqlExpenses = "SELECT "
                            + " DAY(  `purchase_date` ) AS purchaseDate, SUM(  `price` ) AS expense "
                           +" FROM  `expenses` "
                           +" WHERE  (`purchase_date` LIKE  '"+year+"%') "
                            + " AND ( MONTH(`purchase_date`) = '"+month+"') "
                            + " GROUP BY  DAY(`purchase_date`) ";

                    Connection c = new DB_Conn().getConnection();
                    Statement st = c.createStatement();
                    
                    ArrayList<Integer> soldOnPendingTemp = new ArrayList<Integer> ();
                    ArrayList<Integer> pricePendingTemp = new ArrayList<Integer> ();
                    soldOnPendingTemp.clear();
                    pricePendingTemp.clear();
                    
                    ArrayList<Integer> soldOnApprovedTemp = new ArrayList<Integer> ();
                    ArrayList<Integer> priceApprTemp = new ArrayList<Integer> ();
                    soldOnApprovedTemp.clear();
                    priceApprTemp.clear();
                    
                    ArrayList<Integer> soldOnDelTemp = new ArrayList<Integer> ();
                    ArrayList<Integer> priceDeliTemp = new ArrayList<Integer> ();
                    soldOnDelTemp.clear();
                    priceDeliTemp.clear();
                    
                    ArrayList<Integer> BoughtOn = new ArrayList<Integer> ();
                    ArrayList<Integer> expenseTemp = new ArrayList<Integer> ();
                    BoughtOn.clear();
                    expenseTemp.clear();
                    
                    
                    
                    ArrayList<Integer> soldOn = new ArrayList<Integer> ();
                    ArrayList<Integer> pricePending = new ArrayList<Integer> ();
                    ArrayList<Integer> priceApproved = new ArrayList<Integer> ();
                    ArrayList<Integer> priceDelivered = new ArrayList<Integer> ();
                    ArrayList<Integer> priceExpense = new ArrayList<Integer> ();
                    
                    soldOn.clear();
                    pricePending.clear();
                    priceApproved.clear();
                    priceDelivered.clear();
                    priceExpense.clear();
                    
                    
                    ResultSet rs = st.executeQuery(sqlPendingOrders);
                    while (rs.next()){
                        soldOnPendingTemp.add(rs.getInt("OrderDate"));
                        pricePendingTemp.add(rs.getInt("price"));
                    }
                    
                    ResultSet rs1 = st.executeQuery(sqlApprovedOrders);
                    while (rs1.next()){
                        soldOnApprovedTemp.add(rs1.getInt("OrderDate"));
                        priceApprTemp.add(rs1.getInt("price"));
                    }
                    
                    ResultSet rs2 = st.executeQuery(sqlDelivredOrders);
                    
                    while (rs2.next()){
                        soldOnDelTemp.add(rs2.getInt("OrderDate"));
                        priceDeliTemp.add(rs2.getInt("price"));
                    }
                    
                    ResultSet rs3 = st.executeQuery(sqlExpenses);
                    
                    while (rs3.next()){
                        BoughtOn.add(rs3.getInt("purchaseDate"));
                        expenseTemp.add(rs3.getInt("expense"));
                    }
                     
                    for (int i= 0; i<= 31; i++){
                       soldOn.add(i);
                       pricePending.add(0);
                       priceApproved.add(0);
                       priceDelivered.add(0);
                       priceExpense.add(0);
                       for (int j=0; j<soldOnPendingTemp.size() ; j++){
                        if (soldOnPendingTemp.get(j) == i){
                                soldOn.set(i, soldOnPendingTemp.get(j));
                                pricePending.set(i, pricePendingTemp.get(j));
                        } 
                       }
                       for (int j=0; j<soldOnApprovedTemp.size() ; j++){
                        if (soldOnApprovedTemp.get(j) == i){
                                soldOn.set(i, soldOnApprovedTemp.get(j));
                                priceApproved.set(i, priceApprTemp.get(j));
                        } 
                       }
                       for (int j=0; j<soldOnDelTemp.size() ; j++){
                        if (soldOnDelTemp.get(j) == i){
                                soldOn.set(i, soldOnDelTemp.get(j));
                                priceDelivered.set(i, priceDeliTemp.get(j));
                        } 
                       }
                       for (int j=0; j<BoughtOn.size() ; j++){
                        if (BoughtOn.get(j) == i){
                                soldOn.set(i, BoughtOn.get(j));
                                priceExpense.set(i, expenseTemp.get(j));
                        } 
                       }
                    }
                    
                    /*
                    for (int i= 0; i< soldOn.size(); i++){
                        out.println("<br/>Sold On :"+soldOn.get(i));
                        out.println("Pending:           "+pricePending.get(i));
                        out.println("Approoved          "+priceApproved.get(i));
                        out.println("Delivered:         "+priceDelivered.get(i));
                        out.println("Expense :          "+priceExpense.get(i));
                    }
                    out.println("<br/><br/><br/>");
                        
                    for (int i= 0; i< soldOnPendingTemp.size(); i++){
                        out.println("<br/>Sold On :"+soldOnPendingTemp.get(i));
                        out.println("Priced On :"+soldOnPendingTemp.get(i));
                    }*/
                %>
                
            <!--Loading the AJAX API-->
                <script type="text/javascript" src="js/gclibrary/jsapi.js"></script>
                <script type="text/javascript" src="js/gclibrary/core.js"></script>
                <script type="text/javascript" src="js/gclibrary/core1.js"></script>
                    
            <div class="grid_16"  style="padding: 10px 0px 10px 0px;" id="whiteBox">
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
                  <%

                        if (month == 1){
                            monthInWords = "January";
                        }
                        if (month == 2){
                            monthInWords = "February";
                        }
                        if (month == 3){
                            monthInWords = "March";
                        }
                        if (month == 4){
                            monthInWords = "April";
                        }
                        if (month == 5){
                            monthInWords = "May";
                        }
                        if (month == 6){
                            monthInWords = "Jume";
                        }
                        if (month == 7){
                            monthInWords = "July";
                        }
                        if (month == 8){
                            monthInWords = "August";
                        }
                        if (month == 9){
                            monthInWords = "September";
                        }
                        if (month == 10){
                            monthInWords = "October";
                        }
                        if (month == 11){
                            monthInWords = "November";
                        }
                        if (month == 12){
                            monthInWords = "December";
                        }
                                out.print("([ "
                                          + "['Day', 'Pending', 'Approved', 'Delivered', 'Expenses' ], ");
                                int i = 0 ;
                                 while (i<= soldOn.size()-1){
                                      if (i< soldOn.size()-1){
                                         out.println(
                                                 "['Day "+soldOn.get(i) +"',  "
                                                 +pricePending.get(i) +", "
                                                 +priceApproved.get(i)+ ", "
                                                 +priceDelivered.get(i)+", "
                                                 +priceExpense.get(i)+"  ],");
                                      }
                                      else {
                                         out.println(
                                                 "['Day "+soldOn.get(i) +"',  "
                                                 +pricePending.get(i) +", "
                                                 +priceApproved.get(i)+ ", "
                                                 +priceDelivered.get(i)+", "
                                                 +priceExpense.get(i)+" ] ");
                                      }
                                      i++;
                                  }
                                out.print("]);");
                      %>
                      var options = {
                                title: 'Report in the Month of <%= monthInWords +" "+year %>',
                                  vAxis: {title: "Items Sold in Rs."},
                                  hAxis: {title: "Days of <%= monthInWords %>"}
                              };

                              var chart = new google.visualization.LineChart(document.getElementById('chart_div_lineCombo'));
                              chart.draw(data, options);
                            }
              
                </script>
                <div id="chart_div_lineCombo" style="width: 900px; height: 300px;"></div>
            </div> 
      
            </div>
        </div>
