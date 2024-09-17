<%-- 
    Document   : cart
    Created on : Jun 19, 2024, 10:43:11 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="dal.DAO"%>
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
        <title>My Cart</title>

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
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li class='active'>Shopping Cart</li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->

        <div class="body-content outer-top-xs">
            <div class="container">
                <div class="row ">
                    <div class="shopping-cart">
                        <div class="shopping-cart-table ">
                            <div class="table-responsive">
                                <table class="table" style="font-size: 150%">
                                    <thead>
                                        <tr>

                                            <th class="cart-description item">Image</th>
                                            <th class="cart-product-name item">Product Name</th>
                                            <th class="cart-edit item">Price</th>
                                            <th class="cart-qty item">Quantity</th>
                                            <th class="cart-total last-item">Grandtotal</th>
                                            <th class="cart-romove item">Remove</th>
                                        </tr>
                                    </thead><!-- /thead -->
                                    <tbody>
                                        <c:forEach items="${sessionScope.CartList}" var="s" >
                                            <tr>
                                                <td class="cart-image">
                                                    <a class="entry-thumbnail" href="detail?pid=${s.productID}">
                                                        <img src="${s.image}" alt="">
                                                    </a>
                                                </td>
                                                <c:set value="${s.productID}" var="pid"/>
                                                <c:set value="${sessionScope.dao}" var="dao"/>
                                                <c:set var="product" value="${dao.getProductByProductID(pid)}" />
                                                <c:set var="avai" value="${product.available}" />
                                                <td class="cart-product-name-info">
                                                    <h4 class='cart-product-description' style="text-align: center">${s.productName}</h4>
                                                    <c:set value="${total + s.total}" var="total"/>
                                                </td>
                                                <td class="cart-product-edit">$ ${s.price}</td>
                                                <td class="cart-product-quantity">
                                                    <div class="qty-input">
                                                        <c:if test="${s.quantity > 1}">
                                                        <button class="qty-count qty-count--minus" onclick="minus(${s.cartID})" type="button" >-</button>
                                                        </c:if>
                                                        <input style="width: 50px" type="number" name="qty" min="1" max="${avai}" value="${s.quantity}" 
                                                               data-cartid="${s.cartID}" onchange="updateQuantity(this.value,${s.cartID},${avai} )" >
                                                        <c:if test="${s.quantity < avai}" >
                                                        <button class="qty-count qty-count--add" onclick="plus(${s.cartID})" type="button">+</button>
                                                        </c:if>
                                                    </div>
                                                </td>
                                                <td class="cart-product-sub-total" style="color: red">$ ${s.total}</td>
                                                <td class="romove-item"><a href="remove?cartid=${s.cartID}" title="cancel" class="icon"><i class="fa fa-trash-o"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody><!-- /tbody -->
                                </table><!-- /table -->
                            </div>
                        </div><!-- /.shopping-cart-table -->				


                        <div class="col-md-4 col-sm-12 cart-shopping-total" style="float: right">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            <div class="cart-grand-total">
                                                Grand Total<span class="inner-left-md" style="font-size: 120%">$ ${total}</span>
                                            </div>
                                        </th>
                                    </tr>
                                </thead><!-- /thead -->
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="cart-checkout-btn pull-right">
                                                <a href="checkout"><button type="submit" class="btn btn-primary checkout-btn">PROCCED TO CHEKOUT</button></a>
                                                <span class=""></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody><!-- /tbody -->
                            </table><!-- /table -->
                        </div><!-- /.cart-shopping-total -->			</div><!-- /.shopping-cart -->
                </div> <!-- /.row -->
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
