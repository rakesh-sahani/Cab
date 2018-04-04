/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package connection;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;


/**
 *
 * @author Administrator
 */
public class Connect {
    static Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static Connection makeCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabmanagement", "root", "root");


        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static void CloseConnection() throws Exception {

        if (con != null) {
            con.close();
        }

    }

}
