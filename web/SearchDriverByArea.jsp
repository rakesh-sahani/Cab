
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
                    <form method="post" action="driverarea">
                        <table>



                            <tr>
                                <td class="text"><span style="color: red;">*</span>Location&nbsp;:</td>
                                <td class="text">
                                    <select  id="txtbranch"name="txtbranch" style="width: 180px">
                                        <option value="na" > - - - - - Select - - - - -</option>
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
                                <td>
                                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Search">
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