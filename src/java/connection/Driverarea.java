/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class Driverarea extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    //define globle variable
    String enq_id = null;
    String fname = null;
    String cname = null;


    // @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        //accepted all field from enquiry.jsp form


        fname = request.getParameter("txtbranch");




        //insert in database
        if (fname != null) {
            try {
                conn =  connection.Connect.makeCon();
                String query = "insert into location(fname,enq_date) values(?,now())";
                pst = conn.prepareStatement(query);

                pst.setString(1, fname);



                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {

                    session.setAttribute("Message",fname);

                    response.sendRedirect("DriverDetails1.jsp");
                } else {
                    session.setAttribute("Message", "Sorry There is Some Problem!!");
                    response.sendRedirect("AttandanceSearch.jsp");
                }

            } catch (Exception e) {
            }

        } else {
            session.setAttribute("Message", "Sorry There is Some Problem!!");
            response.sendRedirect("AttandanceSearch.jsp");
        }

    }
}
