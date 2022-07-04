<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 7/2/2022
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<!-- saved from url=(0065)https://gambolthemes.net/workwise-new/forum.html?question=&tags=# -->--%>
<%--<html>--%>

<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

<%--    <title>WorkWise Html Template</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="keywords" content="">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/animate.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">--%>

<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">--%>
<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet"--%>
<%--          type="text/css">--%>

<%--    <link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/jquery.mCustomScrollbar.min.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/slick.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/slick-theme.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/style.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">--%>

<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>--%>
<%--</head>--%>

<%--<body>--%>
<%--<div class="wrapper">--%>
    <jsp:include page="header.jsp"></jsp:include>

<%--    search-user.jsp se duoc dung khi nguoi dung search trong file header.jsp--%>

    <section class="forum-page">
        <div class="container">
            <div class="forum-questions-sec">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="forum-questions">

                            <!-- Day la user searching mau, duoc dung trong c:forEach -->
                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/usrr-img1.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <!-- O day nen de ten nguoi dung -->
                                    <h3>John Cena</h3>

                                    <!-- O day de 1 cai gi do -->
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                </div>
                            </div>


                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/m-img2.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                    <ul class="quest-tags">
                                        <li><a href="#"
                                               title="">Work</a></li>
                                        <li><a href="#"
                                               title="">Php</a></li>
                                        <li><a href="#"
                                               title="">Design</a></li>
                                    </ul>
                                </div>
                                <span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
                            </div>
                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/m-img3.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                    <ul class="quest-tags">
                                        <li><a href="#"
                                               title="">Work</a></li>
                                        <li><a href="#"
                                               title="">Php</a></li>
                                        <li><a href="#"
                                               title="">Design</a></li>
                                    </ul>
                                </div>
                                <span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
                            </div>
                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/m-img4.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                    <ul class="quest-tags">
                                        <li><a href="#"
                                               title="">Work</a></li>
                                        <li><a href="#"
                                               title="">Php</a></li>
                                        <li><a href="#"
                                               title="">Design</a></li>
                                    </ul>
                                </div>
                                <span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
                            </div>
                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/m-img5.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                    <ul class="quest-tags">
                                        <li><a href="#"
                                               title="">Work</a></li>
                                        <li><a href="#"
                                               title="">Php</a></li>
                                        <li><a href="#"
                                               title="">Design</a></li>
                                    </ul>
                                </div>
                                <span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
                            </div>
                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/m-img6.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                    <ul class="quest-tags">
                                        <li><a href="#"
                                               title="">Work</a></li>
                                        <li><a href="#"
                                               title="">Php</a></li>
                                        <li><a href="#"
                                               title="">Design</a></li>
                                    </ul>
                                </div>
                                <span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
                            </div>
                            <div class="usr-question">
                                <div class="usr_img">
                                    <img src="static/images/m-img7.png" alt="">
                                </div>
                                <div class="usr_quest">
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                    <ul class="react-links">
                                        <li><a href="#"
                                               title=""><i class="fas fa-heart"></i> Vote 150</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-comment-alt"></i> Comments 15</a></li>
                                        <li><a href="#"
                                               title=""><i class="fas fa-eye"></i> Views 50</a></li>
                                    </ul>
                                    <ul class="quest-tags">
                                        <li><a href="#"
                                               title="">Work</a></li>
                                        <li><a href="#"
                                               title="">Php</a></li>
                                        <li><a href="#"
                                               title="">Design</a></li>
                                    </ul>
                                </div>
                                <span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
                            </div>
                        </div>
                        <nav aria-label="Page navigation example" class="full-pagi">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link pvr"
                                                         href="#">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link active"
                                                         href="#">1</a>
                                </li>
                                <li class="page-item"><a class="page-link"
                                                         href="#">2</a>
                                </li>
                                <li class="page-item"><a class="page-link"
                                                         href="#">3</a>
                                </li>
                                <li class="page-item"><a class="page-link"
                                                         href="#">4</a>
                                </li>
                                <li class="page-item"><a class="page-link"
                                                         href="#">5</a>
                                </li>
                                <li class="page-item"><a class="page-link"
                                                         href="#">6</a>
                                </li>
                                <li class="page-item"><a class="page-link pvr"
                                                         href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="footy-sec mn no-margin">
            <div class="container">
                <ul>
                    <li><a href="https://gambolthemes.net/workwise-new/help-center.html" title="">Help Center</a>
                    </li>
                    <li><a href="https://gambolthemes.net/workwise-new/about.html" title="">About</a></li>
                    <li><a href="#"
                           title="">Privacy Policy</a></li>
                    <li><a href="#"
                           title="">Community Guidelines</a></li>
                    <li><a href="#"
                           title="">Cookies Policy</a></li>
                    <li><a href="#"
                           title="">Career</a></li>
                    <li><a href="https://gambolthemes.net/workwise-new/forum.html" title="">Forum</a></li>
                    <li><a href="#"
                           title="">Language</a></li>
                    <li><a href="#"
                           title="">Copyright Policy</a></li>
                </ul>
                <p><img src="static/images/copy-icon2.png" alt="">Copyright 2019</p>
                <img class="fl-rgt" src="static/images/logo2.png" alt="">
            </div>
        </div>
    </footer>
</div>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/popper.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

</body>

</html>
