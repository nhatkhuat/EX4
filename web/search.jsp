

<%-- 
    Document   : category.jsp
    Created on : Jun 19, 2024, 10:46:02 PM
    Author     : nhatk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">
        <title>Search</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Customizable CSS -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/blue.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/rateit.css">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
        <style>
            html{
                scroll-behavior: smooth;
            }
        </style>
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="assets/css/font-awesome.css">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Barlow:200,300,300i,400,400i,500,500i,600,700,800" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body class="cnt-home" onload="focus()">
        <!-- ============================================== HEADER ============================================== -->
        <header class="header-style-1">
            <jsp:include page="header.jsp" />
        </header>

        <!-- ============================================== HEADER : END ============================================== --> 

        <!-- ============================================== HEADER : END ============================================== -->
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li class="active" >Search</li>
                    </ul>
                </div>
                <!-- /.breadcrumb-inner --> 
            </div>
            <!-- /.container --> 
        </div>
        <!-- /.breadcrumb -->
        <div class="body-content outer-top-xs">
            <div class='container'>
                <div class='row'>
                    <div class='col-xs-12 col-sm-12 col-md-3 sidebar'>
                        <!-- ================================== TOP NAVIGATION ================================== -->
                        <div class="side-menu animate-dropdown outer-bottom-xs">
                            <div class="head" id="cate" ><i class="icon fa fa-align-justify fa-fw"></i>Categories</div>
                            <nav class="yamm megamenu-horizontal">
                                <ul class="nav">
                                    <li class="dropdown menu-item" >
                                        <%--<c:set value="${requestScope.cname}" var="name"></c:set>--%>
                                        <c:forEach items="${sessionScope.listC}" var="c" >
                                            <a href="category?cid=${c.categoryID}" class="dropdown-toggle" >
                                                <i class="icon fa fa-mobile" aria-hidden="true"></i>${c.name}</a>
                                            </c:forEach>
                                    </li>
                                </ul>
                                <!-- /.nav --> 
                            </nav>
                            <!-- /.megamenu-horizontal --> 
                        </div>
                        <!-- /.side-menu --> 
                        <!-- ================================== TOP NAVIGATION : END ================================== -->
                        <div class="sidebar-module-container">
                            <div class="sidebar-filter"> 
                                <!-- ============================================== SIDEBAR CATEGORY ============================================== -->

                                <!-- /.sidebar-widget --> 
                                <!-- ============================================== SIDEBAR CATEGORY : END ============================================== --> 

                                <!-- ============================================== PRICE SILDER============================================== -->
                                <div class="sidebar-widget">
                                    <div class="widget-header">
                                        <h4 class="widget-title">Price</h4>
                                    </div>
                                    <form action="search" method="POST">
                                        <div class="sidebar-widget-body m-t-10">
                                            <table style="font-size: 120%">
                                                <tbody>
                                                    <tr>

                                                        <td><input type="checkbox" name="price" value="36" style="margin: 0 20px 5px 0"
                                                                   <c:forEach items="${sessionScope.priceCheck}" var="p" >
                                                                       ${p == '36' ? 'checked' : ''}
                                                                   </c:forEach>
                                                                   /></td>
                                                        <td>300 - 600 $</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" name="price" value="68" style="margin: 0 20px 5px 0" 
                                                                   <c:forEach items="${sessionScope.priceCheck}" var="p" >
                                                                       ${p == '68' ? 'checked' : ''}
                                                                   </c:forEach>
                                                                   /></td>
                                                        <td>600 - 800 $</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" name="price" value="810" style="margin: 0 20px 5px 0"
                                                                   <c:forEach items="${sessionScope.priceCheck}" var="p" >
                                                                       ${p == '810' ? 'checked' : ''}
                                                                   </c:forEach>
                                                                   /></td>
                                                        <td>800 - 1000 $</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" name="price" value="1012" style="margin: 0 20px 5px 0"
                                                                   <c:forEach items="${sessionScope.priceCheck}" var="p" >
                                                                       ${p == '1012' ? 'checked' : ''}
                                                                   </c:forEach>
                                                                   /></td>
                                                        <td>1000 - 1200 $</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" name="price" value="1216" style="margin: 0 20px 5px 0"
                                                                   <c:forEach items="${sessionScope.priceCheck}" var="p" >
                                                                       ${p == '1216' ? 'checked' : ''}
                                                                   </c:forEach>
                                                                   /></td>
                                                        <td >1200 - 1600 $</td>
                                                    </tr>
                                                </tbody>

                                            </table><br>
                                            <button type="submit" class="lnk btn btn-primary">Show Now</button> 
                                        </div>
                                    </form>
                                    <!-- /.sidebar-widget-body --> 
                                </div>
                                <!-- /.sidebar-widget --> 
                                <!-- ============================================== PRICE SILDER : END ============================================== --> 
                                <!-- ============================================== MANUFACTURES============================================== -->
                                <div class="sidebar-widget">
                                    <div class="widget-header">
                                        <h4 class="widget-title">Ram</h4>
                                    </div>
                                    <div class="sidebar-widget-body">
                                        <ul class="list">
                                            <li><a href="search?ram=4GB">4GB</a></li>
                                            <li><a href="search?ram=6GB">6GB</a></li>
                                            <li><a href="search?ram=8GB">8GB</a></li>
                                            <li><a href="search?ram=12GB">12GB</a></li>
                                        </ul>
                                        <!--<a href="#" class="lnk btn btn-primary">Show Now</a>--> 
                                    </div>
                                    <!-- /.sidebar-widget-body --> 
                                </div>
                                <!-- /.sidebar-widget --> 
                                <!-- ============================================== MANUFACTURES: END ============================================== --> 
                                <!-- ============================================== COLOR============================================== -->
                                <div class="sidebar-widget">
                                    <div class="widget-header">
                                        <h4 class="widget-title">Colors</h4>
                                    </div>
                                    <div class="sidebar-widget-body">
                                        <ul class="list">
                                            <li><a href="search?color=Red">Red</a></li>
                                            <li><a href="search?color=Blue">Blue</a></li>
                                            <li><a href="search?color=Yellow">Yellow</a></li>
                                            <li><a href="search?color=Gray">Gray</a></li>
                                            <li><a href="search?color=Purple">Purple</a></li>
                                            <li><a href="search?color=Pink">Pink</a></li>
                                            <li><a href="search?color=White">White</a></li>
                                            <li><a href="search?color=Green">Green</a></li>
                                        </ul>
                                    </div>
                                    <!-- /.sidebar-widget-body --> 
                                </div>
                                <!-- /.sidebar-widget --> 

                            </div>
                            <!-- /.sidebar-filter --> 
                        </div>
                        <!-- /.sidebar-module-container --> 
                    </div>
                    <!-- /.sidebar -->
                    <div class="col-xs-12 col-sm-12 col-md-9 rht-col">
                        <!-- ========================================== SECTION – HERO ========================================= -->

                        <div id="category" class="category-carousel hidden-xs">
                            <div class="item">
                                <div class="image"> <img src="assets/images/banners/home-banner.jpg" alt="" class="img-responsive" style="width: 200%"> </div>

                                <!-- /.container-fluid --> 
                            </div>
                        </div>


                        <div class="clearfix filters-container m-t-10">
                            <div class="row">
                                <div class="col col-sm-6 col-md-3 col-lg-3 col-xs-6">
                                    <div class="filter-tabs">
                                        <ul id="filter-tabs" class="nav nav-tabs nav-tab-box nav-tab-fa-icon">
                                            <li class="active"> <a data-toggle="tab" href="#grid-container"><i class="icon fa fa-th-large"></i>Grid</a> </li>
                                            <li><a data-toggle="tab" href="#list-container"><i class="icon fa fa-bars"></i>List</a></li>
                                        </ul>
                                    </div>
                                    <!-- /.filter-tabs --> 
                                </div>
                                <!-- /.col -->
                                <div class="col col-sm-12 col-md-5 col-lg-5 hidden-sm">
                                    <div class="col col-sm-6 col-md-6 no-padding">
                                        <div class="lbl-cnt"> <span class="lbl">Sort by</span>
                                            <div class="fld inline">
                                                <div class="dropdown dropdown-small dropdown-med dropdown-white inline">
                                                    <button data-toggle="dropdown" type="button" class="btn dropdown-toggle"> Order by <span class="caret"></span> </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li role="presentation"><a href="search?order=low">Price:Lowest first</a></li>
                                                        <li role="presentation"><a href="search?order=high">Price:HIghest first</a></li>
                                                        <li role="presentation"><a href="search?order=name ">Product Name:A to Z</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- /.fld --> 
                                        </div>
                                        <!-- /.lbl-cnt --> 
                                    </div>
                                    <!-- /.col -->

                                    <!-- /.col --> 
                                </div>
                                <!-- /.col -->
                                <div class="col col-sm-6 col-md-4 col-xs-6 col-lg-4 text-right">
                                    <div class="pagination-container">
                                        <c:set value="${requestScope.currentindex}" var="i" />
                                        <ul class="list-inline">
                                            <!--<li class="prev"><a href="#"><i class="fa fa-angle-left"></i></a></li>-->
                                            <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                            <c:if test="${i > 1}">
                                                <li class="prev"><a href="search?index=${i-1}"><i class="fa fa-angle-left"></i></a></li>
                                                    </c:if>

                                            <c:choose>
                                                <c:when test="${i <= 3}">
                                                    <c:set var="startPage" value="1" />
                                                    <c:set var="endPage" value="${Nopage > 5 ? 5 : Nopage}" />
                                                </c:when>
                                                <c:when test="${i > Nopage - 3}">
                                                    <c:set var="startPage" value="${Nopage - 4 > 0 ? Nopage - 4 : 1}" />
                                                    <c:set var="endPage" value="${Nopage}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="startPage" value="${i - 2}" />
                                                    <c:set var="endPage" value="${i + 2}" />
                                                </c:otherwise>
                                            </c:choose>

                                            <c:forEach var="p" begin="${startPage}" end="${endPage}">
                                                <c:if test="${i == p}">
                                                    <li style=" font-weight: bolder;font-size: 120%">
                                                        <a href="search?index=${p}" style="font-size: larger; text-decoration: underline;color: red">${p}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${i != p}">
                                                    <li>
                                                        <a href="search?index=${p}">${p}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>


                                            <c:if test="${i < Nopage}">
                                                <li class="next"><a href="search?index=${i+1}"><i class="fa fa-angle-right"></i></a></li>
                                                    </c:if>  
                                            <!--<li class="next"><a href="#"><i class="fa fa-angle-right"></i></a></li>-->
                                        </ul>

                                        <!-- /.list-inline --> 
                                    </div>
                                    <!-- /.pagination-container -->
                                </div>
                                <!-- /.col --> 
                            </div>
                            <!-- /.row --> 
                        </div>
                        <div class="search-result-container " id="here">
                            <div id="myTabContent" class="tab-content category-list">
                                <div class="tab-pane active " id="grid-container">
                                    <div class="category-product">
                                        <div class="row">
                                            <c:forEach items="${sessionScope.searchList}" var="s" >
                                                <div class="col-sm-6 col-md-4 col-lg-3">
                                                    <div class="item">
                                                        <div class="products">
                                                            <div class="product">
                                                                <div class="product-image">
                                                                    <div class="image"> 
                                                                        <a href="detail?pid=${s.productID}">
                                                                            <img src="${s.image}" alt=""> 
                                                                            <img src="${s.image}" alt="" class="hover-image">
                                                                        </a> 
                                                                    </div>
                                                                    <!-- /.image -->
                                                                    <div class="tag new"><span>new</span></div>
                                                                </div>
                                                                <!-- /.product-image -->

                                                                <div class="product-info text-left">
                                                                    <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                    <div class="rating rateit-small"></div>
                                                                    <div class="description"></div>
                                                                    <c:set value="${s.price}" var="pre"></c:set>
                                                                    <div class="product-price"> <span class="price" style="color: red"> $ ${s.price} </span> <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                                    <!-- /.product-price --> 

                                                                </div>
                                                                <!-- /.product-info -->
                                                                <div class="cart clearfix animate-effect">
                                                                    <div class="action">
                                                                        <ul class="list-unstyled">
                                                                            <li class="add-cart-button btn-group">
                                                                                <button class="btn btn-primary icon" data-toggle="dropdown" type="button" onclick="addToCart(${s.productID})"> <i class="fa fa-shopping-cart"></i> </button>
                                                                                <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})">Add to cart</button>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- /.action --> 
                                                                </div>
                                                                <!-- /.cart --> 
                                                            </div>
                                                            <!-- /.product --> 

                                                        </div>
                                                        <!-- /.products --> 
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <c:forEach items="${sessionScope.PageList}" var="s" >
                                                <div class="col-sm-6 col-md-4 col-lg-3">
                                                    <div class="item">
                                                        <div class="products">
                                                            <div class="product">
                                                                <div class="product-image">
                                                                    <div class="image"> 
                                                                        <a href="detail?pid=${s.productID}">
                                                                            <img src="${s.image}" alt=""> 
                                                                            <img src="${s.image}" alt="" class="hover-image">
                                                                        </a> 
                                                                    </div>
                                                                    <!--/.image--> 
                                                                    <div class="tag new"><span>new</span></div>
                                                                </div>
                                                                <!--/.product-image--> 

                                                                <div class="product-info text-left">
                                                                    <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                    <div class="rating rateit-small"></div>
                                                                    <div class="description"></div>
                                                                    <c:set value="${s.price}" var="pre"></c:set>
                                                                    <div class="product-price"> <span class="price" style="color: red"> $ ${s.price} </span> <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                                    <!--/.product-price-->  

                                                                </div>
                                                                <!--/.product-info--> 
                                                                <div class="cart clearfix animate-effect">
                                                                    <div class="action">
                                                                        <ul class="list-unstyled">
                                                                            <li class="add-cart-button btn-group">
                                                                                <button class="btn btn-primary icon" data-toggle="dropdown" type="button" onclick="addToCart(${s.productID})"> <i class="fa fa-shopping-cart"></i> </button>
                                                                                <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})">Add to cart</button>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--/.action-->  
                                                                </div>
                                                                <!--/.cart-->  
                                                            </div>
                                                            <!--/.product-->  

                                                        </div>
                                                        <!--/.products-->  
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <!-- /.item --> 
                                        </div>
                                        <!-- /.row --> 
                                    </div>
                                    <!-- /.category-product --> 

                                </div>
                                <!-- /.tab-pane -->

                                <div class="tab-pane "  id="list-container">
                                    <div class="category-product">
                                        <c:forEach items="${sessionScope.searchList}" var="s" >
                                            <div class="category-product-inner">
                                                <div class="products">
                                                    <div class="product-list product">
                                                        <div class="row product-list-row">
                                                            <div class="col col-sm-3 col-lg-3">
                                                                <div class="product-image">
                                                                    <div class="image"> <img src="${s.image}" alt=""> </div>
                                                                </div>
                                                                <!-- /.product-image --> 
                                                            </div>
                                                            <!-- /.col -->
                                                            <div class="col col-sm-9 col-lg-9">
                                                                <div class="product-info">
                                                                    <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                    <div class="rating rateit-small"></div>
                                                                    <div class="product-price"> <span class="price" style="font-size: larger;color: red"> $ ${s.price} </span> <span class="price-before-discount"></span> </div>
                                                                    <!-- /.product-price -->
                                                                    <div class="description m-t-10">${s.description}</div>
                                                                    <div class="cart clearfix animate-effect">
                                                                        <div class="action">
                                                                            <ul class="list-unstyled">
                                                                                <li class="add-cart-button btn-group">
                                                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button" onclick="addToCart(${s.productID})"> <i class="fa fa-shopping-cart"></i> </button>
                                                                                    <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})">Add to cart</button>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                        <!-- /.action --> 
                                                                    </div>
                                                                    <!-- /.cart --> 

                                                                </div>
                                                                <!-- /.product-info --> 
                                                            </div>
                                                            <!-- /.col --> 
                                                        </div>
                                                        <!-- /.product-list-row -->
                                                        <!--<div class="tag new"><span>new</span></div>-->
                                                    </div>
                                                    <!-- /.product-list --> 
                                                </div>
                                                <!-- /.products --> 
                                            </div>
                                            <!-- /.category-product-inner -->
                                        </c:forEach>
                                        <c:forEach items="${sessionScope.PageList}" var="s" >
                                            <div class="col-sm-6 col-md-4 col-lg-3">
                                                <div class="item">
                                                    <div class="products">
                                                        <div class="product">
                                                            <div class="product-image">
                                                                <div class="image"> 
                                                                    <a href="detail?pid=${s.productID}">
                                                                        <img src="${s.image}" alt=""> 
                                                                        <img src="${s.image}" alt="" class="hover-image">
                                                                    </a> 
                                                                </div>
                                                                <!--/.image--> 
                                                                <div class="tag new"><span>new</span></div>
                                                            </div>
                                                            <!--/.product-image--> 

                                                            <div class="product-info text-left">
                                                                <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                <div class="rating rateit-small"></div>
                                                                <div class="description"></div>
                                                                <c:set value="${s.price}" var="pre"></c:set>
                                                                <div class="product-price"> <span class="price" style="color: red"> $ ${s.price} </span> <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                                <!--/.product-price-->  

                                                            </div>
                                                            <!--/.product-info--> 
                                                            <div class="cart clearfix animate-effect">
                                                                <div class="action">
                                                                    <ul class="list-unstyled">
                                                                        <li class="add-cart-button btn-group">
                                                                            <button class="btn btn-primary icon" data-toggle="dropdown" type="button" onclick="addToCart(${s.productID})"> <i class="fa fa-shopping-cart"></i> </button>
                                                                            <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})">Add to cart</button>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!--/.action-->  
                                                            </div>
                                                            <!--/.cart-->  
                                                        </div>
                                                        <!--/.product-->  

                                                    </div>
                                                    <!--/.products-->  
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                    <!-- /.category-product --> 
                                </div>
                                <!-- /.tab-pane #list-container --> 
                            </div>
                            <!-- /.tab-content -->

                            <!-- /.filters-container --> 

                        </div>
                        <!-- /.search-result-container --> 

                    </div>
                    <!-- /.col --> 
                </div>
                <!-- /.row --> 
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->

                <!-- /.logo-slider --> 
                <!-- ============================================== BRANDS CAROUSEL : END ============================================== --> </div>
            <!-- /.container --> 

        </div>
        <!-- /.body-content --> 

        <!-- ============================================================= FOOTER ============================================================= -->
        <footer id="footer" class="footer color-bg">
            <jsp:include page="footer.jsp"/>
        </footer>
        <!-- ============================================================= FOOTER : END============================================================= --> 

        <!-- For demo purposes – can be removed on production --> 

        <!-- For demo purposes – can be removed on production : End --> 
        <script>
            function focus() {
                document.body.scrollTop = 500;
                document.documentElement.scrollTop = 500;
            }

        </script> 
        <!-- JavaScripts placed at the end of the document so the pages load faster --> 
        <script src="assets/js/jquery-1.11.1.min.js"></script> 
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/bootstrap-hover-dropdown.min.js"></script> 
        <script src="assets/js/owl.carousel.min.js"></script> 
        <script src="assets/js/echo.min.js"></script> 
        <script src="assets/js/jquery.easing-1.3.min.js"></script> 
        <script src="assets/js/bootstrap-slider.min.js"></script> 
        <script src="assets/js/jquery.rateit.min.js"></script> 
        <script src="assets/js/lightbox.min.js"></script> 
        <script src="assets/js/bootstrap-select.min.js"></script> 
        <script src="assets/js/wow.min.js"></script> 
        <script src="assets/js/scripts.js"></script>
    </body>

</html>

