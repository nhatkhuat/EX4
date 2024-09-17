<%-- 
    Document   : manage
    Created on : Jun 24, 2024, 8:54:43 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dal.CartDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="POS - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern,  html5, responsive">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Management</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/css/animate.css">

        <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <style>table {
                border-collapse: separate;
                border-spacing: 0;
                border-radius: 10px;
                overflow: hidden;
                justify-content: center;
                text-align: center;
            }
            th {
                background-color: #66E1FE;
                color: #FFFFFF;
                text-align: center;
            }
            th, td {
                width: 150px;
                padding: 10px;
                border: 0px solid black;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            /* required css to make columns rounded */
            th {
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }
            tr:last-child td {
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
            }</style>
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
                                <a href="dashboard"   class="active"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Dashboard</span> </a>
                            </li>
                            <li class="submenu" >
                                <a href="javascript:void(0);"><img src="assets/img/icons/product.svg" alt="img"><span> Product</span> <span class="menu-arrow"></span></a>
                                <ul>
                                    <li ><a href="productlist.jsp" >Product List</a></li>
                                    <li><a href="addproduct">Add Product</a></li>
                                    <li><a href="categorylist.jsp">Category List</a></li>
                                    <li><a href="addcategory.jsp">Add Category</a></li>
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
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="dash-widget dash1">
                                <div class="dash-widgetimg">
                                    <span style="background-color: #FCEAEA"><img src="assets/img/icons/dash4.svg" alt="img"></span>
                                </div>
                                <div class="dash-widgetcontent">
                                    <c:set value="${requestScope.expense}" var="e"/>
                                    <h5>$<span class="counters" data-count="${e}"></span></h5>
                                    <h6>Expense</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="dash-widget dash2">
                                <div class="dash-widgetimg">
                                    <span><img src="assets/img/icons/dash3.svg" alt="img"></span>
                                </div>
                                <div class="dash-widgetcontent">
                                    <c:set value="${requestScope.revenue}" var="r"/>
                                    <h5>$<span class="counters" data-count="${r}"></span></h5>
                                    <h6>Revenue</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="dash-widget dash3">
                                <div class="dash-widgetimg">
                                    <span style="background-color: #E5F8ED"><img src="assets/img/icons/dash2.svg" alt="img"></span>
                                </div>
                                <div class="dash-widgetcontent">
                                    <c:set value="${requestScope.profit}" var="p"/>
                                    <h5>$<span class="counters" data-count="${p}"></span></h5>
                                    <h6>Profit</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12 d-flex">
                            <div class="dash-count">
                                <div class="dash-counts">
                                    <c:set value="${requestScope.NoProduct}" var="Nop"/>
                                    <h4>${Nop}</h4>
                                    <h5>Products</h5>
                                </div>
                                <div class="dash-imgs">
                                    <i data-feather="box"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12 d-flex">
                            <div class="dash-count das2">
                                <div class="dash-counts">
                                    <c:set value="${requestScope.NoCustomer}" var="Nocus"/>
                                    <h4>${Nocus}</h4>
                                    <h5>Customers</h5>
                                </div>
                                <div class="dash-imgs">
                                    <i data-feather="user"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12 d-flex">
                            <div class="dash-count das3">
                                <div class="dash-counts">
                                    <c:set value="${requestScope.NoInvoice}" var="Noin"/>
                                    <h4>${Noin}</h4>
                                    <h5>Sales Invoice</h5>
                                </div>
                                <div class="dash-imgs">
                                    <i data-feather="file-text"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-7 col-sm-12 col-12 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header pb-0 d-flex justify-content-between align-items-center"
                                     style="height:48px">
                                    <h5 class="card-title mb-0">Monthly revenue</h5>
                                </div>
                                <div class="card-body">
                                    <table>
                                        <tr>
                                            <th>Month</th>
                                            <th>Products sold</th>
                                            <th>Revenue</th>
                                            <th>Profit</th>
                                        </tr>
                                        <c:set var="i" value="1"/>
                                        <%
                                            CartDAO cdao = new CartDAO();
                                            DecimalFormat df = new DecimalFormat("0.##");
                                            for(int i= 1; i<13;i++){
                                        %>
                                        <tr>
                                            <td><%= i %></td>
                                            <td><%= cdao.NumberOfCartByMonth(i) %></td>
                                            <td>$<%= cdao.RevenueByMonth(i) %></td>
                                            <td>$<%= cdao.RevenueByMonth(i) - cdao.ExpenseBYMonth(i) %></td>
                                        </tr>
                                        <%  } %>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-12 col-12 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header pb-0 d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0">Average monthly revenue</h5>
                                    <table>
                                        <tr>
                                            <th style="background-color: #0f9d58">Products sold</th>
                                            <th style="background-color: #0f9d58">Revenue</th>
                                            <th style="background-color: #0f9d58">Profit</th>
                                        </tr>
                                        <tr>
                                            <td>$<%=  df.format(cdao.NumberProductSold()/12) %></td>
                                            <td>$<%=  df.format(cdao.Revenue()/12)  %></td>
                                            <td>$<%=  df.format(cdao.Revenue()/12 - cdao.Expense()/12) %></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-12 col-12 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header pb-0 d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0">Top customer</h5>
                                    <table>
                                        <tr>
                                            <th style="background-color: orange">Customer</th>
                                            <th style="background-color: orange">Phone</th>
                                            <th style="background-color: orange">Payment</th>
                                        </tr>
                                        <tr>
                                            <c:set var="cus" value="${sessionScope.topcus}"/>
                                            <td>${cus.fullName}</td>
                                            <td>${cus.phoneNumber}</td>
                                            <td>$${sessionScope.toptotal}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/feather.min.js"></script>

    <script src="assets/js/jquery.slimscroll.min.js"></script>

    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/apexchart/apexcharts.min.js"></script>
    <script src="assets/plugins/apexchart/chart-data.js"></script>

    <script src="assets/js/script.js"></script>
</body>
</html>
