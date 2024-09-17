<%-- 
    Document   : productlist.jsp
    Created on : Jun 29, 2024, 8:44:44 AM
    Author     : nhatk
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dal.DAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="POS - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, invoice, html5, responsive, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Manage product</title>

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
                                <a href="javascript:void(0);" class="active"><img src="assets/img/icons/product.svg" alt="img"><span> Product</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li ><a href="productlist.jsp" class="active">Product List</a></li>
                                    <li><a href="addproduct">Add Product</a></li>
                                    <li><a href="categorylist.jsp">Category List</a></li>
                                    <li><a href="addcategory.jsp"  >Add Category</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"><img src="assets/img/icons/users1.svg" alt="img"><span> People</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="customerlist.jsp">Customer List</a></li>
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
                                <a href="javascript:void(0);"><img src="assets/img/icons/users1.svg" alt="img"><span> Users</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="newuser.jsp">New User </a></li>
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
                            <h4>Product List</h4>
                            <h6>Manage your products</h6>
                        </div>
                        <div class="page-btn">
                            <a href="addproduct" class="btn btn-added"><img src="assets/img/icons/plus.svg" alt="img" class="me-1">Add New Product</a>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>
                                                No
                                            </th>
                                            <th>Product Name</th>
                                            <th>Color</th>
                                            <th>Ram</th>
                                            <th>Rom</th>
                                            <th>Purchase</th>
                                            <th>Price</th>
                                            <th>Available</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="i" value="1"/>
                                        <%
                                        DAO dao = new DAO();
                                        %>
                                        <c:forEach items="${sessionScope.listP}" var="s">
                                            <tr>
                                                <td>
                                                    ${i}
                                                </td>
                                                <c:set value="${i+1}" var="i"/>
                                                <td class="productimgname">
                                                    <a href="javascript:void(0);" class="product-img">
                                                        <img src="${s.image}" alt="product">
                                                    </a>
                                                    <a href="javascript:void(0);">${s.name}</a>
                                                </td>
                                                <c:set var="dao" value="<%= dao %>" />
                                                <td>${s.color}</td>
                                                <td>${s.ram}</td>
                                                <td>${s.memory}</td>
                                                <td>$${s.purchase}</td>
                                                <td>$${s.price}</td>
                                                <td>${s.available}</td>
                                                <td>
                                                    <a class="me-3" href="editproduct?pid=${s.productID}">
                                                        <img src="assets/img/icons/edit.svg" alt="img">
                                                    </a>
                                                    <a onclick="doDelete(${s.productID})">
                                                        <img src="assets/img/icons/delete.svg" alt="img">
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script>
            function doDelete(pid) {
                var option = confirm("Are you sure? You won't be able to revert this");
                if (option === true) {
                    window.location = "deleteproduct?pid=" + pid;
                }
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