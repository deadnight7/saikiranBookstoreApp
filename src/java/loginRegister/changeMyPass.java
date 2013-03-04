/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loginRegister;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.user;

/**
 *
 * @author chirag
 */
public class changeMyPass extends HttpServlet {

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
            out.println("<title>Servlet changeMyPass</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeMyPass at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException {try {        
            //processRequest(request, response);
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            if (email == null){
                HttpSession session = request.getSession();
                user User = (user)session.getAttribute ("user");
                email = User.getUserEmail();
            }
            String changePassword = 
                    "UPDATE  "
                    + "`saikiran enterprises`.`user` "
                    + " SET  `pass` = SHA1( '"+pass+"' ) "
                    + "WHERE  `user`.`email` ='"+email+"';";
            
            DB_Conn con = new DB_Conn();
            Connection c  = con.getConnection();
            Statement psmt = c.createStatement();
            
            
            int i = psmt.executeUpdate(changePassword);
            PrintWriter out =response.getWriter();
            if(i==1){
                out.println("Password Updated... Try to login now!!"+email+pass);
            }
            if (i==0){
                out.println("Password Not Updated... Try to login now!!"+email+pass);
            }
            response.sendRedirect(request.getContextPath()+"/userinfo.jsp");
            
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
