<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/18/2022
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0048) -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Home</title>
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

    <link rel="stylesheet" type="text/css" href="./css/slick.css">
    <link rel="stylesheet" type="text/css" href="./css/slick-theme.css">

    <link rel="stylesheet" type="text/css" href="./css/newsfeed-style.css">
    <link rel="stylesheet" type="text/css" href="./css/newsfeed-responsive.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>
</head>

<body>
<div class="wrapper">
    <header>
        <div class="container">
            <div class="header-data">
                <div class="logo">
                    <a href="#" title=""><img src="./images/logo.png" alt=""></a>
                </div>
                <div class="search-bar">
                    <form>
                        <input type="text" name="search" placeholder="Search...">
                        <button type="submit"><i class="la la-search"></i></button>
                    </form>
                </div>
                <nav>
                    <ul>
                        <li>
                            <a href="#" title="">
                                <span><img src="./images/icon1.png" alt=""></span>
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#" title="">
                                <span><img src="./images/icon4.png" alt=""></span>
                                My Profile
                            </a>
                        </li>
                        <li>
                            <a href="#" title="">
                                <span><img src="./images/icon2.png" alt=""></span>
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
                        <img src="./images/user.png" alt="">
                        <a href="#" title="">John</a>
                        <i class="la la-sort-down"></i>
                    </div>
                    <div class="user-account-settingss" id="users">
                        <h3>Setting</h3>
                        <ul class="us-links">
                            <li><a href="#" title="">Account Setting</a></li>
                        </ul>
                        <h3 class="tc"><a href="welcome.jsp"
                                          title="">Logout</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 pd-left-none no-pd">
                            <div class="main-left-sidebar no-margin">
                                <div class="user-data full-width">
                                    <div class="user-profile">
                                        <div class="username-dt">
                                            <div class="usr-pic">
                                                <img src="./images/user-pic.png" alt="">
                                            </div>
                                        </div>
                                        <div class="user-specs">
                                            <h3>John Doe</h3>
                                            <span>Graphic Designer at Self Employed</span>
                                        </div>
                                    </div>
                                    <ul class="user-fw-status">
                                        <li>
                                            <h4>Following</h4>
                                            <span>34</span>
                                        </li>
                                        <li>
                                            <h4>Followers</h4>
                                            <span>155</span>
                                        </li>
                                        <li>
                                            <a href="https://gambolthemes.net/workwise-new/my-profile-feed.html"
                                               title="">View Profile</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tags-sec full-width">
                                    <div class="cp-sec">
                                        <img src="./images/logo2.png" alt="">
                                        <p><img src="./images/cp.png" alt="">Copyright 2019</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-8 no-pd">
                            <div class="main-ws-sec">
                                <div class="post-topbar">
                                    <div class="user-picy">
                                        <img src="./images/user-pic.png" alt="">
                                    </div>
                                    <div class="post-st">
                                        <ul>
                                            <li><a class="post_project" href="#" title="">Post</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="posts-section">

                                    <!-- day la bai post template, duoc dung trong c:forEach -->
                                    <div class="post-bar">
                                        <div class="post_topbar">
                                            <div class="usy-dt">
                                                <img src="./images/us-pic.png" alt="">
                                                <div class="usy-name">
                                                    <h3>John Doe</h3>
                                                    <span><img src="./images/clock.png" alt="">3 min
                                                            ago</span>
                                                </div>
                                            </div>
                                            <div class="ed-opts">
                                                <a href="#" title="" class="ed-opts-open"><i
                                                        class="la la-ellipsis-v"></i></a>

                                                <!-- not available for viewer -->
                                                <ul class="ed-options">
                                                    <!-- for user only -->
                                                    <li><a href="#" title="">Edit Post</a></li>
                                                    <!-- for admin and user only -->
                                                    <li><a href="#" title="">Delete post</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="epi-sec">
                                            <ul class="bk-links">
                                                <!-- this will be the icon of the category(trang tri cho dep, khong bam vao duoc) -->
                                                <li><a title=""><i class="la la-bookmark"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="job_descp">
                                            <!-- Can be deleted or change to another -->
                                            <h3>Senior Wordpress Developer</h3>

                                            <ul class="job-dt">
                                                <li><a href="#" title="">Category 1</a></li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                                                luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                                                magna sit amet... <a href="#" title="">view more</a></p>
                                        </div>
                                        <div class="job-status-bar">
                                            <ul class="like-com">
                                                <li>
                                                    <a href="#"><i class="fas fa-heart"></i> Like</a>
                                                    <span>25</span>
                                                </li>
                                                <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                    Comment
                                                    15</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="post-bar">
                                        <div class="post_topbar">
                                            <div class="usy-dt">
                                                <img src="./images/us-pic.png" alt="">
                                                <div class="usy-name">
                                                    <h3>John Doe</h3>
                                                    <span><img src="./images/clock.png" alt="">3 min
                                                            ago</span>
                                                </div>
                                            </div>
                                            <div class="ed-opts">
                                                <a href="#" title="" class="ed-opts-open"><i
                                                        class="la la-ellipsis-v"></i></a>
                                                <ul class="ed-options">
                                                    <li><a href="#" title="">Edit Post</a></li>
                                                    <li><a href="#" title="">Unsaved</a></li>
                                                    <li><a href="#" title="">Unbid</a></li>
                                                    <li><a href="#" title="">Close</a></li>
                                                    <li><a href="#" title="">Hide</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="epi-sec">
                                            <ul class="descp">
                                                <li><img src="./images/icon8.png" alt=""><span>Epic
                                                            Coder</span></li>
                                                <li><img src="./images/icon9.png" alt=""><span>India</span>
                                                </li>
                                            </ul>
                                            <ul class="bk-links">
                                                <li><a href="#" title=""><i class="la la-bookmark"></i></a></li>
                                                <li><a href="#" title=""><i class="la la-envelope"></i></a></li>
                                                <li><a href="#" title="" class="bid_now">Bid Now</a></li>
                                            </ul>
                                        </div>
                                        <div class="job_descp">
                                            <h3>Senior Wordpress Developer</h3>
                                            <ul class="job-dt">
                                                <li><a href="#" title="">Full Time</a></li>
                                                <li><span>$30 / hr</span></li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                                                luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                                                magna sit amet... <a href="#" title="">view more</a></p>
                                            <ul class="skill-tags">
                                                <li><a href="#" title="">HTML</a></li>
                                                <li><a href="#" title="">PHP</a></li>
                                                <li><a href="#" title="">CSS</a></li>
                                                <li><a href="#" title="">Javascript</a></li>
                                                <li><a href="#" title="">Wordpress</a></li>
                                            </ul>
                                        </div>
                                        <div class="job-status-bar">
                                            <ul class="like-com">
                                                <li>
                                                    <a href="#"><i class="fas fa-heart"></i> Like</a>
                                                    <img src="./images/liked-img.png" alt="">
                                                    <span>25</span>
                                                </li>
                                                <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                    Comment
                                                    15</a></li>
                                            </ul>
                                            <a href="#"><i class="fas fa-eye"></i>Views 50</a>
                                        </div>
                                    </div>
                                    <div class="posty">
                                        <div class="post-bar no-margin">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <img src="./images/us-pc2.png" alt="">
                                                    <div class="usy-name">
                                                        <h3>John Doe</h3>
                                                        <span><img src="./images/clock.png" alt="">3 min
                                                                ago</span>
                                                    </div>
                                                </div>
                                                <div class="ed-opts">
                                                    <a href="#" title="" class="ed-opts-open"><i
                                                            class="la la-ellipsis-v"></i></a>
                                                    <ul class="ed-options">
                                                        <li><a href="#" title="">Edit Post</a></li>
                                                        <li><a href="#" title="">Unsaved</a></li>
                                                        <li><a href="#" title="">Unbid</a></li>
                                                        <li><a href="#" title="">Close</a></li>
                                                        <li><a href="#" title="">Hide</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="epi-sec">
                                                <ul class="descp">
                                                    <li><img src="./images/icon8.png" alt=""><span>Epic
                                                                Coder</span></li>
                                                    <li><img src="./images/icon9.png" alt=""><span>India</span></li>
                                                </ul>
                                                <ul class="bk-links">
                                                    <li><a href="#" title=""><i class="la la-bookmark"></i></a></li>
                                                    <li><a href="#" title=""><i class="la la-envelope"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="job_descp">
                                                <h3>Senior Wordpress Developer</h3>
                                                <ul class="job-dt">
                                                    <li><a href="#" title="">Full Time</a></li>
                                                    <li><span>$30 / hr</span></li>
                                                </ul>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                                                    luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                                                    magna sit amet... <a href="#" title="">view more</a></p>
                                                <ul class="skill-tags">
                                                    <li><a href="#" title="">HTML</a></li>
                                                    <li><a href="#" title="">PHP</a></li>
                                                    <li><a href="#" title="">CSS</a></li>
                                                    <li><a href="#" title="">Javascript</a></li>
                                                    <li><a href="#" title="">Wordpress</a></li>
                                                </ul>
                                            </div>
                                            <div class="job-status-bar">
                                                <ul class="like-com">
                                                    <li>
                                                        <a href="#"><i class="fas fa-heart"></i> Like</a>
                                                        <img src="./images/liked-img.png" alt="">
                                                        <span>25</span>
                                                    </li>
                                                    <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                        Comment
                                                        15</a></li>
                                                </ul>
                                                <a href="#"><i class="fas fa-eye"></i>Views 50</a>
                                            </div>
                                        </div>
                                        <div class="comment-section">
                                            <a href="#" class="plus-ic">
                                                <i class="la la-plus"></i>
                                            </a>
                                            <div class="comment-sec">
                                                <ul>
                                                    <li>
                                                        <div class="comment-list">
                                                            <div class="bg-img">
                                                                <img src="./images/bg-img1.png" alt="">
                                                            </div>
                                                            <div class="comment">
                                                                <h3>John Doe</h3>
                                                                <span><img src="./images/clock.png" alt="">
                                                                        3 min ago</span>
                                                                <p>Lorem ipsum dolor sit amet, </p>
                                                                <a href="#" title="" class="active"><i
                                                                        class="fa fa-reply-all"></i>Reply</a>
                                                            </div>
                                                        </div>
                                                        <ul>
                                                            <li>
                                                                <div class="comment-list">
                                                                    <div class="bg-img">
                                                                        <img src="./images/bg-img2.png" alt="">
                                                                    </div>
                                                                    <div class="comment">
                                                                        <h3>John Doe</h3>
                                                                        <span><img src="./images/clock.png" alt="">
                                                                                3 min ago</span>
                                                                        <p>Hi John </p>
                                                                        <a href="#" title=""><i
                                                                                class="fa fa-reply-all"></i>Reply</a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <div class="comment-list">
                                                            <div class="bg-img">
                                                                <img src="./images/bg-img3.png" alt="">
                                                            </div>
                                                            <div class="comment">
                                                                <h3>John Doe</h3>
                                                                <span><img src="./images/clock.png" alt="">
                                                                        3 min ago</span>
                                                                <p>Lorem ipsum dolor sit amet, consectetur
                                                                    adipiscing elit. Aliquam luctus hendrerit metus,
                                                                    ut ullamcorper quam finibus at.</p>
                                                                <a href="#" title=""><i
                                                                        class="fa fa-reply-all"></i>Reply</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="post-comment">
                                                <div class="cm_img">
                                                    <img src="./images/bg-img4.png" alt="">
                                                </div>
                                                <div class="comment_box">
                                                    <form>
                                                        <input type="text" placeholder="Post a comment">
                                                        <button type="submit">Send</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="process-comm">
                                        <div class="spinner">
                                            <div class="bounce1"></div>
                                            <div class="bounce2"></div>
                                            <div class="bounce3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <div class="post-popup pst-pj">
        <div class="post-project">
            <h3>Create post</h3>
            <div class="post-project-fields">
                <form>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="inp-field">
                                <select>
                                    <option>Category</option>
                                    <option>Category 1</option>
                                    <option>Category 2</option>
                                    <option>Category 3</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <textarea name="description" placeholder="What's on your mind?"></textarea>
                        </div>
                        <div class="col-lg-12">
                            <ul>
                                <li>
                                    <button class="active" type="submit" value="post">Post</button>
                                </li>
                                <li>
                                    <button type="button" value="post">Add images</button>
                                </li>
                                <li><a href="#" title="">Cancel</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
            <a href="#" title=""><i class="la la-times-circle-o"></i></a>
        </div>
    </div>
</div>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/popper.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<script type="text/javascript" src="./js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="./js/slick.min.js"></script>
<script type="text/javascript" src="./js/newsfeed-scrollbar.js"></script>
<script type="text/javascript" src="./js/newsfeed-script.js"></script>

</body>

</html>
