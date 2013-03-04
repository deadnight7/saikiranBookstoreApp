/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chirag
 */
@WebServlet(name = "addUserDetalsServlet", urlPatterns = {"/addUserDetalsServlet"})
public class addUserDetalsServlet extends HttpServlet {

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
            out.println("<title>Servlet addUserDetalsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addUserDetalsServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        Connection c;

        String username, age, gender, address, mobileNum_s;
        username = request.getParameter("username");
        age = request.getParameter("age");
        gender = request.getParameter("gender");
        address = request.getParameter("address");
        mobileNum_s = request.getParameter("mobileNum");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //out.println(" "+username+" "+age+" "+gender+" "+address+" ");
        // UPDATE THE USER DETAILS TABLE AND SESSION and 
        // 2. FETCH THE VALUES
        // 3. IF USER FILLED IN DETAILS EARLIER?
        // 4. UPDATE ON EXISTING ONES
        // 5. ELSE INSERT FRESHLY
        user User;
        HttpSession session = request.getSession();
        User = (user) session.getAttribute("user");

        
        if (User != null) {
            try {
                //SESSION IS SET EARLIER
                String addressSess = User.getAddress();
                c = new DB_Conn().getConnection();
                
                    if (username.trim().length() > 1 ){
                        if (mobileNum_s.trim().length() <= 12 && mobileNum_s.trim().length()>=3 ){
                            if (address.trim().length() >5){
                                    if (addressSess == null) {
                                            //No INSERTION EARLIER FRESH Det.
                                            String insertDetails = "INSERT INTO  `saikiran enterprises`.`user-details` ("
                                                    + "`userDetail_Id` ,"
                                                    + "`user_id` ,"
                                                    + "`username` ,"
                                                    + "`address` ,"
                                                    + "`gender` ,"
                                                    + "`userImage` ,"
                                                    + "`mobile_no` "
                                                    + " )"
                                                    + "VALUES ("
                                                    + "NULL ,  ?,  ?,  ?,  ?,  '', ? "
                                                    + ");";
                                            PreparedStatement psmt = c.prepareStatement(insertDetails);
                                            psmt.setInt(1, User.getUserId());
                                            psmt.setString(2, username);
                                            psmt.setString(3, address);
                                            psmt.setString(4, gender);
                                            psmt.setString(5, mobileNum_s);
                                            psmt.executeUpdate();
                                            out.println ("done!");
                                            User.setUserEmail(User.getUserEmail());
                                         } else { // UPDATE THE EXISTING USER DETAILS
                                        /*
                                         *          SET NEW VALUES TO SESSION
                                         */
                                        String insertDetails = " UPDATE  `user-details` "
                                                              + "SET  " +
                                                        "`username` =  ?," +
                                                        "`address` =  ?," +
                                                        "`gender` =  ?,"
                                                        + "`mobile_no` = ?"
                                                + " WHERE  `user-details`.`user_id` =  ?;" ;
                                            PreparedStatement psmt = c.prepareStatement(insertDetails);
                                            psmt.setInt(5, User.getUserId());
                                            psmt.setString(1, username);
                                            psmt.setString(2, address);
                                            psmt.setString(3, gender);
                                            psmt.setString(4, mobileNum_s);
                                            psmt.executeUpdate();
                                            out.println ("done! Updating");
                                            User.setUserEmail(User.getUserEmail());
                                    }   
                                    out.println ("<a href='userinfo.jsp'>User Info</a>");

                            }else {
                                response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                            }
                        }else {
                            response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                     }
                }
                response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                     
            } 
            catch (NumberFormatException ex){
                out.println(ex);
                 response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                     
            }
            catch (SQLException ex) {
                Logger.getLogger(addUserDetalsServlet.class.getName()).log(Level.SEVERE, null, ex);
                out.println(ex); 
                response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                     
                //response.sendError(404);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(addUserDetalsServlet.class.getName()).log(Level.SEVERE, null, ex);
                out.println(ex); 
                response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
                     
            }
        } else { 
            response.sendRedirect(request.getContextPath());
                     
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
