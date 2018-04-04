
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
                String userid = (String) session.getAttribute("DR");
                String id = request.getParameter("id");
                String msg = (String) session.getAttribute("MSG");
    %>
    <head>

        <script type="text/javascript">

        function cal()
        {
            var p1=document.getElementById("totalkm").value;
            var r1 = parseInt(p1);




            var total1 = r1*10;
            document.getElementById("totalpay").value=total1;



        }
    </script>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>     <%@page import="java.sql.*" %>
    <body>
        <div id="page">
            <%@include file="dr.html" %>
            <div id="body">
                <div id="content">
                    <h1>Payment Details</h1>
                    <form  action="payment" method="post">
                        <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                            <%
                                        Connection con = null;
                                        PreparedStatement pst = null;
                                        ResultSet rst = null;
                                        try {
                                            con = connection.Connect.makeCon();
                                            String query = "select * from bookcabreply where a1 ='" + id + "'";
                                            pst = con.prepareStatement(query);
                                            rst = pst.executeQuery();
                                            while (rst.next()) {



                                                String a2 = rst.getString(2);
                                                String a3 = rst.getString(3);
                                                String a4 = rst.getString(4);
                                                String a5 = rst.getString(5);
                                                String a6 = rst.getString(6);
                                                String a7 = rst.getString(7);
                                                String a8 = rst.getString(8);
                                                String a9 = rst.getString(9);
                                                String a10 = rst.getString(10);



                            %>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Booking Information</legend>
                                        <table cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td class="text"><span style="color: red;"></span>Booking Id:</td>
                                                <td> <input type= "text" size="25"  id="txthidden" name="txthidden" value="<%=id%>"></td>
                                                <td class="text"><span style="color: gray;">*</span> User Name:</td>
                                                <td class="text-1"><input type="text" size="25"  id="uname" name="uname" value="<%=a2%>"></td>

                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Pick UP Place :</td>
                                                <td> <input type= "text" size="25"  id="pick" name="pick" value="<%=a3%>"></td>
                                                <td class="text"><span style="color: red;">*</span>Drop Place:</td>
                                                <td> <input type= "text" size="25"  id="drop" name="drop" value="<%=a4%>"></td>

                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Pick Up Timing:</td>
                                                <td> <input type= "text" size="25"  id="picktime" name="picktime" value="<%=a5%>"></td>
                                                <td class="text"><span style="color: red;">*</span>No Of Member:</td>
                                                <td> <input type= "text" size="25"  id="nomem" name="nomem" value="<%=a6%>"></td>

                                            </tr>

                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Driver Information</legend>
                                        <table cellpadding="5" cellspacing="5">

                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Driver ID</td>

                                                <td> <input type= "text" size="25"  id="cmbempid" name="cmbempid" value="<%=a7%>"></td>
                                                <td class="text"><span style="color: red;">*</span>Driver Name:</td>
                                                <td><input type="text" size="25" id="txtdname" name="txtdname" value="<%=a8%>"></td>
                                            </tr>
                                            <tr>
                                                <td class="text">Cab Number:</td>
                                                <td><input type= text size="25"  id="txtcabn" name="txtcabn" value="<%=a9%>"></td>


                                            </tr>
                                            <%

                                                            }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }


                                            %>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                                 <tr>
                                <td>
                                    <fieldset>
                                        <legend>Payment Information</legend>
                                        <table cellpadding="5" cellspacing="5">
  <tr>


                                                <td class="text">
                                                    Total&nbsp;KM&nbsp;
                                                </td>
                                                <td> <input type= "text" size="25"  id="totalkm" name="totalkm" onblur="cal()"></td>
  </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Total&nbsp;&nbsp;:</td>
                                                <td> <input type= "text" size="25"  id="totalpay" name="totalpay"></td>

                                            </tr>


                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                                <tr>
                                <td>
                                    <fieldset>
                                        <legend>Driver Information</legend>
                                        <table cellpadding="5" cellspacing="5">

                                              <tr>
                                <td>
                                    Mode Of Payment :
                                </td>
                                <td>
                                    <select name="cmbBankName" id="cmbBankName">
                                        <option value="-1">--Select--</option>
                                        <option value="Debit Card">Debit Card</option>
                                        <option value="Credit Card">Credit Card</option>

                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    Bank :
                                </td>
                                <td>
                                    <select name="cmbBankName" id="cmbBankName">
                                        <option value="-1">--Select--</option>
                                        <option value="State Bank Of India">State Bank Of India</option>
                                        <option value="Punjab National Bank">Punjab National Bank</option>
                                        <option value="Bank Of Baroda">Bank Of Baroda</option>
                                        <option value="Allahabad Bank">Allahabad Bank</option>
                                        <option value="Federal Bank">Federal Bank</option>
                                        <option value="Uco Bank">Uco Bank</option>
                                        <option value="HDFC Bank">HDFC Bank</option>
                                        <option value="Andhra Bank">Andhra Bank</option>
                                        <option value="Axis Bank">Axis Bank</option>
                                        <option value="ICICI Bank">ICICI Bank</option>
                                        <option value="Karnatka Bank">Karnataka Bank</option>
                                        <option value="Co Operative Bank">Co Operative Bank</option>
                                        <option value="Union Bank">Union Bank</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Price :
                                </td>
                                <td>
                                <input type="text" name="txtAccount" id="txtAccount" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Card No :
                                </td>
                                <td>
                                    <input type="text" name="txtAccount" id="txtAccount" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    CVV Number :
                                </td>
                                <td>
                                    <input type="password" name="txtPaassword" id="txtPaassword" />
                                </td>
                            </tr>
                                       
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="color: red"><%=msg%></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" >
                                    <input type="submit" value="GO" onclick="return validate();">
                                    <input type= "reset" value="Reset">
                                </td>
                            </tr>
                        </table>
                    </form>
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