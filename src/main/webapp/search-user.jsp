<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 7/2/2022
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
    <jsp:include page="header.jsp"></jsp:include>

<%--    search-user.jsp se duoc dung khi nguoi dung search trong file header.jsp--%>

    <section class="forum-page">
        <div class="container">
            <div class="forum-questions-sec">
                <div class="row">

                    <div class="col-lg-3">
                        <div class="filter-secs">
                            <div class="filter-heading">
                                <h3>Filters</h3>
                            </div>
                            <div class="paddy">
                                <div class="filter-dd">
                                    <div class="filter-ttl">
                                        <h3>User</h3>
                                    </div>
                                    <form>
                                        <input type="text" name="search-user" placeholder="Search user">
                                        <button type="reset" style="float: right; font-size: 14px;
                                            color: #666666; border: none; background-color: white; margin-top: 0.5rem;">Clear</button>
                                    </form>
                                </div>

                                <div class="filter-dd">
                                    <div class="filter-ttl">
                                        <h3>Title</h3>
                                    </div>
                                    <form>
                                        <input type="text" name="search-title" placeholder="Search title">
                                        <button type="reset" style="float: right; font-size: 14px;
                                            color: #666666; border: none; background-color: white; margin-top: 0.5rem;">Clear</button>
                                    </form>
                                </div>

                                <div class="filter-dd">
                                    <div class="filter-ttl">
                                        <h3>Category</h3>
                                    </div>
                                    <form class="job-tp">
                                        <select name="category">
                                            <option>Category 1</option>
                                            <option>Category 2</option>
                                            <option>Category 3</option>
                                            <option>Category 4</option>
                                        </select>
                                        <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                                        <button type="submit" style="background-color: #e44d3a; color: white; margin-top: 1rem;
                                            border: none; padding: 0.2rem;">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

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
