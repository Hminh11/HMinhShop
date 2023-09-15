<%-- 
    Document   : otp
    Created on : Jul 11, 2023, 9:20:54 PM
    Author     : ^Zin^
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>OTP Verification Form</title>
        <link href="css/otp.css" rel="stylesheet"> 
        <!-- Boxicons CSS -->
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <script src="js/otp.js" defer></script>
    </head>
    <body>
        <div class="container">
            <header>
                <i class="bx bxs-check-shield"></i>
            </header><<h5>We have sent an otp code to your email!</h5>

            <c:if test="${loi==true}"><Strong>Wrong number OTP </strong></c:if>
            <form action="otp" method="post">
                    <div class="input-field">
                        <input name="num1" type="text"/>
                        <input name="num2" type="text"/>
                        <input name="num3" type="text"/>
                        <input name="num4" type="text" />

                </div>
                <button type="submit" >Verify OTP</button>
            </form>
             <a href="Homepage" class="next">&laquo; Back Home </a>
        </div>
    </body>
</html>

