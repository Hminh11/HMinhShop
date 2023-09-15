<%-- 
    Document   : manageorder
    Created on : Jul 12, 2023, 2:23:49 PM
    Author     : ^Zin^
--%>
<%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/order.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>
    <body>
        <style>
            .confirmed {
                color: green;
            }

            .cancelled {
                color: red;
            }
        </style>
        <div class="container mt-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-10">
                    <div class="rounded">
                        <div class="table-responsive table-borderless">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            AccountId
                                        </th>
                                        <th>Order </th>
                                        <th>Address</th>
                                        <th>status</th>
                                        <th>Total</th>
                                        <th>Created</th>
                                        <th>Phone</th>
                                        <th>payment</th>
                                        <th>Detail</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="table-body">
                                    <c:forEach items="${listo}" var="o">
                                        <tr class="cell-1">
                                            <td>
                                                ${o.acc}
                                            </td>
                                            <td>${o.id}</td>
                                            <td>${o.adress}</td>
                                            <td><c:if test="${o.status=='Ordered'}"><span class="badge badge-info">${o.status}</span></c:if>
                                                <c:if test="${o.status=='Cancelled'}"><span class="badge badge-danger">${o.status}</span></c:if>
                                                <c:if test="${o.status=='Confirmed'}"><span class="badge badge-success">${o.status}</span></c:if>
                                                </td>
                                                <td><ftm:formatNumber pattern="#,###" value="${o.totalmoney}" />VNÐ</td>
                                            <td>${o.date}</td>
                                            <td>${o.phone}</td>
                                            <td>${o.payment}</td>
                                             <td><a href="manageorderdetail?qid=${o.id}"><i class="fas fa-eye"></i></a></td>
                                            
                                            <td><c:if test="${o.status=='Ordered'}"> <a href="confirmed?oid=${o.id}"><i lass="confirmed">&#10004;</i></a></p>
                                                <a href="cancelled?oid=${o.id}"><i class="cancelled">&#10008;</i></a></c:if>
                                            </td>
                                            </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <a href="Homepage" class="next">&laquo; Back Home </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
