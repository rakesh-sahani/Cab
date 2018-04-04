package connection;

import java.io.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetAccount extends HttpServlet {

    String result = "NA";
    String id = null;
    //String br = null;
    Connection con = null;
    ResultSet rst = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        //br = (String) session.getAttribute("BRANCH");

        id = request.getParameter("id");
         System.out.println("class id is "+id);
        try {
            con = connection.Connect.makeCon();
            // System.out.println("Connection established");
            PreparedStatement pst = con.prepareStatement("select uname,cabdetails,ContactNo from driverdetails where UserID='" + id + "' ");
            //pst.setString(1, id);
            rst = pst.executeQuery();
            result = "NA";
            while (rst.next()) {
                result = rst.getString(1) + ":" + rst.getString(2)+ ":" + rst.getString(3);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // System.out.println("Sec rest is " + result);
        out.write("<status><account>" + result + "</account></status>");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
    }
}
