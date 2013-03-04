/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import cart.cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chirag
 */
public class removeCartProduct extends HttpServlet {

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
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet removeCartProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet removeCartProduct at " + request.getContextPath() + "</h1>");
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
        try {
            //processRequest(request, response);
            response.setContentType("text/html");
            String id =  request.getParameter("id");
            int intId = Integer.parseInt(id);
            PrintWriter out = response.getWriter();
            out.println ("Id of the product "+id );
            HttpSession session = request.getSession();
            cart cart;
            cart = (cart) session.getAttribute("cart");
            
            response.setContentType("text/html;charset=UTF-8");
                    out.println("<br/>Total value price of the cart " + cart.getTotalPriceOfCart());
                    ArrayList<String> productNames = new ArrayList();
                    ArrayList<Double> productPrices = new ArrayList();
                    ArrayList<Integer> Qty = new ArrayList();
                    ArrayList <Integer> ids = new ArrayList();
                    
                    productNames = cart.getProductNames();
                    productPrices = cart.getPrices();
                    Qty = cart.getQty();
                    ids = cart.getId();
                    
                    cart.removeProduct(intId);
                    
                    out.println("<a href='/MyCartApplication/addToCart.jsp'>Goto Cart</a>");
            /*if (Cart.removeProduct(intId)){
                out.println("Ok Removed!!");
                //response.sendRedirect("/MyCartApplication/");
            }
            else {
                out.println("Not removed!!");
            }*/
        } catch (SQLException ex) {
            Logger.getLogger(removeCartProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(removeCartProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        processRequest(request, response);
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
