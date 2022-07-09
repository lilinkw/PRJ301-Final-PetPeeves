<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>

    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">
                        <div class="col-xl-9 col-lg-9 col-md-12">

                            <div class="main-ws-sec">
                                <div class="posts-section">
                                    <c:set var="postDTO" value="${requestScope.POSTDTO}"/>
                                    <div class="post-bar">
                                        <div class="post_topbar">
                                            <div class="usy-dt">
                                                <img style="width: 50px; height: 50px" src="${postDTO.getAuthorAvatarLink()}" alt="">
                                                <div class="usy-name">
                                                    <h3>${postDTO.getAuthorName()}</h3>
                                                    <span><img src="static/images/clock.png" alt="">${postDTO.getPostTime()}</span>
                                                </div>
                                            </div>
                                            <div class="ed-opts">
                                                <c:if test="${postDTO.getAuthorID().equals(currentUser.getUserID())||currentUser.isAdmin()}">
                                                    <a href="#" title="" class="ed-opts-open"><i
                                                            class="la la-ellipsis-v"></i></a>

                                                    <!-- not available for viewer -->

                                                    <ul class="ed-options">
                                                        <!-- for user only -->
                                                        <c:if test="${postDTO.getAuthorID().equals(currentUser.getUserID())}">
                                                            <li><a href="#" title="">Edit Post</a></li>
                                                        </c:if>
                                                        <!-- for admin and user only -->
                                                        <li><a href="#" title="">Delete post</a></li>
                                                    </ul>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="epi-sec">
                                            <ul class="descp">
                                                <!-- <li><img src="static/images/icon9.png" alt=""><span>India</span></li> -->
                                            </ul>
                                        </div>
                                        <div class="job_descp accountnone">
                                            <!-- Can be deleted or change to another -->
                                            <h3 style="margin-top: 10px">${postDTO.getPostTitle()}</h3>

                                            <ul class="job-dt">
                                                <li><a href="search-category.jsp" title="">${postDTO.getCategory()}</a></li>
                                            </ul>
                                            <p>${postDTO.getPostContent()}</p>
                                            <img style="display: block; width: 100%" src="${postDTO.getImageLinks().get(0)}" alt="">
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
                                        <div  class="comment-area">
                                            <c:if test="${not empty postDTO.getCommentList()}">
                                            <c:forEach var="commentDTO" items="${postDTO.getCommentList()}">
                                                <div class="post_topbar">
                                                    <div class="usy-dt">
                                                        <img style="height: 30px; width: 30px" src="${commentDTO.getCommenterAvatarLink()}" alt="">
                                                        <div class="usy-name">
                                                            <h3>${commentDTO.getCommenterName()}</h3>
                                                            <span><img src="static/images/clock.png" alt="">${commentDTO.getCommentTime()}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="reply-area">
                                                    <p>${commentDTO.getCommentContent()}</p>
                                                </div>
                                            </c:forEach>
                                            </c:if>
                                        </div>
                                        <div class="post-topbar">
                                            <div  class="postcomment">
                                                <c:set var="currentUser" value="${sessionScope.CURRENTUSER}"/>
                                                <div class="row">
                                                    <div class="col-md-2 usy-dt">
                                                        <img style="width: 50%" src="${currentUser.getAvatarLink()}" alt="">
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

<%--    <div class="post-popup pst-pj">--%>
<%--        <div class="post-project">--%>
<%--            <h3>Post a project</h3>--%>
<%--            <div class="post-project-fields">--%>
<%--                <form>--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <input type="text" name="title" placeholder="Title">--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="inp-field">--%>
<%--                                <select>--%>
<%--                                    <option>Category</option>--%>
<%--                                    <option>Category 1</option>--%>
<%--                                    <option>Category 2</option>--%>
<%--                                    <option>Category 3</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <input type="text" name="skills" placeholder="Skills">--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="price-sec">--%>
<%--                                <div class="price-br">--%>
<%--                                    <input type="text" name="price1" placeholder="Price">--%>
<%--                                    <i class="la la-dollar"></i>--%>
<%--                                </div>--%>
<%--                                <span>To</span>--%>
<%--                                <div class="price-br">--%>
<%--                                    <input type="text" name="price1" placeholder="Price">--%>
<%--                                    <i class="la la-dollar"></i>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <textarea name="description" placeholder="Description"></textarea>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <ul>--%>
<%--                                <li><button class="active" type="submit" value="post">Post</button></li>--%>
<%--                                <li><a href="#" title="">Cancel</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>

<%--            <a href="#" title=""><i class="la la-times-circle-o"></i></a>--%>
<%--        </div>--%>

<%--    </div>--%>

<%--    <div class="post-popup job_post">--%>
<%--        <div class="post-project">--%>
<%--            <h3>Post a job</h3>--%>
<%--            <div class="post-project-fields">--%>
<%--                <form>--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <input type="text" name="title" placeholder="Title">--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="inp-field">--%>
<%--                                <select>--%>
<%--                                    <option>Category</option>--%>
<%--                                    <option>Category 1</option>--%>
<%--                                    <option>Category 2</option>--%>
<%--                                    <option>Category 3</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <input type="text" name="skills" placeholder="Skills">--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="price-br">--%>
<%--                                <input type="text" name="price1" placeholder="Price">--%>
<%--                                <i class="la la-dollar"></i>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="inp-field">--%>
<%--                                <select>--%>
<%--                                    <option>Full Time</option>--%>
<%--                                    <option>Half time</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <textarea name="description" placeholder="Description"></textarea>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <ul>--%>
<%--                                <li><button class="active" type="submit" value="post">Post</button></li>--%>
<%--                                <li><a href="#" title="">Cancel</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>

<%--            <a href="#" title=""><i class="la la-times-circle-o"></i></a>--%>
<%--        </div>--%>

<%--    </div>--%>

<%--</div>--%>
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

<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/popper.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.range-min.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

</body>

</html>
