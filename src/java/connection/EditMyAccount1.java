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

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class EditMyAccount1 extends HttpServlet {

    PreparedStatement pst = null;
    Connection con = null;
    ResultSet rst = null;
    String userid = null;
    String pwd = null;
    String fname = null;
    String lname = null;
    String gender = null;
    String dob = null;
    String contactNo = null;
    String emailId = null;
    String addr = null;
    String city = null;
    String pincode = null;
    String state = null;
    String country = null;
    String result = "";
    int i = 0;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        userid = request.getParameter("hiduid");

        fname = request.getParameter("txtname");
        lname = request.getParameter("txtlname");
        gender = request.getParameter("cmbgender");
        dob = request.getParameter("txtdb");
        contactNo = request.getParameter("number");
        emailId = request.getParameter("txtemail");
        addr = request.getParameter("txtaddress");
        city = request.getParameter("cmbcity");
        pincode = request.getParameter("txtpin");
        state = request.getParameter("txtstate");
        country = request.getParameter("cmbcountry");
        if (userid != null) {
            try {
                con = connection.Connect.makeCon();
                String query = "update driverdetails set FirstName=?,LastName=?,Gender=?,DOB=?,ContactNo=?,EmailID=?,Address=?,City=?,PinCode=?,State=?,Country=? where userid='" + userid + "'";
                //System.out.println("Query    :" + query);
                pst = con.prepareStatement(query);
                pst.setString(1, fname);
                pst.setString(2, lname);
                pst.setString(3, gender);
                pst.setString(4, dob);
                pst.setString(5, contactNo);
                pst.setString(6, emailId);
                pst.setString(7, addr);
                pst.setString(8, city);
                pst.setString(9, pincode);
                pst.setString(10, state);
                pst.setString(11, country);
                i = pst.executeUpdate();
                if (i > 0) {
                    session.setAttribute("MSG", "Your Account is  Successfully Updated!!.");
                    response.sendRedirect("MyProfile.jsp");
                } else {
                    session.setAttribute("MSG", "Your Account is Not Updated !");
                    response.sendRedirect("MyProfile.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
