<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0051)# -->
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>PetPeeves</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" type="text/css">

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css">

        <link rel="stylesheet" type="text/css" href="static/css/style.css">
        <link rel="stylesheet" type="text/css" href="static/css/responsive.css">
    </head>

    <body class="sign-in">
        <div class="wrapper">
            <div class="sign-in-page">
                <div class="signin-popup">
                    <div class="signin-pop">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="cmp-info">
                                    <div class="cm-logo">
                                        <img style="width: 12rem" src="static/images/cm-logo.png" alt="">
                                        <p>PetPeeves, A social media for pet lovers. Where you can find things
                                            you need for your pets</p>
                                    </div>
                                    <img src="static/images/cm-main-img.png" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="login-sec">
                                    <ul class="sign-control">
                                        <li data-tab="tab-1" class="current"><a
                                                href="#" title="">Sign
                                                in</a></li>
                                        <li data-tab="tab-2"><a href="#"
                                                                title="">Sign up</a></li>
                                    </ul>
                                    <div class="sign_in_sec current" id="tab-1">
                                        
                                        <!--sign in section-->
                                        <h3>Sign in</h3>
                                        <form id="sign-in-form" action="LoginServlet" method="post">
                                            <div class="row">
                                                <div class="col-lg-12 no-pdd">
                                                    <p class="error" id="username-error">test</p>
                                                    <div class="sn-field">
                                                        <input type="text" name="username" placeholder="Username" value="${requestScope.username}">
                                                        <i class="la la-user"></i>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <p class="error" id="password-error">test</p>
                                                    <div class="sn-field">
                                                        <input type="password" name="password" placeholder="Password" value="${requestScope.password}">
                                                        <i class="la la-lock"></i>
                                                    </div>
                                                </div>
                                                <c:set var="errors" value="${requestScope.LOGINERROR}"></c:set>
                                                <h6 style="color: red">${errors}</h6> <br><br>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="checky-sec">
                                                        <div class="fgt-sec">
                                                            <input type="checkbox" name="cc" id="c1">
                                                            <label for="c1">
                                                                <span></span>
                                                            </label>
                                                            <small>Remember me</small>
                                                        </div>
                                                        <a href="#"
                                                           title="">Forgot Password?</a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <button id="sign-in-btn" type="submit" >Sign in</button>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="login-resources">
                                            <h4>Login Via Social Account</h4>
                                            <ul>
                                                <li><a href="#" title=""
                                                       class="fb"><i class="fa-brands fa-facebook-f"></i>Login Via Facebook</a></li>
                                                <li><a href="#" title=""
                                                       class="tw"><i class="fa-brands fa-twitter"></i>Login Via Twitter</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!--sign up section-->
                                    <div class="sign_in_sec" id="tab-2">
                                        <div class="dff-tab current" id="tab-3">

                                            <c:set var="SIGNUPERROR" value="${requestScope.SIGNUPERROR}"></c:set>
                                            <form id="sign-up-form" action="SignUpServlet" method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-lg-12 no-pdd">
                                                        <p class="error" id="usernameSU-error">test</p>
                                                        <div class="sn-field">
                                                            <input type="text" name="usernameSU" placeholder="Username" value="${requestScope.usernameSU}">
                                                            <i class="la la-user"></i>
                                                        </div>
                                                    </div>
                                                    <h6 style="color: red">${SIGNUPERROR}</h6> <br><br>
                                                    <div class="col-lg-12 no-pdd">
                                                        <p class="error" id="passwordSU-error">test</p>
                                                        <div class="sn-field">
                                                            <input type="password" name="passwordSU" placeholder="Password" value="${requestScope.passwordSU}">
                                                            <i class="la la-lock"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <p class="error" id="repeat-passwordSU-error">test</p>
                                                        <div class="sn-field">
                                                            <input type="password" name="repeat-passwordSU"
                                                                   placeholder="Repeat Password" value="${requestScope.repeat_passwordSU}">
                                                            <i class="la la-lock"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="sn-field">
                                                            <p class="error" id="fullnameSU-error">test</p>
                                                            <input type="text" name="fullnameSU"
                                                                   placeholder="Fullname" value="${requestScope.fullnameSU}">
                                                            <i class="fa fa-user"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <p class="error" id="genderSU-error">test</p>
                                                        <div class="sn-field">
                                                            <select name="genderSU">
                                                                <option value="" disabled selected>Gender</option>
                                                                <option>Male</option>
                                                                <option>Female</option>
                                                                <option>Others</option>
                                                            </select>
                                                            <i class="fa fa-venus-mars"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <p class="error" id="birthdaySU-error">test</p>
                                                        <div class="sn-field">
                                                            <input type="date" name="birthdaySU" value="${requestScope.birthdaySU}">
                                                            <i class="fa fa-calendar-days"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <p class="error" id="locationSU-error">test</p>
                                                        <div class="sn-field">
                                                            <input type="text" name="locationSU" placeholder="Location" value="${requestScope.locationSU}">
                                                            <i class="la la-globe"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="sn-field">
                                                            <input type="file" name="imageSU"></input>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="checky-sec st2">
                                                            <div class="fgt-sec">
                                                                <input type="checkbox" name="cc" id="c2">
                                                                <label for="c2">
                                                                    <span></span>
                                                                </label>
                                                                <small>Yes, I understand and agree to the workwise Terms
                                                                    &amp; Conditions.</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <button type="submit" value="submit">Get Started</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footy-sec">
                    <div class="container">
                        <ul>
                            <li><a href="https://gambolthemes.net/workwise-new/help-center.html" title="">Help Center</a>
                            </li>
                            <li><a href="https://gambolthemes.net/workwise-new/about.html" title="">About</a></li>
                            <li><a href="#" title="">Privacy Policy</a>
                            </li>
                            <li><a href="#" title="">Community
                                    Guidelines</a></li>
                            <li><a href="#" title="">Cookies Policy</a>
                            </li>
                            <li><a href="#" title="">Career</a></li>
                            <li><a href="https://gambolthemes.net/workwise-new/forum.html" title="">Forum</a></li>
                            <li><a href="#" title="">Language</a></li>
                            <li><a href="#" title="">Copyright Policy</a>
                            </li>
                        </ul>
                        <p><img src="static/images/copy-icon.png" alt="">Copyright 2019</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="static/js/jquery.min.js"></script>
        <script type="text/javascript" src="static/js/popper.js"></script>
        <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/slick.min.js"></script>
        <script type="text/javascript" src="static/js/script.js"></script>
        <script type="text/javascript" src="static/js/validate.js"></script>

    </body>

</html>
