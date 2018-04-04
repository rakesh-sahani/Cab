
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
                String userid = (String) session.getAttribute("STU");
                String id = request.getParameter("id");
                String msg = (String) session.getAttribute("MSG");
    %>
    <head>

        <script language="javascript">
            var xmlHttpRequest;
            function getNameFee(id)
            {
                var xmlHttpRequest=init();

                function init()
                {
                    if (window.XMLHttpRequest){
                        return new XMLHttpRequest();}
                    else if (window.ActiveXObject){
                        return new ActiveXObject("Microsoft.XMLHTTP");}
                }

                //var classid=document.getElementById('cmbclass').value;
                xmlHttpRequest.open("GET", "getAccount?id="+escape(id),true);
                xmlHttpRequest.onreadystatechange=processRequest;
                xmlHttpRequest.send(null);

                function processRequest()
                {
                    if(xmlHttpRequest.readyState==4)
                    {
                        if(xmlHttpRequest.status==200)
                        {
                            processResponse();
                        }
                    }
                }

                function processResponse()
                {
                    var xmlMessage=xmlHttpRequest.responseXML;
                    var result=xmlMessage.getElementsByTagName("account")[0].firstChild.nodeValue;

                    if(result=="NA")
                    {
                        alert("Account No. is not valid");
                        document.getElementById('txtname').value="";
                        return;
                    }

                    var res=result.split(":");
                    document.getElementById('txtdname').value=res[0];
                    document.getElementById('txtcabn').value=res[1];
                    document.getElementById('txtcontactd').value=res[2];
                }
            }
        </script>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>     <%@page import="java.sql.*" %>
    <body>
        <div id="page">
            <%@include file="admin.html" %>
            <div id="body">
                <div id="content">
                    <h1>Flash Cab System</h1>
                    <form  action="bookCabReply" method="post">
                        <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                            <%
                                        Connection con = null;
                                        PreparedStatement pst = null;
                                        ResultSet rst = null;
                                        try {
                                            con = connection.Connect.makeCon();
                                            String query = "select * from bookcab where a1 ='" + id + "'";
                                            pst = con.prepareStatement(query);
                                            rst = pst.executeQuery();
                                            while (rst.next()) {



                                                String a2 = rst.getString(2);
                                                String a3 = rst.getString(3);
                                                String a4 = rst.getString(4);
                                                String a5 = rst.getString(5);
                                                String a6 = rst.getString(6);



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
                                        <legend>Driver Information</legend>
                                        <table cellpadding="5" cellspacing="5">

                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Driver ID</td>
                                                <td class="text-1"> <select name="cmbempid" id="cmbempid" style="width:180Px;" onblur="getNameFee(this.value)">
                                                        <option value="na" selected> - - - - - Select - - - - </option>
                                                        <%
                                                                    PreparedStatement pst2 = null;
                                                                    Connection con2 = null;
                                                                    ResultSet rst2 = null;
                                                                    try {
                                                                        con2 = connection.Connect.makeCon();
                                                                        String query = "select UserID from driverdetails";
                                                                        pst2 = con2.prepareStatement(query);
                                                                        rst2 = pst2.executeQuery();
                                                                        while (rst2.next()) {

                                                        %>
                                                        <option value="<%=rst2.getString(1)%>"><%=rst2.getString(1)%></option>

                                                        <%
                                                                        }
                                                                    } catch (Exception e) {
                                                                        e.printStackTrace();
                                                                    }
                                                        %>
                                                    </select></td>
                                                <td class="text"><span style="color: red;">*</span>Driver Name:</td>
                                                <td><input type="text" size="25" id="txtdname" name="txtdname"></td>
                                            </tr>
                                            <tr>
                                                <td class="text">Cab Number:</td>
                                                <td><input type= text size="25"  id="txtcabn" name="txtcabn"></td>

                                                <td class="text">Contact:</td>
                                                <td><input type= text size="25"  id="txtcontactd" name="txtcontactd"></td>

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