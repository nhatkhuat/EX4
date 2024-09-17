<%-- 
    Document   : header
    Created on : Jun 22, 2024, 9:45:39 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>

        <!-- ============================================== TOP MENU ============================================== -->
        <div class="top-bar animate-dropdown">
            <div class="container">
                <div class="header-top-inner">
                    <div class="cnt-account">
                        <ul class="list-unstyled">
                            
                            <c:set value="${sessionScope.customer}" var="cus"/>
                            <c:set value="${sessionScope.customerAcc}" var="acc"/>
                            <c:if test="${cus == null}" >
                                <li class="login"><a href="login"><span>Login</span></a></li>
                                </c:if>
                                <c:if test="${cus != null}" >
                                <li class="logout"><a href="logout"><span>Logout</span></a></li>
                                </c:if>
                                <c:if test="${acc.isAdmin == 1}" >
                                <li class="manage"><a href="dashboard"><span>Manager</span></a></li>
                                </c:if>
                            <li class="header_cart hidden-xs"><a href="cart"><span>My Cart</span></a></li>
                            <li class="myaccount"><a href="profile"><span>My Profile</span></a></li>
                        </ul>
                    </div>
                    <!-- /.cnt-account -->

                    <!-- /.cnt-cart -->
                    <div class="clearfix"></div>
                </div>
                <!-- /.header-top-inner --> 
            </div>
            <!-- /.container --> 
        </div>
        <!-- /.header-top --> 
        <!-- ============================================== TOP MENU : END ============================================== -->
        <div class="main-header">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-3 logo-holder"> 
                        <!-- ============================================================= LOGO ============================================================= -->
                        <div class="logo"> <a href="home"> <img src="assets/images/logo.png" alt="logo" style="width: 30%;border-radius: 50%" > </a> </div>
                        <!-- /.logo --> 
                        <!-- ============================================================= LOGO : END ============================================================= --> </div>
                    <!-- /.logo-holder -->

                    <div class="col-lg-7 col-md-6 col-sm-8 col-xs-12 top-search-holder"> 
                        <!-- /.contact-row --> 
                        <!-- ============================================================= SEARCH AREA ============================================================= -->
                        <div class="search-area">
                            <form action="search" method="post">
                                <div class="control-group">
                                    <ul class="categories-filter animate-dropdown">
                                        <li class="dropdown"> <a class="dropdown-toggle"  data-toggle="dropdown" href="category.jsp">Categories <b class="caret"></b></a>
                                            <ul class="dropdown-menu" role="menu" >
                                                <c:forEach items="${sessionScope.listC}" var="c" >
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="category?cid=${c.categoryID}">- ${c.name}</a></li> 
                                                    </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                    <input class="search-field" name="txt" type="text" placeholder="Search here..."/>
                                    <button class="search-button" type="submit" style="border: none"></button></div>
                            </form>
                        </div>
                        <!-- /.search-area --> 
                        <!-- ============================================================= SEARCH AREA : END ============================================================= --> </div>
                    <!-- /.top-search-holder -->
                    <div class="col-lg-2 col-md-3 col-sm-4 col-xs-12 animate-dropdown top-cart-row"> 
                        <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
                        <div class="dropdown dropdown-cart"> <a href="cart" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
                                <div class="items-cart-inner">
                                    <div class="basket" onclick="goToCart()">
                                        <c:set value="${sessionScope.NoItem}" var="no"/>
                                        <div class="basket-item-count"><span class="count" style="text-decoration: blink">${no}</span></div>
                                            <c:set value="${sessionScope.TotalOfCart}" var="total"/>
                                        <div class="total-price-basket"><span class="lbl">Shopping Cart</span><span class="value">$ ${total}</span> </div>
                                    </div>
                                </div>
                            </a>

                            <!-- /.dropdown-menu--> 
                        </div>
                        <!-- /.dropdown-cart --> 

                        <!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= --> </div>
                    <!-- /.top-cart-row --> 
                </div>
                <!-- /.row --> 

            </div>
            <!-- /.container --> 

        </div>
        <!-- /.main-header --> 

        <!-- ============================================== NAVBAR ============================================== -->
        <div class="header-nav animate-dropdown">
            <div class="container">
                <div class="yamm navbar navbar-default" role="navigation">
                    <div class="navbar-header">
                        <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> 
                            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    </div>
                    <div class="nav-bg-class">
                        <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
                            <div class="nav-outer">
                                <ul class="nav navbar-nav">
                                    <li> <a href="home">Home</a> </li>

                                    <c:if test="${acc.isAdmin == 1}" >
                                        <li> <a href="dashboard">Manager</a> </li>
                                        </c:if>
                                </ul>
                                <!-- /.navbar-nav 
                                <div class="clearfix"></div>
                            </div>
                                <!-- /.nav-outer --> 
                            </div>
                            <!-- /.navbar-collapse --> 

                        </div>
                        <!-- /.nav-bg-class --> 
                    </div>
                    <!-- /.navbar-default --> 
                </div>
                <!-- /.container-class --> 

            </div>
            <script>
                function goToCart() {
                    window.location = "cart";
                }
            </script>
    </body>
</html>
