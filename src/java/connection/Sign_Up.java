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
import javax.servlet.http.HttpSession;
import java.util.*;
import java.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;

/**
 *
 * @author softavate
 */
public class Sign_Up extends HttpServlet {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String pname = null;
    String pname1 = null;
    String userid = null;
    String uname = null;
    String password = null;
    String fname = null;
    String lname = null;
    String gender = null;
    String dob = null;
    String contactNo = null;
    String emailid = null;
    String address = null;
    String city = null;
    String pincode = null;
    String state = null;
    String country = null;
    String fullImagepath = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String size1 = request.getParameter("txtsiz");

        PrintWriter out = response.getWriter();
        int i = 0;
        response.setContentType("text/html");
        ServletConfig config = getServletConfig();
        String context = config.getServletContext().getRealPath("/");
        String imagePath = context + "UploadedImage";
        boolean status = false;
        String fullfilename = null;
        java.util.Date d = new java.util.Date();
        long timestamp = d.getTime();
        try {
            File projectDir = new File("imagePath");
            if (!projectDir.exists()) {
                projectDir.mkdirs();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean isMultipart = ServletFileUpload.isMultipartContent(new ServletRequestContext(request));
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List/*FileItem*/ items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        if (item.getFieldName().equalsIgnoreCase("txthidden")) {
                            userid = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("uname")) {
                            uname = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("pwd")) {
                            password = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtname")) {
                            fname = item.getString();
                            System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtlname")) {
                            lname = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("cmbgender")) {
                            gender = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtdb")) {
                            dob = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("number")) {
                            contactNo = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtemail")) {
                            emailid = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtaddress")) {
                            address = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("cmbcity")) {
                            city = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtpin")) {
                            pincode = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtstate")) {
                            state = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("cmbcountry")) {
                            country = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                    } else {
                        fullfilename = "UserImage" + "_" + timestamp;
                        System.out.println("fullfilename : " + fullfilename);
                        if (item.getFieldName().equalsIgnoreCase("txtImage")) {
                            String filename = item.getName();
                            if (!filename.equalsIgnoreCase("")) {
                                pname = filename.substring(filename.lastIndexOf("."), filename.length());
                                pname1 = imagePath + File.separator + fullfilename + pname;
                                fullImagepath = fullfilename + pname;
                                File file3 = new File(pname1);
                                try {
                                    item.write(file3);
                                    status = true;
                                } catch (Exception e1) {
                                    e1.printStackTrace();
                                    status = false;
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
            }
        }
        String msg = null;
        if (status == true) {
            try {
                Connection con2 = connection.Connect.makeCon();
                PreparedStatement pst = null;
                String sqlquery = "insert into SignUp(UserID,Image,uname,pass,FirstName,LastName,Gender,DOB,ContactNo,EmailID,Address,City,PinCode,State,Country)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                System.out.println(" sql query : " + sqlquery);
                pst = con2.prepareStatement(sqlquery);
                pst.setString(1, userid);
                pst.setString(2, fullImagepath);
                pst.setString(3, uname);
                pst.setString(4, password);
                pst.setString(5, fname);
                pst.setString(6, lname);
                pst.setString(7, gender);
                pst.setString(8, dob);
                pst.setString(9, contactNo);
                pst.setString(10, emailid);
                pst.setString(11, address);
                pst.setString(12, city);
                pst.setString(13, pincode);
                pst.setString(14, state);
                pst.setString(15, country);
                i = pst.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (i > 0) {
                         connection.Auto_Gen_ID.updateAutoID("user", userid);
                msg = "Successfully Registered";
                session = request.getSession(true);
                session.setAttribute("MSG", msg);
                response.sendRedirect("Signup.jsp");

            } else {
                msg = "Not Registered";
                session = request.getSession(true);
                session.setAttribute("MSG", msg);
                response.sendRedirect("Signup.jsp");
            }
        }
        if (status == false) {
            msg = "Not Registered";
            session = request.getSession(true);
            session.setAttribute("MSG", msg);
            response.sendRedirect("Signup.jsp");
        }
    }
}
