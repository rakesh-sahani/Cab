
<html>
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
                    <h1>Enquiry Form...</h1>
                    <form action="index.html">
                             <table>
                        <p>
					Flash Cab System</p>
                        <label class="text11"for="name"><span>Name:</span><span>
                                <input type="text" id="name">
                            </span></label>
                        <label class="text11"for="address"><span>Address:</span><span>
                                <input type="text" id="address">
                            </span></label>
                        <label class="text11"for="telephone"><span>Telephone Number:</span><span>
                                <input type="text" id="telephone">
                            </span></label>
                        <label class="text11"for="subject"><span>Subject:</span><span>
                                <input type="text" id="subject">
                            </span></label>
                        <label class="text11"for="message"><span>Message:</span><span class="message">
                                <textarea name="message" id="message" cols="30" rows="10"></textarea>
                            </span>
                        <input type="submit" id="send" value="Send">&nbsp;</label>

                                  <tr>
                            <td>

                            </td>
                            <td>
                         <input type="reset" id="send" value="Reset">
                            </td>
                        </tr>
                        </table>


                    </form>
                </div>
            </div>
            <div id="footer">

                <p>
				Flash Cab &copy; 2015 | All Rights Reserved
                </p>
            </div>
        </div>
    </body>
</html>