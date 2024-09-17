<%-- 
    Document   : sidebar
    Created on : Jun 22, 2024, 10:15:46 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class='col-xs-12 col-sm-12 col-md-3 sidebar'>
            <!-- ================================== TOP NAVIGATION ================================== -->
            <div class="side-menu animate-dropdown outer-bottom-xs">
                <div class="head"><i class="icon fa fa-align-justify fa-fw"></i>Categories</div>
                <nav class="yamm megamenu-horizontal">
                    <ul class="nav">
                        <c:forEach items="${sessionScope.listC}" var="c" >
                            <li class="dropdown menu-item" >
                            <c:if test="${c.name == name}" >
                                <a href="category?cid=${c.categoryID}" class="dropdown-toggle" style="background-color: lightcyan" >
                                    <i class="icon fa fa-mobile" aria-hidden="true"></i>${c.name}</a>
                            </c:if>
                            <c:if test="${c.name ne name}" >
                                <a href="category?cid=${c.categoryID}" class="dropdown-toggle" >
                                    <i class="icon fa fa-mobile" aria-hidden="true"></i>${c.name}</a>
                            </c:if>
                            </li>
                        </c:forEach>
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
                    <div class="sidebar-widget">
                        <h3 class="section-title">Shop by</h3>
                        <div class="widget-header">
                            <h4 class="widget-title">Category</h4>
                        </div>
                        <div class="sidebar-widget-body">
                            <div class="accordion">

                                <div class="accordion-group">
                                    <div class="accordion-heading"> <a href="#collapseSix" data-toggle="collapse" class="accordion-toggle collapsed"> Accessories </a> </div>
                                    <!-- /.accordion-heading -->
                                    <div class="accordion-body collapse" id="collapseSix" style="height: 0px;">
                                        <div class="accordion-inner">
                                            <ul>
                                                <li><a href="#">gaming</a></li>
                                                <li><a href="#">office</a></li>
                                                <li><a href="#">kids</a></li>
                                                <li><a href="#">for women</a></li>
                                            </ul>
                                        </div>
                                        <!-- /.accordion-inner --> 
                                    </div>
                                    <!-- /.accordion-body --> 
                                </div>
                                <!-- /.accordion-group --> 

                            </div>
                            <!-- /.accordion --> 
                        </div>
                        <!-- /.sidebar-widget-body --> 
                    </div>
                    <!-- /.sidebar-widget --> 
                    <!-- ============================================== SIDEBAR CATEGORY : END ============================================== --> 

                    <!-- ============================================== PRICE SILDER============================================== -->
                    <div class="sidebar-widget">
                        <div class="widget-header">
                            <h4 class="widget-title">Price Slider</h4>
                        </div>
                        <div class="sidebar-widget-body m-t-10">
                            <div class="price-range-holder"> <span class="min-max"> <span class="pull-left">$200.00</span> <span class="pull-right">$800.00</span> </span>
                                <input type="text" id="amount" style="border:0; color:#666666; font-weight:bold;text-align:center;">
                                <input type="text" class="price-slider" value="" >
                            </div>
                            <!-- /.price-range-holder --> 
                            <a href="#" class="lnk btn btn-primary">Show Now</a> </div>
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
                                <li><a href="#">4GB</a></li>
                                <li><a href="#">6GB</a></li>
                                <li><a href="#">8GB</a></li>
                                <li><a href="#">12GB</a></li>

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
                                <li><a href="#">Red</a></li>
                                <li><a href="#">Blue</a></li>
                                <li><a href="#">Yellow</a></li>
                                <li><a href="#">Pink</a></li>
                                <li><a href="#">Brown</a></li>
                                <li><a href="#">Teal</a></li>
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
    </body>
</html>
