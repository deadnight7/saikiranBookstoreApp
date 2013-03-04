/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import cart.cart;
import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.user;

/**
 *
 * @author chirag
 */
@WebServlet(name = "buyItems", urlPatterns = {"/buyItems"})
public class buyItems extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet buyItems</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet buyItems at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        doPost(request, response);
        /*
         HttpSession session = request.getSession();
         if (!(session.getAttribute("user") == null) && !(session.getAttribute("cart") == null)) {

         user User;
         User = (user) session.getAttribute("user");
         cart Cart;
         Cart = (cart) session.getAttribute("cart");

         PrintWriter out = response.getWriter();
         try {
         out.println("you user :" + User.getUserEmail() + " has bought items worth " + Cart.getTotalPriceOfCart());


         } catch (SQLException ex) {
         Logger.getLogger(buyItems.class.getName()).log(Level.SEVERE, null, ex);
         } catch (ClassNotFoundException ex) {
         Logger.getLogger(buyItems.class.getName()).log(Level.SEVERE, null, ex);
         }
         } else {
         response.sendRedirect("/MyCartApplication/index.jsp");
         }
         */
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        //processRequest(request, response);

        // THIS IS BUY SERVLET DOING THE FOLLOWING TASKS
        /*
         1. CREATE AN ORDER FOR THE CURRENT USER LOGGED IN
         * GOT ALL THE INFORMATION ABOUT THE USER TO FINALLY FILL IN TH INDFORMATION
         * 2. FIRE ON ORDER sql QUERY AND GET LATEST ORDER ID OF THE CURRENT USER
         * 3. CREATE SALES TABLE ENTRIES AND FILL IN THE TABLE WITH SAME ORDER ID
         * 4  FIRE SALES sql QUERY AND LIST THE APPROVAL AS PENDING
         * 5  DECREMENT THE QUANTITY in the CART FROM products TABLE 
                    
         *  DONE REDIRECT BACK TO USER INFO
         */



        // GETTING ALL THE VALUES FROM THE USER
        String name, age, address, mobile;
        int order_id;
        Connection c = null;
        HttpSession session = request.getSession();
        user User;
        User = (user) session.getAttribute("user");
        cart Cart;
        Cart = (cart) session.getAttribute("cart");
        
        name = request.getParameter("name");
        age = request.getParameter("age");
        address = request.getParameter("address");
        mobile = request.getParameter("mobile");
        
        
        if (name.trim().length() > 1
                && address.trim().length() >= 5
                && mobile.trim().length() >= 5
                && mobile.trim().length() <= 12) {
            
            if (!(session.getAttribute("user") == null)
                    && !(session.getAttribute("cart") == null)) {
                
                try {
                    response.setContentType("text/html;charset=UTF-8");
                    
                    c = new DB_Conn().getConnection();
                    
                    //******* Starting a Transaction
                    c.setAutoCommit(false);
                    String insertOrder;
                    insertOrder = "    INSERT INTO  `saikiran enterprises`.`order` ("
                            + "    `order_id` ,"
                            + "    `user_id` ,"
                            + "    `status` ,"
                            + "    `shippers_name` ,"
                            + "    `address` ,"
                            + "    `mobile_number` ,"
                            + "    `shippers_email` ,"
                            + "    `ordered_On` ,"
                            + "    `total_order_price`"
                            + "    )"
                            + "    VALUES ("
                            + "    NULL ,  ?,  'pending',  ?,  ?,  ?, ?, NOW( ) ,  ?"
                            + "    );";
                    
                    PreparedStatement preparedSQL1 =
                            c.prepareStatement(insertOrder);
                    
                    preparedSQL1.setInt(1, User.getUserId()); // user iD

                    preparedSQL1.setString(2, name); //`shippers_name` 

                    preparedSQL1.setString(3, address); //`address` 

                    preparedSQL1.setString(4, mobile); //`mobile` 

                    preparedSQL1.setString(5, User.getUserEmail()); //`shippers_email` 

                    preparedSQL1.setDouble(6, Cart.getTotalPriceOfCart()); //`total_order_price`` 

                    int executeUpdatePreparedSQL1 = preparedSQL1.executeUpdate();
                    
                    if (executeUpdatePreparedSQL1 == 1) {
                        //get the latest order id of the recent update

                        //out.println("Ok here we are onr order updted");
                        String getLatestOrderId = "SELECT  `order_id` "
                                + "FROM  `order` "
                                + "WHERE  `user_id` = " + User.getUserId() + " "
                                + "ORDER BY  `ordered_On` DESC; "
                                + "";
                        
                        preparedSQL1.close();
                        
                        Statement st = c.createStatement();
                        ResultSet executeQueryGetOrderId = st.executeQuery(getLatestOrderId);
                        executeQueryGetOrderId.next();

                        //Here we get the latest order id for the current user
                        order_id = executeQueryGetOrderId.getInt("order_id");
                        
                        executeQueryGetOrderId.close();

                        //out.println("you user :" + User.getUserEmail() + " has bought items worth " + Cart.getTotalPriceOfCart() + "gffdgfgvgedfrggfdre and order id of " + order_id);

                        ArrayList<String> productCategorys = Cart.getProductCategorys();
                        ArrayList<String> productNames = Cart.getProductNames();
                        ArrayList<Double> prices = Cart.getPrices();
                        ArrayList<Integer> qty = Cart.getQty();
                        ArrayList<Integer> id = Cart.getId();
                        
                        String insertIntoSalesSQL3 = ""
                                + "INSERT INTO  `saikiran enterprises`.`sales` ("
                                + "`sales_id` ,"
                                + "`order_id` ,"
                                + "`product_id` ,"
                                + "`product_name` ,"
                                + "`product_price` ,"
                                + "`product_quantity` ,"
                                + "`sold_on` ,"
                                + "`user_id`"
                                + ")"
                                + "VALUES ("
                                + "    NULL ,  ?,  ?,  ?,  ?,  ?, NOW( ) ,  ? "
                                + "       );";
                        
                        PreparedStatement insertIntoSalesTable = c.prepareStatement(insertIntoSalesSQL3);
                        
                        for (int i = 0; i < productNames.size(); i++) {
                            
                            insertIntoSalesTable.setInt(1, order_id);
                            
                            insertIntoSalesTable.setInt(2, id.get(i));
                            
                            insertIntoSalesTable.setString(3, productNames.get(i));
                            
                            insertIntoSalesTable.setDouble(4, prices.get(i));
                            
                            insertIntoSalesTable.setInt(5, qty.get(i));
                            
                            insertIntoSalesTable.setInt(6, User.getUserId());
                            
                            int executeUpdateSalesTable = insertIntoSalesTable.executeUpdate();
                            
                            if (executeUpdateSalesTable == 1) {
                                out.println("Success");
                                
                            } else {
                                out.println("Failed for now Product name " + productNames.get(i));
                            }
                        }
                        //DECREMENT THE QUANTITY in the CART FROM products TABLE 
                    /*


                         UPDATE  `products` 
                         SET 
                         `product_qty` =  `product_qty` - 3
                         WHERE  `products`.`product_id` = 1 

                         UPDATE  `products` 
                         SET 
                         `product_qty` =  `product_qty` - 3
                         WHERE  `products`.`product_id` = 1 
                         AND
                         `product-name` = 'Assassins Creed'

                         */
                        
                        for (int i = 0; i < productNames.size(); i++) {
                            st.addBatch(
                                    " UPDATE  `products` "
                                    + " SET "
                                    + "`product_qty` =  `product_qty` - " + qty.get(i) + ""
                                    + " WHERE  `products`.`product_id` = " + id.get(i) + " "
                                    + " AND "
                                    + " `product-name` = '" + productNames.get(i) + "' ");
                            
                        }
                        int[] executeBatch = st.executeBatch();
                        int i = 0;
                        while (i < executeBatch.length) {
                            out.print("? --> " + executeBatch[i]);
                            i++;
                        }
                        c.commit();
                        response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                        
                    } else {
                        //not updated
        response.sendRedirect(request.getContextPath());
                    }
                    
                } catch (SQLException ex) {
                            try {
                            Logger.getLogger(buyItems.class.getName()).log(Level.SEVERE, null, ex);
                            c.rollback();  
                            String message, messageDetail;
                            String messageUrl = "/message.jsp";
                            RequestDispatcher dispatchMessage =
                                 request.getServletContext().getRequestDispatcher(messageUrl);
                            message = "Oops, Less Product Stock...!";
                            messageDetail = "We see that your demand for the product was critically higher than what we had in our inventory, We respect your purchase but your purchase was cancelled, We are sorry, but please in a urgent requirement do order less stock right now!!";
                            request.setAttribute("message", message);
                            request.setAttribute("messageDetail", messageDetail);
                            dispatchMessage.forward(request, response);
                                            //response.sendError(500);
                            
                                //response.sendRedirect("/saikiranBookstoreApp/buyItems.jsp");
                            } catch (SQLException ex1) {
                                //Logger.getLogger(buyItems.class.getName()).log(Level.SEVERE, null, ex1);
                                
                            String message, messageDetail;
                            String messageUrl = "/message.jsp";
                            RequestDispatcher dispatchMessage =
                                 request.getServletContext().getRequestDispatcher(messageUrl);
                            message = "Oops, Less Product Stock...!";
                            messageDetail = "We see that your demand for the product was critically higher than what we had in our inventory, We respect your purchase but your purchase was cancelled, We are sorry, but please in a urgent requirement do order less stock right now!!";
                            request.setAttribute("message", message);
                            request.setAttribute("messageDetail", messageDetail);
                            dispatchMessage.forward(request, response);
                                            //response.sendError(500);
                            }
                } catch (ClassNotFoundException ex) {
                    out.println("you user " + ex);
                    //response.sendRedirect("/saikiranBookstoreApp/buyItems.jsp");
                    
                }
                session.removeAttribute("cart");
            } else {
                //response.sendRedirect("/saikiranBookstoreApp/index.jsp");
                out.println ("No items in cart");
            }
            
        } else {
            //response.sendRedirect("/saikiranBookstoreApp/buyItems.jsp");
            out.println ("NOt validated");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
