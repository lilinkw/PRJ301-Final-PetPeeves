<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/20/2022
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
    <jsp:include page="header.jsp"></jsp:include>

    <section class="cover-sec">
        <img src="static/images/cover-img.jpg" alt="">
        <div class="add-pic-box">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-lg-12 col-sm-12">
                        <input type="file" id="file">
                        <label for="file">Change Image</label>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="main-left-sidebar">
                                <div class="user_profile">
                                    <div class="user-pro-img">
                                        <img src="static/images/user-pro-img.png" alt="">
                                        <div class="add-dp" id="OpenImgUpload">
                                            <input type="file" id="file">
                                            <label for="file"><i class="fas fa-camera"></i></label>
                                        </div>
                                    </div>
                                    <div class="user_pro_status">
                                        <ul class="flw-hr">
                                            <li><a href="#" title="" class="flww"><i class="la la-plus"></i>
                                                Follow</a></li>
                                            <li><a href="#" title="" class="hre">Hire</a></li>
                                        </ul>
                                        <ul class="flw-status">
                                            <li>
                                                <span>Following</span>
                                                <b>34</b>
                                            </li>
                                            <li>
                                                <span>Followers</span>
                                                <b>155</b>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- thong tin ca nhan -->
                                    <ul class="social_links">
                                        <li><a title=""><i class="la la-globe"></i> www.example.com</a>
                                        </li>
                                        <li><a title=""><i class="fa fa-facebook-square"></i>
                                            Http://www.facebook.com/john...</a></li>
                                        <li><a title=""><i class="fa fa-twitter"></i>
                                            Http://www.Twitter.com/john...</a></li>
                                        <li><a title=""><i class="fa fa-google-plus-square"></i>
                                            Http://www.googleplus.com/john...</a></li>
                                        <li><a title=""><i class="fa fa-behance-square"></i>
                                            Http://www.behance.com/john...</a></li>
                                        <li><a title=""><i class="fa fa-pinterest"></i>
                                            Http://www.pinterest.com/john...</a></li>
                                        <li><a title=""><i class="fa fa-instagram"></i>
                                            Http://www.instagram.com/john...</a></li>
                                        <li><a title=""><i class="fa fa-youtube"></i>
                                            Http://www.youtube.com/john...</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="main-ws-sec">
                                <div class="user-tab-sec">
                                    <h3>John Doe</h3>
                                    <div class="star-descp">
                                        <span>Graphic Designer at Self Employed</span>
                                    </div>
                                    <div class="tab-feed">
                                        <ul>
                                            <li data-tab="feed-dd" class="active animated fadeIn">

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-feed-tab current animated fadeIn" id="feed-dd">
                                    <div class="posts-section">

                                        <!-- day la bai post template, duoc dung trong c:forEach -->
                                        <div class="posty">
                                            <div class="post-bar no-margin">
                                                <div class="post_topbar">
                                                    <div class="usy-dt">
                                                        <img src="static/images/us-pic.png" alt="">
                                                        <div class="usy-name">
                                                            <h3>John Doe</h3>
                                                            <span><img src="static/images/clock.png" alt="">
                                                                    <a href="post.jsp" style="color: #b2b2b2">3 min
                                                                        ago</a> </span>
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
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                        Aliquam
                                                        luctus hendrerit metus, ut ullamcorper quam finibus at.
                                                        Etiam id
                                                        magna sit amet... <a href="#" title="">view more</a></p>
                                                </div>
                                                <div class="job-status-bar">
                                                    <ul class="like-com">
                                                        <li>
                                                            <a href="#"><i class="fas fa-heart"></i> Like</a>
                                                            <span>25</span>
                                                        </li>
                                                        <li><a href="#" class="com"><i
                                                                class="fas fa-comment-alt"></i>
                                                            Comment 15</a></li>
                                                    </ul>
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
                                                                    <img src="static/images/bg-img1.png" alt="">
                                                                </div>
                                                                <div class="comment">
                                                                    <h3>John Doe</h3>
                                                                    <span><img src="static/images/clock.png" alt="">
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
                                                                            <img src="static/images/bg-img2.png" alt="">
                                                                        </div>
                                                                        <div class="comment">
                                                                            <h3>John Doe</h3>
                                                                            <span><img src="static/images/clock.png"
                                                                                       alt="">
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
                                                                    <img src="static/images/bg-img3.png" alt="">
                                                                </div>
                                                                <div class="comment">
                                                                    <h3>John Doe</h3>
                                                                    <span><img src="static/images/clock.png" alt="">
                                                                            3 min ago</span>
                                                                    <p>Lorem ipsum dolor sit amet, consectetur
                                                                        adipiscing elit. Aliquam luctus hendrerit
                                                                        metus,
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
                                                        <img src="static/images/bg-img4.png" alt="">
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

                                        <div class="post-bar">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <img src="static/images/us-pic.png" alt="">
                                                    <div class="usy-name">
                                                        <h3>John Doe</h3>
                                                        <span><img src="static/images/clock.png" alt="">3 min
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
                                                    <li><img src="static/images/icon8.png" alt=""><span>Front
                                                                End Developer</span></li>
                                                    <li><img src="static/images/icon9.png" alt=""><span>India</span></li>
                                                </ul>
                                                <ul class="bk-links">
                                                    <li><a href="#" title=""><i class="la la-bookmark"></i></a></li>
                                                    <li><a href="#" title=""><i class="la la-envelope"></i></a></li>
                                                    <li><a href="#" title="" class="bid_now">Bid Now</a></li>
                                                </ul>
                                            </div>
                                            <div class="job_descp">
                                                <h3>Simple Classified Site</h3>
                                                <ul class="job-dt">
                                                    <li><span>$300 - $350</span></li>
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
                                                        <img src="static/images/liked-img.png" alt="">
                                                        <span>25</span>
                                                    </li>
                                                    <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                        Comments
                                                        15</a></li>
                                                </ul>
                                                <a href="#"><i class="fas fa-eye"></i>Views 50</a>
                                            </div>
                                        </div>
                                        <div class="post-bar">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <img src="static/images/us-pc2.png" alt="">
                                                    <div class="usy-name">
                                                        <h3>John Doe</h3>
                                                        <span><img src="static/images/clock.png" alt="">3 min
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
                                                    <li><img src="static/images/icon8.png" alt=""><span>Epic
                                                                Coder</span></li>
                                                    <li><img src="static/images/icon9.png" alt=""><span>India</span></li>
                                                </ul>
                                                <ul class="bk-links">
                                                    <li><a href="#" title=""><i class="la la-bookmark"></i></a></li>
                                                    <li><a href="#" title=""><i class="la la-envelope"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="job_descp">
                                                <h3>Senior UI / UX designer</h3>
                                                <ul class="job-dt">
                                                    <li><a href="#" title="">Par Time</a></li>
                                                    <li><span>$10 / hr</span></li>
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
                                                        <img src="static/images/liked-img.png" alt="">
                                                        <span>25</span>
                                                    </li>
                                                    <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                        Comments
                                                        15</a></li>
                                                </ul>
                                                <a href="#"><i class="fas fa-eye"></i>Views 50</a>
                                            </div>
                                        </div>
                                        <div class="post-bar">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <img src="static/images/us-pic.png" alt="">
                                                    <div class="usy-name">
                                                        <h3>John Doe</h3>
                                                        <span><img src="static/images/clock.png" alt="">3 min
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
                                                    <li><img src="static/images/icon8.png" alt=""><span>Epic
                                                                Coder</span></li>
                                                    <li><img src="static/images/icon9.png" alt=""><span>India</span></li>
                                                </ul>
                                                <ul class="bk-links">
                                                    <li><a href="#" title=""><i class="la la-bookmark"></i></a></li>
                                                    <li><a href="#" title=""><i class="la la-envelope"></i></a></li>
                                                    <li><a href="#" title="" class="bid_now">Bid Now</a></li>
                                                </ul>
                                            </div>
                                            <div class="job_descp">
                                                <h3>Ios Shopping mobile app</h3>
                                                <ul class="job-dt">
                                                    <li><span>$300 - $350</span></li>
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
                                                        <img src="static/images/liked-img.png" alt="">
                                                        <span>25</span>
                                                    </li>
                                                    <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
                                                        Comments
                                                        15</a></li>
                                                </ul>
                                                <a href="#"><i class="fas fa-eye"></i>Views 50</a>
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
        </div>
    </main>
    <footer>
        <div class="footy-sec mn no-margin">
            <div class="container">
                <ul>
                    <li><a href="https://gambolthemes.net/workwise-new/help-center.html" title="">Help Center</a>
                    </li>
                    <li><a href="https://gambolthemes.net/workwise-new/about.html" title="">About</a></li>
                    <li><a href="#" title="">Privacy
                        Policy</a></li>
                    <li><a href="#" title="">Community
                        Guidelines</a></li>
                    <li><a href="#" title="">Cookies
                        Policy</a></li>
                    <li><a href="#" title="">Career</a></li>
                    <li><a href="https://gambolthemes.net/workwise-new/forum.html" title="">Forum</a></li>
                    <li><a href="#" title="">Language</a>
                    </li>
                    <li><a href="#" title="">Copyright
                        Policy</a></li>
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
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

</body>

</html>
