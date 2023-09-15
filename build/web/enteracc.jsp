<%-- 
    Document   : enteracc
    Created on : Jul 13, 2023, 2:37:37 PM
    Author     : ^Zin^
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Username Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group input[type="text"] {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .form-group input[type="submit"] {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Username Acc</h1>
            <strong>${error}</strong>
            <form action="forgotpass" method="post">
                <div class="form-group">
                    <label for="username">Enter your Account and we will send it to email link with this account:</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit">
                </div>
            </form>
             <a href="login.jsp" class="next">&laquo; Back to Login </a>
        </div>
    </body>
</html>

