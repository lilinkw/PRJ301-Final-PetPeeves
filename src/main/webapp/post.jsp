<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/19/2022
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0052) -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>WorkWise Html Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" type="text/css" href="static/css/animate.css">
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/jquery.range.css">

    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet"
          type="text/css">

    <link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/slick.css">
    <link rel="stylesheet" type="text/css" href="static/css/slick-theme.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">
</head>

<body>
<div class="modal" id="mymodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="text-light text-center">Post</h3>
            </div>
            <div class="modal-body">
                <div class="innerbody apply-jobbox">
                    <h3>What is on your mind?</h3>
                    <form>
                            <textarea name="description" placeholder="What's on your mind?" style="width: 100%; padding:15px; height: 130px;     width: 100%;
                            color: #b2b2b2;
                            font-size: 14px;
                            border: 1px solid #e5e5e5;
                            font-weight: 500;"></textarea>
                    </form>
                    <div class="select-files">
                        <input type="file" class="custom-file-input">
                        <p>Upload your cv / resume file. Max file size : 3MB</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="place-bid-btn">Post</button>
                <button>Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="wrapper">
    <jsp:include page="header.jsp"></jsp:include>

    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">
                        <div class="col-xl-9 col-lg-9 col-md-12">

                            <div class="main-ws-sec">
                                <div class="posts-section">
                                    <div class="post-bar">
                                        <div class="post_topbar">
                                            <div class="usy-dt">
                                                <img src="static/images/bg-img2.png" alt="">
                                                <div class="usy-name">
                                                    <h3>John Doe</h3>
                                                    <span><img src="static/images/clock.png" alt="">3 min ago</span>
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
                                            <ul class="descp">
                                                <!-- <li><img src="static/images/icon9.png" alt=""><span>India</span></li> -->
                                            </ul>
                                        </div>
                                        <div class="job_descp accountnone">
                                            <!-- Can be deleted or change to another -->
                                            <h3>Senior Wordpress Developer</h3>
                                            <ul class="job-dt">
                                                <li>
                                                    <a href="search-post.jsp">Category 1</a>
                                                </li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porttitor
                                                ligula et dolor dignissim, sit amet efficitur felis maximus.
                                                Suspendisse metus magna, tempus eu ultrices et, maximus id tellus.
                                                Ut eu lacinia ante, id facilisis enim. s. ut suscipit urna
                                                sollicitudin at...<a href="#" title="">view more</a></p>
                                        </div>
                                        <div class="job-status-bar btm-line">
                                            <ul class="like-com">
                                                <li>
                                                    <a href="#" class="active"><i class="fas fa-heart"></i> Like</a>
                                                    <!-- chi khac nhau trong web tinh, vi file style.css da duoc dong bo khi push len du an  -->
                                                    <span>25</span>
                                                </li>
                                                <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                    Comments
                                                    15</a></li>
                                            </ul>
                                        </div>
                                        <div class="comment-area">
                                            <i class="la la-plus-circle"></i>
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <img src="static/images/bg-img1.png" alt="">
                                                    <div class="usy-name">
                                                        <h3>John Doe</h3>
                                                        <span><img src="static/images/clock.png" alt="">3 min
                                                                ago</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="reply-area">
                                                <p>Lorem ipsum dolor sit amet,</p>
                                                <span><i class="la la-mail-reply"></i>Reply</span>
                                                <div class="comment-area reply-rply1">
                                                    <div class="post_topbar">
                                                        <div class="usy-dt">
                                                            <img src="static/images/bg-img2.png" alt="">
                                                            <div class="usy-name">
                                                                <h3>John Doe</h3>
                                                                <span><img src="static/images/clock.png" alt="">3 min
                                                                        ago</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="reply-area">
                                                        <p>Lorem ipsum dolor sit amet,</p>
                                                        <p>Hi John</p>
                                                        <span><i class="la la-mail-reply"></i>Reply</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-area">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <img src="static/images/bg-img3.png" alt="">
                                                    <div class="usy-name">
                                                        <h3>John Doe</h3>
                                                        <span><img src="static/images/clock.png" alt="">3 min
                                                                ago</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="reply-area">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                                                    luctus hendrerit metus, ut ullamcorper quam finibus at.</p>
                                                <span><i class="la la-mail-reply"></i>Reply</span>
                                            </div>
                                        </div>
                                        <div class="postcomment">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <img src="static/images/bg-img4.png" alt="">
                                                </div>
                                                <div class="col-md-8">
                                                    <form>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control"
                                                                   id="inputPassword" placeholder="Post a comment">
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="col-md-2">
                                                    <a href="#">Send</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-12">
                            <div class="right-sidebar">
                                <div class="widget widget-about bid-place">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#mymodal" data-whatever="@mdo">Create Post</button>
                                </div>

                                <div class="widget widget-projectid">
                                    <h3>Project ID : 123456789</h3>
                                    <p>Report Job</p>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
    <footer>
        <div class="footy-sec mn no-margin">
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
                    <li><a href="#" title="">Copyright
                        Policy</a></li>
                </ul>
                <p><img src="static/images/copy-icon2.png" alt="">Copyright 2019</p>
                <img class="fl-rgt" src="static/images/logo2.png" alt="">
            </div>
        </div>
    </footer>

    <div class="post-popup pst-pj">
        <div class="post-project">
            <h3>Post a project</h3>
            <div class="post-project-fields">
                <form>
                    <div class="row">
                        <div class="col-lg-12">
                            <input type="text" name="title" placeholder="Title">
                        </div>
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
                            <input type="text" name="skills" placeholder="Skills">
                        </div>
                        <div class="col-lg-12">
                            <div class="price-sec">
                                <div class="price-br">
                                    <input type="text" name="price1" placeholder="Price">
                                    <i class="la la-dollar"></i>
                                </div>
                                <span>To</span>
                                <div class="price-br">
                                    <input type="text" name="price1" placeholder="Price">
                                    <i class="la la-dollar"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <textarea name="description" placeholder="Description"></textarea>
                        </div>
                        <div class="col-lg-12">
                            <ul>
                                <li><button class="active" type="submit" value="post">Post</button></li>
                                <li><a href="#" title="">Cancel</a></li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>

            <a href="#" title=""><i class="la la-times-circle-o"></i></a>
        </div>

    </div>

    <div class="post-popup job_post">
        <div class="post-project">
            <h3>Post a job</h3>
            <div class="post-project-fields">
                <form>
                    <div class="row">
                        <div class="col-lg-12">
                            <input type="text" name="title" placeholder="Title">
                        </div>
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
                            <input type="text" name="skills" placeholder="Skills">
                        </div>
                        <div class="col-lg-6">
                            <div class="price-br">
                                <input type="text" name="price1" placeholder="Price">
                                <i class="la la-dollar"></i>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="inp-field">
                                <select>
                                    <option>Full Time</option>
                                    <option>Half time</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <textarea name="description" placeholder="Description"></textarea>
                        </div>
                        <div class="col-lg-12">
                            <ul>
                                <li><button class="active" type="submit" value="post">Post</button></li>
                                <li><a href="#" title="">Cancel</a></li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>

            <a href="#" title=""><i class="la la-times-circle-o"></i></a>
        </div>

    </div>

</div>

<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/popper.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.range-min.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

</body>

</html>
