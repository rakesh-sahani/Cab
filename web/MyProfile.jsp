
<html>
        <script type="text/javascript">
            function contact(i)
            {
                if(i.value.length>0)
                {
                    i.value = i.value.replace(/[^\d]+/g, '');

                }
            }
                function mob()
            {
                var rl=document.getElementById("number").value;
                if(rl.toString().length<10)
                {
                    alert("Contact No. should be of ten digits");
                    return false;
                }

            }
               function valid() {
                //alert('calling');
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                // var address = document.forms[form_id].elements[txtemail_id].value;
                var address = document.getElementById('txtemail').value;
                if(reg.test(address) == false) {
                    alert('Invalid Email Address');
                    return false;
                }
            }

        </script>
 
  <%
                    String userid = (String) session.getAttribute("USER");

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
  <%@include file="user.html" %>
            <div id="body">
                <div id="content">
                    <h1>Flash Cab System</h1>

                            <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                               <tr>
                            <td width="20%">
                                <table>
                                    <tr>
                                        <td class="text" colspan="1">

                                            You are Welcome Mr.&nbsp;&nbsp;&nbsp;&nbsp;


                                            <%=userid%>
                                        </td>
                                        <%
                                                    String imgpath = (String) session.getAttribute("IMG");
                                        %>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="UploadedImage/<%=imgpath%>" height="100x" width="100px;"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>





                            <td width="80%">
                                <form  action="editMyAccount" method="post">
                                    <table  border="0" cellspacing="20" cellpadding="8" style align="center" width="100%">

                                        <tr>
                                            <td>
                                                <fieldset>
                                                    <legend>Personal Information</legend>
                                                    <table cellpadding="5" cellspacing="5" width="100%">
                                                        <%
                                                                    if (msg != null) {
                                                        %>
                                                        <tr>
                                                            <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="4"><%=msg%></td>
                                                        </tr>
                                                        <%
                                                                        session.removeAttribute("MSG1");
                                                                    } else {
                                                                        session.setAttribute("MSG1", "");
                                                                    }
                                                        %>
                                                        <%
                                                                    Connection con = null;
                                                                    PreparedStatement pst = null;
                                                                    ResultSet rst = null;
                                                                    try {
                                                                        con = connection.Connect.makeCon();
                                                                        String query = "select * from signup where uname ='" + userid + "'";
                                                                        pst = con.prepareStatement(query);
                                                                        rst = pst.executeQuery();
                                                                        while (rst.next()) {

                                                                            String user_id = rst.getString(1);

                                                                            String fname = rst.getString(4);
                                                                            String lname = rst.getString(5);
                                                                            String gender = rst.getString(6);
                                                                            String dob = rst.getString(7);
                                                                            String cno = rst.getString(8);
                                                                            String email = rst.getString(9);
                                                                            String add = rst.getString(10);
                                                                            String city = rst.getString(11);
                                                                            String pin = rst.getString(12);
                                                                            String state = rst.getString(13);
                                                                            String country = rst.getString(14);


                                                        %>


                                                        <tr>
                                                            <td class="text"><span style="color: red;">*</span>First&nbsp;Name:</td>
                                                            <td>
                                                                <input type="text" size="25"  id="txtname" name="txtname" onblur=" CheckForAlphabets(this)" value="<%=fname%>">
                                                                <input type="hidden" name="hiduid" id="hiduid" value="<%=user_id%>">
                                                            </td>
                                                            <td class="text"><span style="color: red;">*</span>Last&nbsp;Name:</td>
                                                            <td><input type= text size="25"  id="txtlname" name="txtlname" onblur=" CheckForAlphabets(this)" value="<%=lname%>" ></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text"><span style="color: red;">*</span>
                                                                Gender
                                                            </td>
                                                            <td>
                                                                <select  id="cmbgender"name="cmbgender" style="width: 180px" >
                                                                    <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                                    <option value="Male">Male</option>
                                                                    <option value="Female">Female</option>
                                                                    <option value="<%=gender%>" selected><%=gender%></option>
                                                                </select>
                                                            </td>
                                                            <td class="text"><span style="color: red;">*</span>Date&nbsp;of&nbsp;Birth</td>
                                                            <td><input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this,event)" value="<%=dob%>"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text"><span style="color: red;">*</span>Contact&nbsp;Number:</td>
                                                            <td><input type= text size="25"  id="number" name="number" onkeyup="CheckForIntegers(this)" onblur="mob(this)" value="<%=cno%>"></td>
                                                            <td class="text"><span style="color: red;">*</span>Email&nbsp;Id:</td>
                                                            <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur=" mail()" value="<%=email%>"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text">Address:</td>
                                                            <td><input type= text size="25"  id="txtaddress" name="txtaddress" value="<%=add%>" ></td>

                                                            <td class="text">City:</td>
                                                            <td>
                                                                <select id="cmbcity"   name="cmbcity" style="width: 180px;">
                                                                    <option value="Select"> Select </option>
                                                                    <option value="Delhi">  Delhi </option>
                                                                    <option value="Gurgoan"> Gurgoan </option>
                                                                    <option value="Noida"> Noida </option>
                                                                    <option value="<%=city%>" selected><%=city%></option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text">Pin&nbsp;Code:</td>
                                                            <td> <input type= text size="25"  id="txtpin" name="txtpin" value="<%=pin%>"></td>
                                                            <td class="text">State:</td>
                                                            <td><input type= text size="25"  id="txtstate" name="txtstate" value="<%=state%>"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text">Country:</td>
                                                            <td>
                                                                <select  id="cmbcountry"name="cmbcountry" style="width:180px">
                                                                    <option value="Select">- - - - Select - - - - </option>
                                                                    <option value="America">America</option>
                                                                    <option value="Australia">Australia</option>
                                                                    <option value="Africa">Africa</option>
                                                                    <option value="Bangalore">Bangalore</option>
                                                                    <option value="Bangkok">Bangkok</option>
                                                                    <option value="India">India</option>
                                                                    <option value="<%=country%>" selected><%=country%></option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <%

                                                                        }
                                                                    } catch (Exception e) {
                                                                        e.printStackTrace();
                                                                    }


                                                        %>
                                                        <tr><td>&nbsp;</td></tr>
                                                        <tr>
                                                            <td align="center" colspan="4" >
                                                                <input type="submit" onclick= "return valid2()"value="Edit" class="button">
                                                                <input type="reset" value="Reset" class="button">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>

                                    </table>
                                </form>
                            </td>

                        </tr>
                            </table>
                 
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