<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/19/2022
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="#" title="">John</a>
                    <i class="la la-sort-down"></i>
                </div>
                <div class="user-account-settingss" id="users">
                    <h3>Setting</h3>
                    <ul class="us-links">
                        <li><a href="#" title="">Account Setting</a></li>
                    </ul>
                    <h3 class="tc"><a href="https://gambolthemes.net/workwise-new/sign-in.html"
                                      title="">Logout</a></h3>
                </div>
            </div>
        </div>
    </div>
</header>
