/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loginRegister;

import database.DB_Conn;
import helpers.SecureSHA1;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chirag
 */
public class changeMyPassword extends HttpServlet {

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
            out.println("<title>Servlet changeMyPassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeMyPassword at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        try {        
            //processRequest(request, response);
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            
            String changePassword = "UPDATE  `saikiran enterprises`.`user` SET  `pass` = SHA1(  ? ) WHERE  `user`.`email` =?;";
            
            DB_Conn con = new DB_Conn();
            Connection c  = con.getConnection();
            PreparedStatement psmt = c.prepareStatement(changePassword);
            psmt.setString(1, pass);
            psmt.setString(2, email);
            int i = psmt.executeUpdate();
            PrintWriter out =response.getWriter();
            if(i==1){
                out.println("Password Updated... Try to login now!!");
            }
            if (i==0){
                out.println("Password Updated... Try to login now!!");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(changeMyPassword.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out =response.getWriter();
            out.println("Eror in Process "+ex);
            response.sendError(404);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(changeMyPassword.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out =response.getWriter();
            out.println("Eror in Process "+ex);
            response.sendError(404);
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
