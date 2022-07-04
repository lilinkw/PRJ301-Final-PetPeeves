<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/19/2022
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0048) -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet"
          type="text/css">


    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js">

    <link rel="stylesheet" type="text/css" href="static/css/slick.css">
    <link rel="stylesheet" type="text/css" href="static/css/slick-theme.css">

    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>
</head>

<body>
<div class="wrapper">
<header>
    <div class="container">
        <div class="header-data">
            <div class="logo">
                <a href="#" title=""><img src="static/images/logo.png" alt=""></a>
            </div>
            <div class="search-bar">

<%--                search nguoi dung only, chi den search-user.jsp--%>
                <form>
                    <input type="text" name="search" placeholder="Search...">
                    <button type="submit"><i class="la la-search"></i></button>
                </form>
            </div>
            <nav>
                <ul>
                    <li>
                        <a href="newsfeed.jsp" title="">
                            <span><img src="static/images/icon1.png" alt=""></span>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="user-profile.jsp" title="">
                            <span><img src="static/images/icon4.png" alt=""></span>
                            My Profile
                        </a>
                    </li>
                    <li>
                        <a href="#" title="">
                            <span><img src="static/images/icon2.png" alt=""></span>
                            Category
                        </a>
                        <ul>
                            <li><a href="#" title="">Category</a></li>
                            <li><a href="#" title="">Category 1</a></li>
                            <li><a href="#" title="">Category 2</a></li>
                            <li><a href="#" title="">Category 3</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="menu-btn">
                <a href="#" title=""><i class="fa fa-bars"></i></a>
            </div>
            <div class="user-account">
                <div class="user-info">
                    <img src="static/images/user.png" alt="">
                    <a style="color: white">John</a>
                    <i class="la la-sort-down"></i>
                </div>
                <div class="user-account-settingss" id="users">
                    <h3>Setting</h3>
                    <ul class="us-links">
                        <li><a href="account-setting.jsp" title="">Account Setting</a></li>
                    </ul>
<%--                    tra ve log out servlet--%>
                    <h3 class="tc"><a href="LogoutServlet"
                                      title="">Logout</a></h3>
                </div>
            </div>
        </div>
    </div>
</header>
