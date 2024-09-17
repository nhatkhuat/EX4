<%-- 
    Document   : forgotPass
    Created on : Jul 9, 2024, 10:03:25 PM
    Author     : nhatk
--%>

<%-- 
    Document   : mainlogin
    Created on : Jun 22, 2024, 6:12:47 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Forgot passwords</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">
        <style>
            /* Import Google font - Poppins */
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins",
                    sans-serif;
            }
            body {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: #f0faff;
            }
            .wrapper {
                position: relative;
                max-width: 470px;
                width: 100%;
                border-radius: 12px;
                padding: 20px
                    30px
                    30px;
                background: #4070f4;
                box-shadow: 0
                    5px
                    10px
                    rgba(
                    0,
                    0,
                    0,
                    0.1
                    );
                overflow: hidden;
            }
            .form.login {
                position: absolute;
                left: 50%;
                bottom: -86%;
                transform: translateX(
                    -50%
                    );
                width: calc(
                    100% +
                    220px
                    );
                padding: 20px
                    140px;
                border-radius: 50%;
                height: 101%;
                background: #fff;
                transition: all
                    0.6s
                    ease;
            }
            .wrapper.active
            .form.login {
                bottom: -15%;
                border-radius: 35%;
                box-shadow: 0 -5px
                    10px rgba(0, 0, 0, 0.1);
            }
            .form
            header {
                font-size: 30px;
                text-align: center;
                color: #fff;
                font-weight: 600;
                cursor: pointer;
            }
            .form.login
            header {
                color: #333;
                opacity: 0.6;
            }
            .wrapper.active
            .form.login
            header {
                opacity: 1;
            }
            .wrapper.active
            .signup
            header {
                opacity: 0.6;
            }
            .wrapper
            form {
                display: flex;
                flex-direction: column;
                gap: 20px;
                margin-top: 40px;
            }
            form
            input {
                height: 60px;
                outline: none;
                border: none;
                padding: 0
                    15px;
                font-size: 16px;
                font-weight: 400;
                color: #333;
                border-radius: 8px;
                background: #fff;
            }
            .form.login
            input {
                border: 1px
                    solid
                    #aaa;
            }
            .form.login
            input:focus {
                box-shadow: 0
                    1px 0
                    #ddd;
            }
            form
            .checkbox {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .checkbox
            input[type="checkbox"] {
                height: 16px;
                width: 16px;
                accent-color: #fff;
                cursor: pointer;
            }
            form
            .checkbox
            label {
                cursor: pointer;
                color: #fff;
            }
            form a {
                color: #333;
                text-decoration: none;
            }
            form
            a:hover {
                text-decoration: underline;
            }
            form
            input[type="submit"] {
                margin-top: 15px;
                padding: none;
                font-size: 18px;
                font-weight: 500;
                cursor: pointer;
            }
            .form.login
            input[type="submit"] {
                background: #4070f4;
                color: #fff;
                border: none;
            }

        </style>
    </head>
    <body>
        <div class="logo" style="margin-right: 8%;margin-left: -30%; margin-top: -20%"> 
            <a href="home"> <img src="assets/images/logo.png" alt="logo" style="width: 100%;border-radius: 50%" > </a> 
        </div>
        <c:set value="${requestScope.loginRequire}" var="login"/>
        
        <c:set var="s" value="${pageContext.request.cookies}"/>
        <section class="wrapper">
            <div style="color: orange;font-size: 100%;text-align: center"> <b>${login} </b></div>
            <div class="form signup">
                <header>Retrieve password</header>
                <form action="retrieve" method="post" onsubmit="return validateEmail()">
                    <input type="text" id="email" name="email" placeholder="Enter your email" required value="${requestScope.email}"/>
                    
                    <c:set var="success" value="${requestScope.success}" />
                    <c:if test="${success != null}" >
                        <div style="color: yellow"> ${success}</div>
                    </c:if>
                    
                    
                    <a href="login.jsp" style="color: lightgreen;font-size: 60%">Back to login</a>
                    <input type="submit" value="Retrieve" />
                </form>
            </div>

            <script type="text/javascript">
                var regex = /^\d{10}$/;//phone
                function validateEmail() {
                var email = document.getElementById("email").value;
                var regex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
                if (!regex.test(email)) {
                    alert("Please enter a valid Email address (example@gmail.com)");
                    document.getElementById("email").focus();
                    return false;
                }
                return true;
            }
            </script>
        </section>
    </body>
</html>

