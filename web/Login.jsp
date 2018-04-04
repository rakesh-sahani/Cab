
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
            String msg = (String) session.getAttribute("MSG");
            String id = connection.Auto_Gen_ID.globalGenId("User-", "user");
%>
    <head>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
  <%@include file="header.html" %>
            <div id="body">
                <div id="content">
                    <h1>Flash Cab System</h1>
              <form action="login" method="post">
                <table align="center" width="100%" cellpadding="0" cellspacing="0">
                    <tr><td height="100"></td></tr>
                    <tr valign="middle">
                        <td width="100%" align="center">
                            <table border="0" cellpadding="5" cellspacing="5">
                                <tr>
                                    <td colspan="3" align="">
                                        <div style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><img src="images/user_login.jpg"></td>
                                    <td align="left">
                                        <fieldset class="fieldset" style="width: 300px;">
                                            <legend class="legand1">Login</legend>
                                       <form method="post" action="login">
                                <table width="100%" cellpadding="10" cellspacing="10">
                                    <tr>
                                        <td class="heading" colspan="2" valign="middle">
                                            <strong style="vertical-align: middle;margin-bottom: 5px;">Login</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="login-text">
                                            Login&nbsp;Type
                                        </td>
                                        <td align="right">
                                            <select name="cmbtype" id="cmbtype" class="login-text" style="width: 150px;">
                                                <option value="na"> -  - - - Select - - - - -</option>
                                                <option value="login">Admin</option>
                                                <option value="signup">User</option>
                                                  <option value="driverdetails">Driver</option>


                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="login-text" valign="top">
                                            &nbsp;User&nbsp;Name&nbsp;
                                        </td>
                                        <td valign="top" align="right">
                                            <input type="text" name="uname" id="uname" size="20px" class="input-text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="login-text">
                                            &nbsp;Password&nbsp;
                                        </td>
                                        <td align="right">
                                            <input type="password" name="txtpassword" id="txtpassword" size="20px" class="input-text">
                                        </td>
                                    </tr>
                                    <%
                                                if (msg != null) {
                                    %>
                                    <tr>
                                        <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="2"><%=msg%></td>
                                    </tr>
                                    <%
                                                    session.removeAttribute("MSG");
                                                } else {
                                                    session.setAttribute("MSG", "");
                                                }
                                    %>
                                    <tr valign="top">
                                        <td  style="height:34px" align="right" colspan="2">
                                            <button type="submit" name="submitbtn" id="submitbtn" style="border: 0; background: transparent" onclick="return validateLogin();">
                                                <img src="images/login.gif" alt="submit" width="52" height="23" border="0" />
                                            </button>
                                        </td>
                                    </tr>


                                </table>
                            </form>
                                        </fieldset>
                                    </td>
                                    <td><img src="images/user_login.jpg"></td>
                                </tr>

                            </table>
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