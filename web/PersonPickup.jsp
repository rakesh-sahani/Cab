
<html>
  <%
                    String userid = (String) session.getAttribute("DR");

                    String msg = (String) session.getAttribute("MSG");
        %>
    <%@page import="java.sql.*" %>
    <head>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
            <%@include file="dr.html" %>
            <div id="body">
                <div id="content">
                    <h1>Flash Cab System</h1>
                    <div class="head1" align="center"><strong>Booking Details
                            Form</strong></div>
                    <div class="center-content" style="height: 530px; width: 900px; overflow: auto;">
                        <form  action="sign_Up" method="post" enctype="multipart/form-data">
                            <table width="100%">
                                <tr class="heading_lable">

                                    <td width="6%">
                                        &nbsp;&nbsp;&nbsp;Payment&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;&nbsp;ID&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;User&nbsp;Name&nbsp;&nbsp;
                                    </td>
                                    <td width="12%">
                                        &nbsp;&nbsp;From&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td width="12%">
                                        &nbsp;&nbsp;To&nbsp;&nbsp;&nbsp;
                                    </td>

                                    <td width="10%">
                                        &nbsp;&nbsp;Timing&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Member&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Driver&nbsp;No&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Driver&nbsp;Name&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Cab&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Contact&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Date&nbsp;&nbsp;
                                    </td>

                                </tr>
                                <%
                                            Connection con = null;
                                            PreparedStatement pst = null;
                                            ResultSet rst = null;
                                            try {
                                                con = connection.Connect.makeCon();
                                                String query = "select * from bookcabreply where a8 ='" + userid + "'";

                                                pst = con.prepareStatement(query);
                                                rst = pst.executeQuery();
                                                while (rst.next()) {

                                %>
                                <tr bgcolor="wheat">

                                    <td><a href="Payment.jsp?id=<%= rst.getString(1)%>">Payment</a></td>
                                    <td><%= rst.getString(1)%></td>
                                    <td><%= rst.getString(2)%></td>
                                    <td><%= rst.getString(3)%></td>
                                    <td><%= rst.getString(4)%></td>
                                    <td><%= rst.getString(5)%></td>
                                    <td><%= rst.getString(6)%></td>
                                    <td><%= rst.getString(7)%></td>
                                    <td><%= rst.getString(8)%></td>
                                    <td><%= rst.getString(9)%></td>
                                    <td><%= rst.getString(10)%></td>
                                    <td><%= rst.getString(11)%></td>
                                </tr>
                                <%

                                                }
                                            } catch (Exception e) {
                                            }


                                %>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <div id="footer">

                <p>
				Flash Cab &copy; 2014 | All Rights Reserved
                </p>
            </div>
        </div>
    </body>
</html>