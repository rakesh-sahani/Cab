
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
                String id = connection.Auto_Gen_ID.globalGenId("D-", "d");
    %>
    <head>    <script src="scw.js" type="text/javascript"></script>
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
                    <form  action="driverDetails" method="post" enctype="multipart/form-data">
                        <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Login Information</legend>
                                        <table cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td class="text"><span style="color: red;"></span>Driver Id:</td>
                                                <td> <input type= "text" size="25"  id="txthidden" name="txthidden" value="<%=id%>"></td>
                                                <td class="text"><span style="color: gray;">*</span> Driver Name:</td>
                                                <td class="text-1"><input type="text" size="25"  id="uname" name="uname"></td>

                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Password :</td>
                                                <td> <input type= "password" size="25"  id="pwd" name="pwd"></td>
                                                <td class="text"><span style="color: red;">*</span>Confirm Password :</td>
                                                <td> <input type= "password" size="25"  id="cpwd" name="cpwd"></td>

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
                                                <td class="text"><span style="color: red;"></span>Cab Allocation</td>
                                                <td> <input type= "text" size="25"  id="cabid" name="cabid"></td>
                                                <td class="text"><span style="color: gray;">*</span>Route Allocation</td>
                                                <td class="text">
                                                    <select  id="routeallocation" name="routeallocation" style="width: 180px">
                                                        <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                        <option value="East Delhi">East Delhi</option>
                                                        <option value="South Delhi">South Delhi</option>
                                                        <option value="North Delhi">North Delhi</option>
                                                        <option value="West Delhi">West Delhi</option>
                                                        <option value="Airline Route">Airline Route</option>
                                                        <option value="Railway Route">Railway Route</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text">
                                                    Passport Image
                                                </td>
                                                <td>
                                                    <input type="file" name="txtImage" id="txtImage"/>
                                                </td>
                                                <td class="text">
                                                    Driving ID
                                                </td>
                                                <td>
                                                    <input type="file" name="txtImage2" id="txtImage"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text">
                                                    Voter Id
                                                </td>
                                                <td>
                                                    <input type="file" name="txtImage3" id="txtImage"/>
                                                </td>
                                                <td class="text">
                                                    Adhar Card
                                                </td>
                                                <td>
                                                    <input type="file" name="txtImage4" id="txtImage"/>
                                                </td>
                                            </tr>

                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Personal Information</legend>
                                        <table cellpadding="5" cellspacing="5">
                                          
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>First Name:</td>
                                                <td><input type="text" size="25"  id="txtname" name="txtname" onblur=" CheckForAlphabets(this)" ></td>
                                                <td class="text"><span style="color: red;">*</span>Last Name :</td>
                                                <td> <input type= text size="25"  id="txtlname" name="txtlname" onblur=" CheckForAlphabets(this)" ></td>
                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>
                                                    Gender
                                                </td>
                                                <td class="text">
                                                    <select  id="cmbgender" name="cmbgender" style="width: 180px">
                                                        <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </td>
                                                <td class="text"><span style="color: red;">*</span>Date of Birth</td>
                                                <td> <input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this,event)" ></td>
                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Contact Number:</td>
                                                <td> <input type= text size="25"  id="number" name="number" onkeyup="contact(this)" onblur="mob()"></td>
                                                <td class="text"><span style="color: red;">*</span>Email Id:</td>
                                                <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur="valid()"></td>
                                            </tr>
                                            <tr>
                                                <td class="text">Address:</td>
                                                <td><input type= text size="25"  id="txtaddress" name="txtaddress"></td>

                                                <td class="text">City:</td>
                                                <td>
                                                    <select id="cmbcity"   name="cmbcity" style="width: 180px;">
                                                        <option value="Select"> Select </option>
                                                        <option value="Delhi">  Delhi </option>
                                                        <option value="Gurgoan"> Gurgoan </option>
                                                        <option value="Noida"> Noida </option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text">Pin Code:</td>
                                                <td> <input type= text size="25"  id="txtpin" name="txtpin" onkeyup="contact(this)" onblur="pin()"></td>
                                                <td class="text">State:</td>
                                                <td><input type= text size="25"  id="txtstate" name="txtstate"></td>
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
                                                    </select>
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
                                    <input type="submit" value="Submit" onclick="return validate();">
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