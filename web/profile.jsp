<%-- 
    Document   : profile
    Created on : Jun 25, 2024, 5:12:11 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">
        <style>
            body{
                background: -webkit-linear-gradient(left, #3931af, #00c6ff);
            }
            .emp-profile{
                padding: 3%;
                margin-top: 3%;
                margin-bottom: 3%;
                border-radius: 0.5rem;
                background: #fff;
            }
            .profile-img{
                text-align: center;
            }
            .profile-img img{
                width: 70%;
                height: 100%;
            }
            .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                background: #212529b8;
            }
            .profile-img .file input {
                position: absolute;
                opacity: 0;
                right: 0;
                top: 0;
            }
            .profile-head h5{
                color: #333;
            }
            .profile-head h6{
                color: #0062cc;
            }
            .profile-edit-btn{
                border: none;
                border-radius: 1.5rem;
                width: 70%;
                padding: 2%;
                font-weight: 600;
                color: #6c757d;
                cursor: pointer;
            }
            .proile-rating{
                font-size: 12px;
                color: #818182;
                margin-top: 5%;
            }
            .proile-rating span{
                color: #495057;
                font-size: 15px;
                font-weight: 600;
            }
            .profile-head .nav-tabs{
                margin-bottom:5%;
            }
            .profile-head .nav-tabs .nav-link{
                font-weight:600;
                border: none;
            }
            .profile-head .nav-tabs .nav-link.active{
                border: none;
                border-bottom:2px solid #0062cc;
            }
            .profile-work{
                padding: 14%;
                margin-top: -15%;
            }
            .profile-work p{
                font-size: 12px;
                color: #818182;
                font-weight: 600;
                margin-top: 10%;
            }
            .profile-work a{
                text-decoration: none;
                color: #495057;
                font-weight: 600;
                font-size: 14px;
            }
            .profile-work ul{
                list-style: none;
            }
            .profile-tab label{
                font-weight: 600;
            }
            .profile-tab p{
                font-weight: 600;
                color: #0062cc;
            }
            .container{
                background: -webkit-linear-gradient(left,#E3F2E1 , #E3F2E1);
            }
            .input input{
                background-color: #E3F2E1;
                border-radius: 22px;
                color: #3931af;
            }

        </style>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>

        <div class="container emp-profile">
            <form method="post" action="profile">
                <div class="row" style="height: 150px">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <a href="home">
                                <img src="assets/images/logo.png" alt="" style="border-radius:50%"/></a>
                        </div>
                    </div>
                    <c:set value="${sessionScope.customer}" var="s" />
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>
                                ${s.fullName}
                            </h5>
                            <h6>
                                <c:if test="${s.cusID != 1}"> Customer   </c:if>
                                <c:if test="${s.cusID == 1}"> Admin   </c:if>
                                </h6>
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="btn btn-primary" name="btnAddMore" value="Save Profile"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-8">
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>User ID</label>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input">
                                                <input type="text" name="customerid" placeholder="UserID" value="${s.cusID}" readonly
                                                   style="text-align: center">
                                        </div>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Name</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span >
                                                <input type="text" name="name" placeholder="Full Name" value="${s.fullName}" required 
                                                       style="text-align: center">
                                            </span>
                                        </div>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Gender</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span style="display: flex;justify-content: space-evenly;width: 230px">
                                                <span style="color: #3931af"><input type="radio" name="gender" value="1"  ${s.gender == 1 ? "checked":""}  > 
                                                    Male</span>
                                                <span style="color: #3931af"><input type="radio" name="gender" value="0"  ${s.gender == 0 ? "checked":""} > 
                                                    Female</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Date of birth</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span>
                                                <input type="date" name="dob" placeholder="Date of birth" value="${s.dob}" required
                                                       style="text-align: center;width: 236px">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Email</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span >
                                                <input type="text" name="email" placeholder="Email" value="${s.email}" required
                                                       style="text-align: center">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Phone</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span >
                                                <input type="text" name="phone" placeholder="Phone number" value="${s.phoneNumber}" required
                                                       style="text-align: center">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                
                                <c:set value="${sessionScope.customerAcc}" var="acc" />
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Username</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span >
                                                <input type="text" name="username" placeholder="Username" value="${acc.username}" required
                                                       style="text-align: center">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Password</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input">
                                            <span >
                                                <input type="text" name="password" placeholder="Password" value="${acc.password}" required
                                                       style="text-align: center">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="reset" class="btn btn-primary" name="resetbtn" value="Reset"/>

                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>           
        </div>
    </body>
</html>
