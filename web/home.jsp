<%-- 
    Document   : home
    Created on : Jun 19, 2024, 8:20:18 PM
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
        <title>Home page</title>
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/blue.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/rateit.css">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="assets/css/font-awesome.css">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Barlow:200,300,300i,400,400i,500,500i,600,700,800" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body class="cnt-home">
        <!-- ============================================== HEADER ============================================== -->
        <header class="header-style-1"> 
            <jsp:include page="header.jsp" />
        </header>

        <!-- ============================================== HEADER : END ============================================== -->
        <div class="body-content outer-top-vs" id="top-banner-and-menu">
            <div class="container">
                <div class="row">
                    <!-- ============================================== SIDEBAR ============================================== -->
                    <div class="col-xs-12 col-sm-12 col-md-3 sidebar"> 

                        <!-- ================================== TOP NAVIGATION ================================== -->
                        <div class="side-menu animate-dropdown outer-bottom-xs">
                            <div class="head"><i class="icon fa fa-align-justify fa-fw"></i> Categories</div>
                            <nav class="yamm megamenu-horizontal">
                                <ul class="nav">
                                    <c:forEach items="${sessionScope.listC}" var="c" >
                                        <li class="dropdown menu-item"> <a href="category?cid=${c.categoryID}" >
                                                <i class="icon fa fa-mobile" aria-hidden="true"></i>${c.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <!-- /.nav --> 
                            </nav>
                            <!-- /.megamenu-horizontal --> 
                        </div>
                        <!-- /.side-menu --> 
                        <!-- ================================== TOP NAVIGATION : END ================================== --> 

                        <!-- ============================================== HOT DEALS ============================================== -->
                        <div class="sidebar-widget hot-deals outer-bottom-xs">
                            <h3 class="section-title">Hot deals</h3>
                            <div class=" sidebar-carousel custom-carousel owl-theme outer-top-ss">
                                <c:forEach items="${sessionScope.listP}" begin="${43}" end="${45}" var="s">
                                    <div class="item">
                                        <div class="products">
                                            <div class="hot-deal-wrapper">
                                                <div class="image"> 
                                                    <a href="detail?pid=${s.productID}">
                                                        <img src="${s.image}" alt=""> 
                                                        <img src="${s.image}" alt="" class="hover-image">
                                                    </a>
                                                </div>
                                                <div class="sale-offer-tag"><span>49%<br>
                                                        off</span>
                                                </div>
                                            </div>
                                            <div class="product-info text-left m-t-20">
                                                <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                <div class="rating rateit-small"></div>
                                                <c:set value="${s.price}" var="pre"></c:set>
                                                <div class="product-price"> <span class="price" style="color: red">$ ${s.price} </span> <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                <!-- /.product-price --> 

                                            </div>
                                            <!-- /.product-info -->

                                            <div class="cart clearfix animate-effect">
                                                <div class="action">
                                                    <div class="add-cart-button btn-group">
                                                        <button class="btn btn-primary icon" data-toggle="dropdown" type="button" onclick="addToCart(${s.productID})"> <i class="fa fa-shopping-cart"></i> </button>
                                                        <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})">Add to cart</button>
                                                    </div>
                                                </div>
                                                <!-- /.action --> 
                                            </div>
                                            <!-- /.cart --> 
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- /.sidebar-widget --> 
                        </div>
                        <!-- ============================================== HOT DEALS: END ============================================== --> 

                        <!-- ============================================== SPECIAL OFFER ============================================== -->

                        <div class="sidebar-widget outer-bottom-small">
                            <h3 class="section-title">Special Offer</h3>
                            <div class="sidebar-widget-body outer-top-xs">
                                <div class="owl-carousel sidebar-carousel special-offer custom-carousel owl-theme outer-top-xs">

                                    <div class="item">
                                        <c:forEach items="${sessionScope.listP}" begin="${55}" end="${57}" var="s">
                                            <div class="products special-product">
                                                <div class="product">
                                                    <div class="product-micro">
                                                        <div class="row product-micro-row">
                                                            <div class="col col-xs-5">
                                                                <div class="product-image">
                                                                    <div class="image"> <a href="detail?pid=${s.productID}"> <img src="${s.image}"  alt=""> </a> </div>
                                                                    <!-- /.image --> 
                                                                </div>
                                                                <!-- /.product-image --> 
                                                            </div>
                                                            <!-- /.col -->
                                                            <div class="col col-xs-7">
                                                                <div class="product-info">
                                                                    <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                    <div class="rating rateit-small"></div>
                                                                    <c:set value="${s.price}" var="pre"></c:set>
                                                                        <div class="product-price">
                                                                            <span class="price" style="color: red"> $ ${s.price} </span>
                                                                        <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                                    <!-- /.product-price --> 

                                                                </div>
                                                            </div>
                                                            <!-- /.col --> 
                                                        </div>
                                                        <!-- /.product-micro-row --> 
                                                    </div>
                                                    <!-- /.product-micro --> 
                                                </div>              
                                            </div>
                                        </c:forEach>                        
                                    </div>

                                </div>
                            </div>
                            <!-- /.sidebar-widget-body --> 
                        </div>
                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== SPECIAL OFFER : END ============================================== --> 
                        <!-- ============================================== PRODUCT TAGS ============================================== -->
                        
                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== PRODUCT TAGS : END ============================================== --> 
                        <!-- ============================================== SPECIAL DEALS ============================================== -->

                        <div class="sidebar-widget outer-bottom-small">
                            <h3 class="section-title">Special Deals</h3>
                            <div class="sidebar-widget-body outer-top-xs">
                                <div class="owl-carousel sidebar-carousel special-offer custom-carousel owl-theme outer-top-xs">
                                    <div class="item">
                                        <div class="products special-product">

                                            <c:forEach items="${sessionScope.listP}" begin="${16}" end="${18}" var="s">
                                                <div class="product">
                                                    <div class="product-micro">
                                                        <div class="row product-micro-row">
                                                            <div class="col col-xs-5">
                                                                <div class="product-image">
                                                                    <div class="image"> <a href="detail?pid=${s.productID}"> <img src="${s.image}"  alt=""> </a> </div>
                                                                    <!-- /.image --> 

                                                                </div>
                                                                <!-- /.product-image --> 
                                                            </div>
                                                            <!-- /.col -->
                                                            <div class="col col-xs-7">
                                                                <div class="product-info">
                                                                    <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                    <div class="rating rateit-small"></div>
                                                                    <c:set value="${s.price}" var="pre"></c:set>
                                                                        <div class="product-price">
                                                                            <span class="price" style="color: red"> $ ${s.price} </span> <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                                    <!-- /.product-price --> 

                                                                </div>
                                                            </div>
                                                            <!-- /.col --> 
                                                        </div>
                                                        <!-- /.product-micro-row --> 
                                                    </div>
                                                    <!-- /.product-micro --> 

                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="products special-product">
                                            <c:forEach items="${sessionScope.listP}" begin="${31}" end="${33}" var="s">
                                                <div class="product">
                                                    <div class="product-micro">
                                                        <div class="row product-micro-row">
                                                            <div class="col col-xs-5">
                                                                <div class="product-image">
                                                                    <div class="image"> <a href="detail?pid=${s.productID}"> <img src="${s.image}"  alt=""> </a> </div>
                                                                    <!-- /.image --> 

                                                                </div>
                                                                <!-- /.product-image --> 
                                                            </div>
                                                            <!-- /.col -->
                                                            <div class="col col-xs-7">
                                                                <div class="product-info">
                                                                    <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                    <div class="rating rateit-small"></div>
                                                                    <div class="product-price"> <span class="price" style="color: red"> ${s.price} </span> </div>
                                                                    <!-- /.product-price --> 

                                                                </div>
                                                            </div>
                                                            <!-- /.col --> 
                                                        </div>
                                                        <!-- /.product-micro-row --> 
                                                    </div>
                                                    <!-- /.product-micro --> 

                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- /.sidebar-widget-body --> 
                        </div>
                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== SPECIAL DEALS : END ============================================== --> 
                    </div>
                    <!-- /.sidemenu-holder --> 
                    <!-- ============================================== SIDEBAR : END ============================================== --> 

                    <!-- ============================================== CONTENT ============================================== -->
                    <div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder"> 
                        <!-- ========================================== SECTION – HERO ========================================= -->
                        <div id="hero">
                            <div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
                                <div class="item" style="background-image: url(assets/images/sliders/03.png);">
                                    <div class="container-fluid">
                                        <div class="caption bg-color vertical-center text-left">
                                        </div>
                                        <!-- /.caption --> 
                                    </div>
                                    <!-- /.container-fluid --> 
                                </div>
                                <!-- /.item -->

                                <div class="item" style="background-image: url(assets/images/sliders/04.png);">
                                    <div class="container-fluid">
                                        <div class="caption bg-color vertical-center text-left">
                                        </div>
                                        <!-- /.caption --> 
                                    </div>
                                    <!-- /.container-fluid --> 
                                </div>
                                <!-- /.item --> 

                            </div>
                            <!-- /.owl-carousel --> 
                        </div>

                        <!-- ========================================= SECTION – HERO : END ========================================= --> 


                        <!-- ============================================== SCROLL TABS ============================================== -->
                        <div id="product-tabs-slider" class="scroll-tabs outer-top-vs">
                            <div class="more-info-tab clearfix ">
                                <h3 class="new-product-title pull-left">iPhone</h3>
                                <ul class="nav nav-tabs nav-tab-line pull-right" id="new-products-1">
                                    <li class="active"><a data-transition-type="backSlide" href="#all" data-toggle="tab"></a></li>
                                    <li><a data-transition-type="backSlide" href="#smartphone" data-toggle="tab"></a></li>
                                    <li><a data-transition-type="backSlide" href="#laptop" data-toggle="tab"></a></li>
                                    <li><a data-transition-type="backSlide" href="#apple" data-toggle="tab"></a></li>
                                </ul>
                                <!-- /.nav-tabs --> 
                            </div>
                            <div class="tab-content outer-top-xs">
                                <div class="tab-pane in active" id="all">
                                    <div class="product-slider">
                                        <div class="owl-carousel home-owl-carousel custom-carousel owl-theme">
                                            <!-- /.item -->
                                            <c:forEach items="${sessionScope.listP}" begin="${0}" end="${18}" var="s">
                                                <div class="item item-carousel">
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
                                                            </div>
                                                            <!-- /.product-image -->
                                                            <div class="product-info text-left">
                                                                <h3 class="name"><a href="detail?pid=${s.productID}">${s.name}</a></h3>
                                                                <div class="rating rateit-small"></div>
                                                                <div class="description"></div><c:set value="${s.price}" var="pre"></c:set>
                                                                    <div class="product-price"> 
                                                                        <span class="price" style="color: red"> $ ${s.price} </span> 
                                                                    <span class="price-before-discount">$ ${pre * 2}</span> </div>
                                                                <!-- /.product-price --> 

                                                            </div>
                                                            <!-- /.product-info -->
                                                            <div class="cart clearfix animate-effect">
                                                                <div class="action">
                                                                    <ul class="list-unstyled">
                                                                        <li class="add-cart-button btn-group">
                                                                            <button class="btn btn-primary icon" data-toggle="dropdown" type="button" onclick="addToCart(${s.productID})"> <i class="fa fa-shopping-cart"></i> </button>
                                                                            <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})" >Add to cart</button>
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
                                            </c:forEach>
                                            <!-- /.item -->
                                        </div>
                                        <!-- /.home-owl-carousel --> 
                                    </div>
                                    <!-- /.product-slider --> 
                                </div>
                                <!-- /.tab-pane -->

                            </div>
                            <!-- /.tab-content --> 
                        </div>
                        <!-- /.scroll-tabs --> 
                        <!-- ============================================== SCROLL TABS : END ============================================== --> 
                        <!-- ============================================== WIDE PRODUCTS ============================================== -->
                        <div class="wide-banners outer-bottom-xs">
                            <div class="row">
                                <div class="col-md-4 col-sm-4">
                                    <div class="wide-banner cnt-strip">
                                        <div class="image"> <img class="img-responsive" src="assets/images/banners/home1.jpg" alt=""> </div>
                                    </div>
                                    <!-- /.wide-banner --> 
                                </div>

                                <div class="col-md-4 col-sm-4">
                                    <div class="wide-banner cnt-strip">
                                        <div class="image"> <img class="img-responsive" src="assets/images/banners/home2.jpg" alt=""> </div>
                                    </div>
                                    <!-- /.wide-banner --> 
                                </div>

                                <!-- /.col -->
                                <div class="col-md-4 col-sm-4">
                                    <div class="wide-banner cnt-strip">
                                        <div class="image"> <img class="img-responsive" src="assets/images/banners/home3.jpg" alt=""> </div>
                                    </div>
                                    <!-- /.wide-banner --> 
                                </div>
                                <!-- /.col --> 
                            </div>
                            <!-- /.row --> 
                        </div>
                        <!-- /.wide-banners --> 

                        <!-- ============================================== WIDE PRODUCTS : END ============================================== --> 
                        <!-- ============================================== FEATURED PRODUCTS ============================================== -->
                        <section class="section featured-product">
                            <div class="row">
                                <div class="col-lg-3">
                                    <h3 class="section-title">Smartphone</h3>
                                    <ul class="sub-cat">
                                        <c:forEach items="${sessionScope.listC}" var="c" >
                                        <li class="dropdown menu-item"> <a href="category?cid=${c.categoryID}" >
                                                ${c.name}</a>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-lg-9">
                                    <div class="owl-carousel homepage-owl-carousel custom-carousel owl-theme outer-top-xs">
                                        <c:forEach items="${sessionScope.listP}" begin="${0}" end="${64}" var="s">
                                            <div class="item item-carousel">
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
                                                            <!--<div class="tag hot"><span></span></div>-->
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
                                        </c:forEach>

                                        <!-- /.item --> 
                                    </div>
                                </div>
                            </div>
                            <!-- /.home-owl-carousel --> 
                        </section>
                        <!-- /.section --> 

                        <!-- ============================================== FEATURED PRODUCTS ============================================== -->
                        <section class="section new-arriavls">
                            <h3 class="section-title">Featured Products</h3>
                            <div class="owl-carousel home-owl-carousel custom-carousel owl-theme outer-top-xs">
                                <c:forEach items="${sessionScope.listP}" begin="${44}" end="${45}" var="s">
                                    <div class="item item-carousel">
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
                                                        <div class="product-price"> 
                                                            <span class="price" style="color: red"> $ ${s.price} </span> 
                                                        <span class="price-before-discount">$ ${pre * 2}</span> </div>
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
                                </c:forEach>
                                <c:forEach items="${sessionScope.listP}" begin="${54}" end="${55}" var="s">
                                    <div class="item item-carousel">
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
                                </c:forEach>
                                <c:forEach items="${sessionScope.listP}" begin="${17}" end="${18}" var="s">
                                    <div class="item item-carousel">
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
                                </c:forEach>
                                <!-- /.item --> 
                            </div>
                            <!-- /.home-owl-carousel --> 
                        </section>
                        <!-- /.section --> 
                        <!-- ============================================== FEATURED PRODUCTS : END ============================================== --> 

                    </div>
                    <!-- /.homebanner-holder --> 
                    <!-- ============================================== CONTENT : END ============================================== --> 
                </div>
                <!-- /.row --> 
            </div>
            <!-- /.container --> 
        </div>
        <!-- /#top-banner-and-menu --> 
        <!-- ============================================== INFO BOXES : END ============================================== --> 
        <!-- ============================================================= FOOTER ============================================================= -->
        <footer id="footer" class="footer color-bg">
            <jsp:include page="footer.jsp"/>
        </footer>
        <!-- ============================================================= FOOTER : END============================================================= --> 

        <!-- For demo purposes – can be removed on production --> 

        <!-- For demo purposes – can be removed on production : End --> 

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
