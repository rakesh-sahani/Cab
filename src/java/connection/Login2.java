/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

public class Login2 extends HttpServlet {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    String uname = null;
    String pass = null;
    String utype = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        utype = request.getParameter("cmbtype");
        uname = request.getParameter("uname");
        pass = request.getParameter("txtpassword");

        if (pass != null) {
            try {
                con = connection.Connect.makeCon();
                String query = "select image from " + utype + " where uname='" + uname + "'and pass='" + pass + "'";

                System.out.println("query: " + query);

                pst = con.prepareStatement(query);
                rs = pst.executeQuery();
                if (rs.next()) {

                    if (utype.equals("login")) {

                        session.setAttribute("ADMIN", uname);
                        response.sendRedirect("UserList.jsp");

                    } else  {
                        String img = rs.getString(1);
                        session.setAttribute("IMG", img);
                        session.setAttribute("USER", uname);
                        response.sendRedirect("MyProfile.jsp");
                    }




                } else {


                    response.sendRedirect("Login.jsp");
                    session.setAttribute("LOGIN", "Invalid Username or Password!!!");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }


        }

    }
}
