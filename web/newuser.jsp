<%-- 
    Document   : adduser
    Created on : Jul 1, 2024, 1:27:12 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="POS - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, invoice, html5, responsive, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Add user</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/css/animate.css">

        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <div id="global-loader">
            <div class="whirly-loader"> </div>
        </div>

        <div class="main-wrapper">

            <jsp:include page="header_sidebar_manage.jsp"/>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li>
                                <a href="dashboard"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Dashboard</span> </a>
                            </li>
                            <li class="submenu" >
                                <a href="javascript:void(0);"><img src="assets/img/icons/product.svg" alt="img"><span> Product</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li ><a href="productlist.jsp" >Product List</a></li>
                                    <li><a href="addproduct">Add Product</a></li>
                                    <li><a href="categorylist.jsp">Category List</a></li>
                                    <li><a href="addcategory.jsp"  >Add Category</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"><img src="assets/img/icons/users1.svg" alt="img"><span> People</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="customerlist.jsp" >Customer List</a></li>
                                    <li><a href="addcustomer.jsp">Add Customer </a></li>
                                </ul>
                            </li> 
                            <li class="submenu">
                                <a href="javascript:void(0);"><img src="assets/img/icons/time.svg" alt="img"><span> Report</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="invoicereport">Invoice Report</a></li>
                                    
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"  class="active"><img src="assets/img/icons/users1.svg" alt="img"><span>Users</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="newuser.jsp" class="active">New User </a></li>
                                    <li><a href="userlists.jsp">Users List</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="page-wrapper">
                <div class="content">
                    <div class="page-header">
                        <div class="page-title">
                            <h4>User Management</h4>
                            <h6>Add/Update User</h6>
                        </div>
                    </div>
                    <form action="adduser" method="post" onsubmit="return validate()">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-3 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <input type="text" name="username" value="" placeholder="Enter username" required=""/>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" id="email" name="email" value="" placeholder="Enter customer email" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" id="phone" name="phone" value="" placeholder="Enter customer phone" required/>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" value="" placeholder="Enter password" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Role</label>
                                            <select class="select" name="role">
                                                <option value="0">user</option>
                                                <option value="1">admin</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Customer</label>
                                            <input type="text" name="name" value="" placeholder="Enter customer name" required/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <input type="submit" value="Submit" class="btn btn-submit me-2"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <script type="text/javascript">
            function validate() {
                var email = document.getElementById("email").value;
                var regex1 = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

                var phone = document.getElementById("phone").value;
                var regex2 = /^\d{10}$/;
                if (!regex2.test(phone)) {
                    alert("Please enter a valid phone number with 10 digit");
                    document.getElementById("phone").focus();
                    return false;
                }
                if (!regex1.test(email)) {
                    alert("Please enter a valid Email address (example@gmail.com)");
                    document.getElementById("email").focus();
                    return false;
                }

                return true;
            }
        </script>

        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/feather.min.js"></script>

        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
        <script src="assets/plugins/sweetalert/sweetalerts.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>