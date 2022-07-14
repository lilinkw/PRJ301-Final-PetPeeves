<%--
  Created by IntelliJ IDEA.
  User: lil_ink
  Date: 14/07/2022
  Time: 09:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- saved from url=(0048) -->
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>${requestScope.TITLE}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet"
              type="text/css">


        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js">

        <link rel="stylesheet" type="text/css" href="../static/css/slick.css">
        <link rel="stylesheet" type="text/css" href="../static/css/slick-theme.css">

        <link rel="stylesheet" type="text/css" href="../static/css/style.css">
        <link rel="stylesheet" type="text/css" href="../static/css/responsive.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>
    </head>

    <body>
        <div class="wrapper">
            <header>
                <div class="container">
                    <div class="header-data">
                        <div class="logo">
                            <a href="/PetPeeves_war_exploded/ViewNewsFeedServlet" title=""><img src="../static/images/logo.png" alt=""></a>
                        </div>
                        <div class="search-bar">

                            <%--                search nguoi dung only--%>
                            <form action="/PetPeeves_war_exploded/SearchUserServlet" method="post">
                                <input type="text" name="search-user" placeholder="Search user...">
                                <button type="submit"><i class="la la-search"></i></button>
                            </form>
                        </div>
                        <nav>
                            <ul>
                                <li>
                                    <a href="/PetPeeves_war_exploded/ViewNewsFeedServlet" title="">
                                        <span><img src="../static/images/icon1.png" alt=""></span>
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="/PetPeeves_war_exploded/GetUserProfileServlet?userID=${sessionScope.CURRENTUSER.getUserID()}" title="">
                                        <span><img src="../static/images/icon4.png" alt=""></span>
                                        My Profile
                                    </a>
                                </li>
                                <li>
                                    <a href="" title="">
                                        <span><img src="../static/images/icon2.png" alt=""></span>
                                        Category
                                    </a>
                                    <c:set var="categoryList" value="${sessionScope.CATEGORYLIST}"/>
                                    <ul>
                                        <c:forEach var="categoryDTO" items="${categoryList}" varStatus="loop">
                                            <li><a onclick="${loop.index}" href="/PetPeeves_war_exploded/SearchCategoryServlet?categoryID=${categoryDTO.getCategoryID()}">${categoryDTO.getCategory()}</a></li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <div class="menu-btn">
                            <a href="#" title=""><i class="fa fa-bars"></i></a>
                        </div>
                        <div class="user-account">
                            <div class="user-info">
                                <c:set var="curentUser" value="${sessionScope.CURRENTUSER}"/>
                                <img style="height: 30px; width: 30px" src="${curentUser.getAvatarLink()}" alt="">
                                <a style="color: white">${curentUser.getUsername()}</a>
                                <i class="la la-sort-down"></i>
                            </div>
                            <div class="user-account-settingss" id="users">
                                <h3>Setting</h3>
                                <ul class="us-links">
                                    <li><a href="/PetPeeves_war_exploded/UpdateUserInfoServlet" title="">Account Setting</a></li>
                                    <li><a href="GetAccountManagementServlet" title="">Administration</a></li>
                                </ul>
                                <%--                    tra ve log out servlet--%>
                                <h3 class="tc"><a href="/PetPeeves_war_exploded/LogoutServlet"
                                                  title="">Logout</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
