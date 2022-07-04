<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 7/4/2022
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<!-- saved from url=(0066) -->--%>
<%--<html>--%>

<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

<%--    <title>WorkWise Html Template</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="keywords" content="">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/animate.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">--%>

<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">--%>
<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet"--%>
<%--          type="text/css">--%>

<%--    <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/jquery.mCustomScrollbar.min.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/slick.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/slick-theme.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/style.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/responsive.css">--%>
<%--    <script src="./js/jquery.mousewheel.min.js"></script>--%>
<%--</head>--%>

<%--<body>--%>
<%--<div class="wrapper">--%>
    <jsp:include page="header.jsp"></jsp:include>

    <section class="profile-account-setting">
        <div class="container">
            <div class="account-tabs-setting">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="acc-leftbar">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-acc-tab" data-toggle="tab"
                                   href="#nav-acc"
                                   role="tab" aria-controls="nav-acc" aria-selected="true"><i
                                        class="la la-cogs"></i>Account Setting</a>
                                <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab"
                                   href="#nav-password"
                                   role="tab" aria-controls="nav-password" aria-selected="false"><i
                                        class="fa fa-lock"></i>Change Password</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-acc" role="tabpanel"
                                 aria-labelledby="nav-acc-tab">
                                <div class="acc-setting">
                                    <h3>Account Setting</h3>
                                    <form>
                                        <div class="cp-field">
                                            <h5>Name</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="fullname" placeholder="Enter your full name">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Date of birth</h5>
                                            <div class="cpp-fiel">
                                                <input type="date" name="birthday">
                                                <i class="fa fa-calendar-days"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Gender</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="gender"
                                                       placeholder="Enter your gender">
                                                <i class="fa fa-venus-mars"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Location</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="location"
                                                       placeholder="Enter your location">
                                                <i class="fa fa-location-dot"></i>
                                            </div>
                                        </div>
                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li><button type="submit">Save Setting</button></li>
                                                <li><button type="submit">Restore Setting</button></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-password" role="tabpanel"
                                 aria-labelledby="nav-password-tab">
                                <div class="acc-setting">
                                    <h3>Account Setting</h3>
                                    <form>
                                        <div class="cp-field">
                                            <h5>Old Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="old-password" placeholder="Old Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>New Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="new-password" placeholder="New Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Repeat Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="repeat-password"
                                                       placeholder="Repeat Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><a href="#"
                                                   title="">Forgot Password?</a></h5>
                                        </div>
                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li><button type="submit">Save Setting</button></li>
                                                <li><button type="submit">Restore Setting</button></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="static/jquery.min.js"></script>
<script type="text/javascript" src="static/popper.js"></script>
<script type="text/javascript" src="static/bootstrap.min.js"></script>
<script type="text/javascript" src="static/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="static/slick.min.js"></script>
<script type="text/javascript" src="static/script.js"></script>

</body>

</html>
