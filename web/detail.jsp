<%-- 
    Document   : detail
    Created on : Jun 19, 2024, 10:45:30 PM
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
        <title>Detail Product</title>
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
        <link href="assets/css/lightbox.css" rel="stylesheet">

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
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home">Home</a></li>
                            <c:set value="${requestScope.cname}" var="name"/>
                            <c:set value="${requestScope.Detail}" var="s"/>
                        <li><a href="category?cid=${s.categoryID}">${name}</a></li>
                        <li class='active'>${s.name}</li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->
        <div class="body-content outer-top-xs">
            <div class='container'>
                <div class='row single-product'>
                    <div class='col-xs-12 col-sm-12 col-md-3 sidebar'>
                        <div class="sidebar-module-container">
                            <div class="home-banner outer-top-n outer-bottom-xs">
                                <img src="assets/images/banners/vuong.jpg" alt="Image" style="width: 100%">
                            </div>		



                            <!-- ============================================== HOT DEALS ============================================== -->
                            <div class="sidebar-widget hot-deals outer-bottom-xs">
                                <h3 class="section-title">Hot deals</h3>
                                <div class="owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-ss">
                                    <c:forEach items="${sessionScope.listP}" begin="${43}" end="${45}" var="s">
                                        <div class="item">
                                            <div class="products">
                                                <div class="hot-deal-wrapper">
                                                    <div class="image"> 
                                                        <a href="detail?pid=${s.productID}">
                                                            <img src="${s.image}" alt=""> 
                                                            <!--<img src="assets/images/hot-deals/p13_hover.jpg" alt="" class="hover-image">-->
                                                        </a>
                                                    </div>
                                                    <div class="sale-offer-tag"><span>50%<br>
                                                            off</span></div>
                                                    <div class="timing-wrapper">
                                                        <div class="box-wrapper">
                                                            <div class="date box"> <span class="key">120</span> <span class="value">DAYS</span> </div>
                                                        </div>
                                                        <div class="box-wrapper">
                                                            <div class="hour box"> <span class="key">20</span> <span class="value">HRS</span> </div>
                                                        </div>
                                                        <div class="box-wrapper">
                                                            <div class="minutes box"> <span class="key">36</span> <span class="value">MINS</span> </div>
                                                        </div>
                                                        <div class="box-wrapper">
                                                            <div class="seconds box"> <span class="key">60</span> <span class="value">SEC</span> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /.hot-deal-wrapper -->

                                                <div class="product-info text-left m-t-20">
                                                    <h3 class="name"><a href="detail.jsp">${s.name}</a></h3>
                                                    <div class="rating rateit-small"></div>
                                                    <div class="product-price"> <span class="price"> $ ${s.price} </span> <span class="price-before-discount">$ ${s.price * 2}</span> </div>
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
                        </div>
                    </div><!-- /.sidebar -->
                    <div class='col-xs-12 col-sm-12 col-md-9 rht-col'>
                        <div class="detail-block">
                            <div class="row">

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 gallery-holder">
                                    <div class="product-item-holder size-big single-product-gallery small-gallery">
                                        <div id="owl-single-product">
                                            <c:set value="${requestScope.Detail}" var="s"/>

                                            <div class="single-product-gallery-item" id="slide1">
                                                <a data-lightbox="image-1" data-title="Gallery" href="${s.image}">
                                                    <img class="img-responsive" alt="" src="${s.image}" data-echo="${s.image}" />
                                                </a>
                                            </div><!-- /.single-product-gallery-item -->
                                        </div><!-- /.single-product-slider -->


                                        <div class="single-product-gallery-thumbs gallery-thumbs">

                                            <div id="owl-single-product-thumbnails">

                                                <div class="item">
                                                    <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="1" href="${s.image}">
                                                        <img class="img-responsive" alt="" src="${s.image}" data-echo="${s.image}" />
                                                    </a>
                                                </div>

                                            </div><!-- /#owl-single-product-thumbnails -->



                                        </div><!-- /.gallery-thumbs -->

                                    </div><!-- /.single-product-gallery -->
                                </div><!-- /.gallery-holder -->        			
                                <div class='col-sm-12 col-md-8 col-lg-8 product-info-block'>
                                    <div class="product-info">
                                        <h1 class="name">${s.name}</h1>

                                        <div class="rating-reviews m-t-20">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="pull-left">
                                                        
                                                        <i class="star fa fa-star" data-value="4" style="color: gold"></i>
                                                    </div>
                                                    <div class="pull-left">
                                                        <div class="reviews">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- /.row -->		
                                        </div><!-- /.rating-reviews -->

                                        <div class="stock-container info-container m-t-10">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="pull-left">
                                                        <div class="stock-box">
                                                            <span class="label">Remain :</span>
                                                        </div>
                                                    </div>
                                                    <div class="pull-left">
                                                        <div class="stock-box">
                                                            <span class="value"><b>${s.available} products</b></span>
                                                        </div>	
                                                    </div>
                                                </div>
                                            </div><!-- /.row -->	
                                        </div><!-- /.stock-container -->

                                        <div class="description-container m-t-20">
                                            <p>${s.description}</p>
                                        </div><!-- /.description-container -->

                                        <div class="price-container info-container m-t-30">
                                            <div class="row">


                                                <div class="col-sm-6 col-xs-6">
                                                    <div class="price-box">
                                                        <span class="price">$ ${s.price}</span>
                                                        <span class="price-strike">$ ${s.price * 2}</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-xs-6">
                                                   
                                                </div>

                                            </div><!-- /.row -->
                                        </div><!-- /.price-container -->
                                        <div class="quantity-container info-container">
                                            <div class="row">

                                                <div class="add-btn">
                                                    <a href="#" class="btn btn-primary" onclick="addToCart(${s.productID})"><i class="fa fa-shopping-cart inner-right-vs"></i> ADD TO CART</a>
                                                </div>
                                            </div><!-- /.row -->
                                        </div><!-- /.quantity-container -->
                                    </div><!-- /.product-info -->
                                </div><!-- /.col-sm-7 -->

                            </div><!-- /.row -->
                        </div>

                        <div class="product-tabs inner-bottom-xs">
                            <div class="row">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="tab-content">
                                        
                                        <div id="description" class="tab-pane in active">
                                            <table class="table table-dark" border="1">
                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th style="text-align: center">Name</th>
                                                        <th style="text-align: center">Color</th>
                                                        <th style="text-align: center">Ram</th>
                                                        <th style="text-align: center">Rom</th>
                                                        <th style="text-align: center">Description</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="bg-warning">
                                                        <th scope="row"><b>${s.name}</b></th>
                                                        <td ><b>${s.color}</b></td>
                                                        <td ><b>${s.ram}</b></td>
                                                        <td ><b>${s.memory}</b></td>
                                                        <td ><b>${s.description}</b></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div><!-- /.tab-pane -->
                                        

                                    </div><!-- /.tab-content -->
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.product-tabs -->
                        
                        <!-- ============================================== UPSELL PRODUCTS ============================================== -->
                        <section class="section featured-product">
                            <div class="row">
                                <div class="col-lg-3">
                                    <h3 class="section-title">Related Product</h3>
                                    <div class="ad-imgs">
                                        <img class="img-responsive" src="assets/images/banners/home-banner1.jpg" alt="">
                                        <img class="img-responsive" src="assets/images/banners/home-banner2.jpg" alt="">
                                        <img class="img-responsive" src="assets/images/banners/home-banner3.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="owl-carousel homepage-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">
                                        <c:forEach items="${requestScope.related}"  var="s">
                                            <div class="item item-carousel">
                                                <div class="products">

                                                    <div class="product">		
                                                        <div class="product-image">
                                                            <div class="image">
                                                                <a href="detail?pid=${s.productID}"><img  src="${s.image}" alt=""></a>
                                                            </div><!-- /.image -->			
                                                            <!--<div class="tag sale"><span></span></div>-->            		   
                                                        </div><!-- /.product-image -->


                                                        <div class="product-info text-left">
                                                            <h3 class="name"><a href="detail.jsp">${s.name}</a></h3>
                                                            <div class="rating rateit-small"></div>
                                                            <div class="description"></div>

                                                            <div class="product-price">	
                                                                <span class="price">
                                                                    $ ${s.price}</span>
                                                                <span class="price-before-discount">$ ${s.price * 2}</span>

                                                            </div><!-- /.product-price -->

                                                        </div><!-- /.product-info -->
                                                        <div class="cart clearfix animate-effect">
                                                            <div class="action">
                                                                <ul class="list-unstyled">
                                                                    <li class="add-cart-button btn-group">
                                                                        <button class="btn btn-primary icon" data-toggle="dropdown" type="button"
                                                                                onclick="addToCart(${s.productID})">
                                                                            <i class="fa fa-shopping-cart"></i>													
                                                                        </button>
                                                                        <button class="btn btn-primary cart-btn" type="button" onclick="addToCart(${s.productID})">Add to cart</button>
                                                                    </li>
                                                                </ul>
                                                            </div><!-- /.action -->
                                                        </div><!-- /.cart -->
                                                    </div><!-- /.product -->

                                                </div><!-- /.products -->
                                            </div><!-- /.item -->
                                        </c:forEach>

                                    </div><!-- /.home-owl-carousel -->
                                </div>
                            </div>
                        </section><!-- /.section -->
                        <!-- ============================================== UPSELL PRODUCTS : END ============================================== -->

                    </div><!-- /.col -->
                    <div class="clearfix"></div>
                </div><!-- /.row -->
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->
                <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
        </div><!-- /.body-content -->

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
