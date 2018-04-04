
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
            <%@include file="user.html" %>
            <div id="body">
                <div id="content">
                    <h1>Flash Cab System</h1>
                    <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>Change Password</legend>
                                    <form method="post" action="changePassword">
                                        <table width="500px" align="center" cellpadding="4" cellspacing="4">


                                            <tr>
                                                <td class="text">Old Password</td>
                                                <td><input type="text" name="txtopwd" id="txtopwd" class="input_text" size="30"></td>
                                            </tr>
                                            <tr>
                                                <td class="text">New Password</td>
                                                <td><input type="password" name="txtnpwd" id="txtnpwd" class="input_text" size="30"></td>
                                            </tr>
                                            <tr>
                                                <td class="text">Confirm Password</td>
                                                <td><input type="password" name="txtcpwd" id="txtcpwd" class="input_text" size="30"></td>
                                            </tr>


                                            <tr><td>&nbsp;</td></tr>
                                            <tr valign="top">

                                                <td>
                                                    <input type="submit" value="Change" name="btnsubmit" class="button">
                                                    <input type="reset" value="Reset" name="btnreset" class="button">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </fieldset>
                            </td>
                        </tr>

                        <tr>
                            <td align="center" style="color: red"><%=msg%></td>
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