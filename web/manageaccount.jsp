

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/stylemanage.css" rel="stylesheet" type="text/css"/>
        <style>
            .radio-container {
                display: flex;
            }
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Account </b><c:if test="${sessionScope.acc.seller==true}">  by Admin ${sessionScope.acc.username} </c:if></h2>
                            </div>
                            <div class="col-sm-6">
                               					
                            </div>
                        </div>
                    </div>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th></th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Password</th>
                                <th>Email</th>
                                <th>Is Admin</th>
                                <th>Is Seller</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${account}" var="o">
                            <tr>
                                <td>
                                </td>
                                <td>${o.id}</td>
                                <td>${o.username}</td>
                                <td> <input type="text" name="txtPassword" value="${o.password}" readonly />   </td>
                                <th>${o.email}</th>
                                <td>${o.admin}</td>
                                <td>${o.seller}</td>
                                <td>
                                    <a href="#editEmployeeModal" data-id="${o.id}" data-name="${o.username}" data-email="${o.email}" data-pass="${o.password}" data-admin="${o.admin}" data-seller="${o.seller}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="removeacc?pid=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
            <button type="button" onclick="backtohome()" class="btn btn-primary">Back to home</button>
            <script>
                function backtohome() {
                    var servlet = "/PRJ/Homepage";
                    window.location.href = servlet;
                }
            </script>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addproduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>password</label>
                                <input name="image" type="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="price" type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label></label>
                                <input name="description" type="text" class="form-control" required>
                            </div>  
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editacc" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Acc</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Account ID</label>
                                <input name="editid" id="editID" type="text" class="form-control" required readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="editname" id="editName" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>password</label>
                                <input name="editimage" id="editImage" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="editprice" id="editPrice" type="email" class="form-control" readonly required>
                            </div>
                            
                            <div class="form-group">
                                <label>isAdmin</label>
                                <select name="isadmin"  class="form-select" aria-label="Default select example">
                                    <option value="1">True</option>
                                    <option value="0">False</option>   
                                    </select>
                            </div>

                            <div class="form-group">
                                <label>isSeller</label>
                                <select name="isseller"  class="form-select" aria-label="Default select example">
                                    <option value="1">True</option>
                                    <option value="0">False</option>
                                    </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                $(document).ready(function () {
                    // Bắt sự kiện click trên nút "Edit"
                    $('.edit').click(function () {
                        var id = $(this).data('id');
                        var name = $(this).data('name');
                        var password = $(this).data('pass');
                        var email = $(this).data('email');
                        var admin = $(this).data('admin');
                        var seller = $(this).data('seller');
                        // Điền giá trị vào trường "Name" trong modal
                        $('#editID').val(id);
                        $('#editName').val(name);
                        $('#editImage').val(password);
                        $('#editPrice').val(email);

                        if (seller === true) {
                            $('#editDescription').prop('checked', true);
                        } else {
                            $('#editDescription').prop('checked', false);
                        }
                        if (admin === true) {
                            $('#admin').prop('checked', true);
                        } else {
                            $('#admin').prop('checked', false);
                        }
                        // Các xử lý khác (nếu có)
                    });
                });
        </script>
    </body>
</html>