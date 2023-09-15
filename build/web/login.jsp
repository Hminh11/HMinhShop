<%-- 
    Document   : login
    Created on : Jun 29, 2023, 12:13:20 AM
    Author     : ^Zin^
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <section class="vh-100" style="background-color: #9A616D;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img style="height: 100%!important;" src="https://gunwharf-quays.com/sites/gunwharf_quays/files/styles/shop_gallery_full/public/images/shops/gallery/the-perfume-shop-joop-homme.jpg?itok=qN3t7Jyz"
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form action="login" method="post">
                                            <div class="d-flex align-items-center mb-3 pb-1">
                                                <a href="Homepage" class="text-decoration-none">
                                                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Hminh</span>Shop</h1>
                                                </a>
                                            </div>

                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
                                            <!-- Error Alert -->
                                            <c:if test="${t==true}">
                                                <div class="alert alert-danger alert-dismissible fade show">
                                                    <strong>Login failed!</strong> Wrong username or password!
                                                </div>
                                            </c:if>
                                            <div class="form-outline mb-4">
                                                <input type="text" name="txtUsername" placeholder="Enter Username" id="form2Example17" class="form-control form-control-lg" />
                                                
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" name="txtPassword" placeholder="Enter password" id="form2Example27" class="form-control form-control-lg" />
                                                
                                            </div>

                                            <div class="pt-1 mb-4">
                                                <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                            </div>

                                            <a class="small text-muted" href="enteracc.jsp">Forgot password?</a>
                                            <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="register.jsp"
                                                                                                                      style="color: #393f81;">Register here</a></p>
                                            <a href="#!" class="small text-muted">Terms of use.</a>
                                            <a href="#!" class="small text-muted">Privacy policy</a>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
