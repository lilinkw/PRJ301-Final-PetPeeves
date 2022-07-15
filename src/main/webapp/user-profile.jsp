
<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/20/2022
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="header.jsp"></jsp:include>
    <%-- copy lon Tung --%>
    <c:set var="currentUser" value="${sessionScope.CURRENTUSER}"/>
    <c:set var="categoryList" value="${sessionScope.CATEGORYLIST}"/>
    <c:set var="USERPROFILE" value="${requestScope.USERPROFILE}" />

    <section class="cover-sec">
        <img src="static/images/cover-img.jpg" alt="">
        <div class="add-pic-box" ${USERPROFILE.getUserID() == currentUser.getUserID() ? "":"hidden" }>
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-lg-12 col-sm-12">
                        <input type="file" id="file1">
                        <label for="file1">Change Image</label>
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
                                        <img src="${USERPROFILE.getAvatarLink()}" width="190.33px" height="190.33px" alt="">
                                        <div class="add-dp" id="OpenImgUpload" ${USERPROFILE.getUserID() == currentUser.getUserID() ? "":"hidden" }>
                                            <form action="UpdateAvatarServlet" method="post" enctype="multipart/form-data">
                                                <input onchange="this.form.submit()" name="avatarImage" type="file" id="file2">
                                                <label for="file2"><i class="fas fa-camera"></i></label>
                                            </form>

                                        </div>
                                    </div>
                                    <div class="user_pro_status">
                                        <ul class="flw-hr" ${USERPROFILE.getUserID() == currentUser.getUserID() ? "hidden":"" }>
                                            <c:url var="FollowURL" value="FollowUserServlet" >
                                                <c:param name="UserID" value="${USERPROFILE.getUserID()}" />
                                            </c:url>
                                            <c:url var="UnFollowURL" value="UnFollowServlet" >
                                                <c:param name="UserID" value="${USERPROFILE.getUserID()}" />
                                            </c:url>
                                            <li><a href="${FOLLOWED == true ? UnFollowURL:FollowURL}" title="" class="flww${FOLLOWED == true ? "ed":""}"><i class="la ${FOLLOWED == true ? "la-check":"la-plus"}"></i>
                                                Follow${FOLLOWED == true ? "ed":""}</a></li>
                                            <%-- <li><a href="#" title="" class="hre">Hire</a></li> --%>
                                        </ul>
                                        <ul class="flw-status">
                                            <li>
                                                <span>Following</span>
                                                <b>${USERPROFILE.getFolloweeAmount()}</b>
                                            </li>
                                            <li>
                                                <span>Followers</span>
                                                <b>${USERPROFILE.getFollowerAmount()}</b>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- thong tin ca nhan -->
                                    <ul class="social_links">
                                        <li>Full name: ${USERPROFILE.getFullname()}</li>
                                        <li>Date of birth: ${USERPROFILE.getDateOfBirth()}</li>
                                        <li>Gender: ${USERPROFILE.getGender()}</li>
                                        <li>Location: ${USERPROFILE.getLocation()}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="main-ws-sec">
                                <div class="user-tab-sec">
                                    <h3>${USERPROFILE.getUsername()}</h3>
                                    <%-- user description --%>
                                    <%-- <div class="star-descp"> --%>
                                    <%--     <span>Graphic Designer at Self Employed</span> --%>
                                    <%-- </div> --%>
                                    <div class="tab-feed">
                                        <ul>
                                            <li data-tab="feed-dd" class="active animated fadeIn">

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-feed-tab current animated fadeIn" id="feed-dd">
                                    <div class="posts-section">

                                        <c:set var="postList" value="${requestScope.POSTLIST}"/>

                                        <c:if test="${empty postList}">
                                            <p>There is no post, Creat post to see more</p>
                                        </c:if>

                                        <c:if test="${not empty postList}">
                                            <c:forEach var="postDTO" items="${postList}">

                                                <!-- day la bai post template, duoc dung trong c:forEach -->
                                                <div class="posty">
                                                    <div class="post-bar no-margin">
                                                        <div class="post_topbar">
                                                            <div class="usy-dt">
                                                                <img style="width: 50px; height: 50px" src="${postDTO.getAuthorAvatarLink()}" alt="">
                                                                <div class="usy-name">
                                                                    <a href="GetUserProfileServlet?userID=${postDTO.getAuthorID()}"><h3>${postDTO.getAuthorName()}</h3></a>
                                                                    <span><img src="static/images/clock.png" alt="">
                                                                    <a class="postTime" href="ViewPostServlet?id=${postDTO.getPostID()}" style="color: #b2b2b2">${postDTO.getPostTime()}</a>
                                                                </span>
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
                                                                            <li><a href="#" title="" id="${postDTO.getPostID()}" class="edit-post post_project" >Edit Post</a></li>
                                                                        </c:if>
                                                                        <!-- for admin and user only -->
                                                                        <li><a href="DeletePostServlet?id=${postDTO.getPostID()}" title="">Delete post</a></li>
                                                                    </ul>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="epi-sec">
                                                            <ul class="bk-links">
                                                                <!-- this will be the icon of the category(trang tri cho dep, khong bam vao duoc) -->
                                                                    <%--                                                    <li><a title=""><i class="la la-bookmark"></i></a></li>--%>
                                                            </ul>
                                                        </div>
                                                        <div class="job_descp">
                                                            <!-- Can be deleted or change to another -->
                                                            <h3 style="margin-top: 10px">${postDTO.getPostTitle()}</h3>

                                                            <ul class="job-dt">
                                                                <li><a href="SearchCategoryServlet?categoryID=${postDTO.getCategoryID()}" title="">${postDTO.getCategory()}</a></li>
                                                            </ul>
                                                            <p>${postDTO.getPostContent()}</p>
                                                            <c:if test="${not empty postDTO.getImageLinks()}">
                                                                <img style=" width: 100%" src="${postDTO.getImageLinks().get(0)}" alt="">
                                                            </c:if>


                                                        </div>
                                                        <div class="job-status-bar">
                                                            <ul class="like-com">
                                                                <li>
                                                                    <a href="#"><i class="fas fa-heart"></i> Like</a>
                                                                    <span>25</span>
                                                                </li>
                                                                <li><a href="ViewPostServlet?id=${postDTO.getPostID()}" class="com"><i class="fas fa-comment-alt"></i>
                                                                    Comment</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                        <%--                                        <div class="comment-section">--%>
                                                        <%--                                            <a href="#" class="plus-ic">--%>
                                                        <%--                                                <i class="la la-plus"></i>--%>
                                                        <%--                                            </a>--%>
                                                        <%--                                            <div class="comment-sec">--%>
                                                        <%--                                                <ul>--%>
                                                        <%--&lt;%&ndash;                                                    <li>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                        <div class="comment-list">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                            <div class="bg-img">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                <img src="static/images/bg-img1.png" alt="">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                            <div class="comment">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                <h3>John Doe</h3>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                <span><img src="static/images/clock.png" alt="">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                            3 min ago</span>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                <p>Lorem ipsum dolor sit amet, </p>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                <a href="#" title="" class="active"><i&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                        class="fa fa-reply-all"></i>Reply</a>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                        </div>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                        <ul>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                            <li>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                <div class="comment-list">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                    <div class="bg-img">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                        <img src="static/images/bg-img2.png" alt="">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                    </div>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                    <div class="comment">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                        <h3>John Doe</h3>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                        <span><img src="static/images/clock.png" alt="">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                                    3 min ago</span>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                        <p>Hi John </p>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                        <a href="#" title=""><i&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                                class="fa fa-reply-all"></i>Reply</a>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                    </div>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                                </div>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                            </li>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                        </ul>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                    </li>&ndash;%&gt;--%>
                                                        <%--                                                    <li>--%>
                                                        <%--                                                        <div class="comment-list">--%>
                                                        <%--                                                            <div class="bg-img">--%>
                                                        <%--                                                                <img src="static/images/bg-img3.png" alt="">--%>
                                                        <%--                                                            </div>--%>
                                                        <%--                                                            <div class="comment">--%>
                                                        <%--                                                                <h3>John Doe</h3>--%>
                                                        <%--                                                                <span><img src="static/images/clock.png" alt="">--%>
                                                        <%--                                                                            3 min ago</span>--%>
                                                        <%--                                                                <p>Lorem ipsum dolor sit amet, consectetur--%>
                                                        <%--                                                                    adipiscing elit. Aliquam luctus hendrerit metus,--%>
                                                        <%--                                                                    ut ullamcorper quam finibus at.</p>--%>
                                                        <%--                                                                <a href="#" title=""><i--%>
                                                        <%--                                                                        class="fa fa-reply-all"></i>Reply</a>--%>
                                                        <%--                                                            </div>--%>
                                                        <%--                                                        </div>--%>
                                                        <%--                                                    </li>--%>
                                                        <%--                                                </ul>--%>
                                                        <%--                                            </div>--%>
                                                        <%--                                            <div class="post-comment">--%>
                                                        <%--                                                <div class="cm_img">--%>
                                                        <%--                                                    <img src="static/images/bg-img4.png" alt="">--%>
                                                        <%--                                                </div>--%>
                                                        <%--                                                <div class="comment_box">--%>
                                                        <%--                                                    <form>--%>
                                                        <%--                                                        <input type="text" placeholder="Post a comment">--%>
                                                        <%--                                                        <button type="submit">Send</button>--%>
                                                        <%--                                                    </form>--%>
                                                        <%--                                                </div>--%>
                                                        <%--                                            </div>--%>
                                                        <%--                                        </div>--%>
                                                </div>

                                                <div class="edit-post post-popup pst-pj ${postDTO.getPostID()}">
                                                    <div class="post-project">
                                                        <h3>Edit post</h3>
                                                        <div class="post-project-fields">
                                                            <form action="UpdatePostServlet" method="post" enctype="multipart/form-data">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="inp-field">
                                                                            <input name="postID" hidden="" value="${postDTO.getPostID()}">

                                                                            <select name="categoryID">
                                                                                <c:forEach var="categoryDTO" items="${categoryList}">
                                                                                    <option value="${categoryDTO.getCategoryID()}" ${categoryDTO.getCategoryID().equals(postDTO.getCategoryID())?"selected":""}>${categoryDTO.getCategory()}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <input name="title" placeholder="Title" value="${postDTO.getPostTitle()}"/>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <textarea name="description" placeholder="What's on your mind?">${postDTO.getPostContent()}</textarea>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <img id="img-editfile-${postDTO.getPostID()}" style=" width: 30%" src="" alt="">

                                                                        <ul>
                                                                            <li><button class="active" type="submit" value="update">Update</button></li>
                                                                            <li style="margin-bottom: -15px">
                                                                                <input name="Image" type="file" onchange="loadFileEdit(event,this.id)" id="editfile-${postDTO.getPostID()}" style="height: 0;overflow: hidden;width: 0;float: left; padding: 0px; margin-bottom: 0px"/>
                                                                                <label for="editfile-${postDTO.getPostID()}" style="background: #fff; border: 2px solid #e44d3a;border-radius: 3px; color: #e44d3a; cursor: pointer; display: inline-block;font-size: 15px; font-weight: 600; outline: none; padding: 10px 20px;position: relative; transition: all 0.3s; vertical-align: middle; margin: 0;float: right; text-transform: uppercase;">
                                                                                    Change images
                                                                                </label>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <a href="#" title=""><i class="la la-times-circle-o"></i></a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>



<%--                                        <div class="process-comm">--%>
<%--                                            <div class="spinner">--%>
<%--                                                <div class="bounce1"></div>--%>
<%--                                                <div class="bounce2"></div>--%>
<%--                                                <div class="bounce3"></div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
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
<script type="text/javascript" src="static/js/javaScript.js"></script>


</body>

</html>
