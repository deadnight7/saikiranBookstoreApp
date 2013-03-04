/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import database.DB_Conn;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author chirag
 */
public class administrator {
    Connection c;
    String admin_email = null;

    public ArrayList<String> getListsOfAdmin() throws SQLException, ClassNotFoundException {
        c = new DB_Conn().getConnection();
        String getAdministratorsEmail = " SELECT * "
                        +" FROM  `user` ";
        
        Statement st = c.createStatement();
        ResultSet executeQuery = st.executeQuery(getAdministratorsEmail);
        listsOfAdmin.clear();
        while (executeQuery.next()){
            listsOfAdmin.add(executeQuery.getString("email"));
        }
        return listsOfAdmin;
    }
    ArrayList <String> listsOfAdmin = new ArrayList<String>();
    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }
    
}
