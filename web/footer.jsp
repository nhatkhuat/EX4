<%-- 
    Document   : footer
    Created on : Jun 22, 2024, 10:10:49 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="address-block">

                            <!-- /.module-heading -->

                            <div class="module-body">
                                <ul class="toggle-footer" style="">
                                    <li class="media">
                                        <div class="pull-left"> <span class="icon fa-stack fa-lg"> <i class="fa fa-map-marker fa-stack-1x fa-inverse"></i> </span> </div>
                                        <div class="media-body">
                                            <p>ThemesGround, 789 Main rd, Anytown, CA 12345 USA</p>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <div class="pull-left"> <span class="icon fa-stack fa-lg"> <i class="fa fa-mobile fa-stack-1x fa-inverse"></i> </span> </div>
                                        <div class="media-body">
                                            <p>+(888) 123-4567<br>
                                                +(888) 456-7890</p>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <div class="pull-left"> <span class="icon fa-stack fa-lg"> <i class="fa fa-envelope fa-stack-1x fa-inverse"></i> </span> </div>
                                        <div class="media-body"> <span><a href="mailto:sunshop6428@gmail.som">Sunshop@gmail.com</a></span> </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.module-body --> 
                    </div>
                    <!-- /.col -->

                    
                </div>
            </div>
        </div>
        <div class="copyright-bar">
            <div class="container">
                <div class="col-xs-12 col-sm-4 no-padding social">
                    <ul class="link">
                        <li class="fb pull-left"><a target="_blank" rel="nofollow" href="#" title="Facebook"></a></li>
                        <li class="tw pull-left"><a target="_blank" rel="nofollow" href="#" title="Twitter"></a></li>
                        <li class="googleplus pull-left"><a target="_blank" rel="nofollow" href="#" title="GooglePlus"></a></li>
                        <li class="rss pull-left"><a target="_blank" rel="nofollow" href="#" title="RSS"></a></li>
                        <li class="pintrest pull-left"><a target="_blank" rel="nofollow" href="#" title="PInterest"></a></li>
                        <li class="linkedin pull-left"><a target="_blank" rel="nofollow" href="#" title="Linkedin"></a></li>
                        <li class="youtube pull-left"><a target="_blank" rel="nofollow" href="#" title="Youtube"></a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-4 no-padding copyright"><a target="_blank" href="https://www.templateshub.net"></a> </div>
                <div class="col-xs-12 col-sm-4 no-padding">
                    <div class="clearfix payment-methods">
                        <ul>
                            <li><img src="assets/images/payments/1.png" alt=""></li>
                            <li><img src="assets/images/payments/2.png" alt=""></li>
                            <li><img src="assets/images/payments/3.png" alt=""></li>
                            <li><img src="assets/images/payments/4.png" alt=""></li>
                            <li><img src="assets/images/payments/5.png" alt=""></li>
                        </ul>
                    </div>
                    <!-- /.payment-methods --> 
                </div>
            </div>
        </div>
        <script>
            function addToCart(id) {
                window.location = "addtocart?pid=" + id;
            }
            function minus(id) {
                window.location = "minus?cid=" + id;
            }
            function plus(id) {
                window.location = "plus?cid=" + id;
            }
            function updateQuantity(qty,cid,avai) {
                if(qty < 1){
                    qty = 1;
                }
                if(qty > avai){
                    qty = avai;
                }
                window.location = "update?qty=" + qty +"&cid="+cid;
            }
        </script>
    </body>
    
</html>
