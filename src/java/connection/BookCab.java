/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class BookCab extends HttpServlet {

    static Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String a1 = null;
    String a2 = null;
    String a3 = null;
    String a4 = null;
    String a5 = null;
    String a6 = null;
    String a7 = null;
    String a8 = null;
    String a9 = null;
    String a10 = null;
    String a11 = null;
    String a12 = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        a1 = request.getParameter("txthidden");
        a2 = request.getParameter("uname");
        a3 = request.getParameter("pick");
        a4 = request.getParameter("drop");
        a5 = request.getParameter("picktime");
        a6 = request.getParameter("nomem");
        a7 = request.getParameter("number");
        a8 = request.getParameter("txtemail");
        a9 = request.getParameter("txtaddress");
        a10 = request.getParameter("cmbcity");


        if (a1 != null) {
            try {
                conn = connection.Connect.makeCon();
                String query = "Insert into bookcab(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,date)values(?,?,?,?,?,?,?,?,?,?,now())";
                System.out.println("cccccccc" + query);
                pst = conn.prepareStatement(query);
                pst.setString(1, a1);
                pst.setString(2, a2);
                pst.setString(3, a3);
                pst.setString(4, a4);
                pst.setString(5, a5);
                pst.setString(6, a6);
                pst.setString(7, a7);
                pst.setString(8, a8);
                pst.setString(9, a9);
                pst.setString(10, a10);

                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
          connection.Auto_Gen_ID.updateAutoID("b", a1);
                    response.sendRedirect("BookCab.jsp");
                } else {

                    response.sendRedirect("BookCab.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }
}
