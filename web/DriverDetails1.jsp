
<html>

    <%@page import="java.sql.*" %>
    <head>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
            <%@include file="admin.html" %>
            <div id="body">
                <div id="content">
                    <h1>Flash Cab System</h1>
                    <div class="head1" align="center"><strong>Driver List Form</strong></div>
                    <div class="center-content" style="height: 530px; width: 900px; overflow: auto;">
                        <form  action="sign_Up" method="post" enctype="multipart/form-data">
                            <table width="100%">
                          <%
                    String msg = (String) session.getAttribute("Message");

        %>



                                <tr class="heading_lable">
                                    <td width="8%">
                                        &nbsp;&nbsp;Driver&nbsp;ID&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Driver&nbsp;Name&nbsp;&nbsp;
                                    </td>
                                    <td width="8%">
                                        &nbsp;&nbsp;Cab&nbsp;Allocation&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Route&nbsp;Allocation&nbsp;&nbsp;
                                    </td>
                                    <td width="8%">
                                        &nbsp;&nbsp;Passport&nbsp;Image&nbsp;&nbsp;
                                    </td>
                                    <td width="8%">
                                        &nbsp;&nbsp;Driver&nbsp;Licance&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Voter&nbsp;ID&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Adhar&nbsp;ID&nbsp;&nbsp;
                                    </td>

                                    <td width="10%">
                                        &nbsp;&nbsp;Driver&nbsp;Name&nbsp;&nbsp;
                                    </td>
                                    <td width="12%">
                                        &nbsp;&nbsp;First&nbsp;Name&nbsp;&nbsp;
                                    </td>
                                    <td width="12%">
                                        &nbsp;&nbsp;Last&nbsp;Name&nbsp;&nbsp;
                                    </td>

                                    <td width="10%">
                                        &nbsp;&nbsp;Gender&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;DOB&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Contact&nbsp;No&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Email&nbsp;ID&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;City&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Pin Code&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Address&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Country&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <%
                                            Connection con = null;
                                            PreparedStatement pst = null;
                                            ResultSet rst = null;
                                            try {
                                                con = connection.Connect.makeCon();
                                                String query = "select * from driverdetails where routeallo ='" + msg + "'";

                                                pst = con.prepareStatement(query);
                                                rst = pst.executeQuery();
                                                while (rst.next()) {

                                %>
                                <tr bgcolor="wheat">
                                    <td><%= rst.getString(1)%></td>
                                    <td><%= rst.getString(2)%></td>
                                    <td><%= rst.getString(4)%></td>
                                    <td><%= rst.getString(5)%></td>
                                    <td  align="center"><a href="UploadedImage/<%= rst.getString(6)%>">Downloads</a></td>
                                    <td  align="center"><a href="UploadedImage/<%= rst.getString(7)%>">Downloads</a></td>
                                    <td  align="center"><a href="UploadedImage/<%= rst.getString(8)%>">Downloads</a></td>
                                    <td  align="center"><a href="UploadedImage/<%= rst.getString(9)%>">Downloads</a></td>

                                    <td><%= rst.getString(10)%></td>
                                    <td><%= rst.getString(11)%></td>
                                    <td><%= rst.getString(12)%></td>
                                    <td><%= rst.getString(13)%></td>
                                    <td><%= rst.getString(14)%></td>
                                    <td><%= rst.getString(15)%></td>
                                    <td><%= rst.getString(16)%></td>
                                    <td><%= rst.getString(17)%></td>
                                    <td><%= rst.getString(18)%></td>
                                    <td><%= rst.getString(19)%></td>
                                    <td><%= rst.getString(20)%></td>
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