<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 6/19/2022
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <jsp:include page="header.jsp"></jsp:include>

    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 pd-left-none no-pd">
                            <div class="main-left-sidebar no-margin">
                                <div class="user-data full-width">
                                    <div class="user-profile">
                                    <c:set var="currentUser" value="${sessionScope.CURRENTUSER}"/>
                                        <c:set var="categoryList" value="${sessionScope.CATEGORYLIST}"/>
                                        <div class="username-dt">
                                            <div class="usr-pic">
                                                <img src="${currentUser.getAvatarLink()}" alt="">
                                            </div>
                                        </div>
                                        <div class="user-specs">
                                            <h3>${currentUser.getUsername()}</h3>
                                            <span>${currentUser.getLocation()}</span>
                                        </div>
                                    </div>
                                    <ul class="user-fw-status">
                                        <li>
                                            <h4>Following</h4>
                                            <span>${currentUser.getFolloweeAmount()}</span>
                                        </li>
                                        <li>
                                            <h4>Followers</h4>
                                            <span>${currentUser.getFollowerAmount()}</span>
                                        </li>
                                        <li>
                                            <a href="user-profile.jsp"
                                               title="">View Profile</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tags-sec full-width">
                                    <div class="cp-sec">
                                        <img src="static/images/logo2.png" alt="">
                                        <p><img src="static/images/cp.png" alt="">Copyright 2019</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-8 no-pd">
                            <div class="main-ws-sec">
                                <div class="post-topbar">
                                    <div class="user-picy">
                                        <img src="${currentUser.getAvatarLink()}" alt="">
                                    </div>
                                    <div class="post-st">
                                        <ul>
                                            <li><a class="creat-new-post post_project" href="#" title="">Post</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="posts-section">
                                    <c:set var="postList" value="${requestScope.POSTLIST}"/>
                                    <c:if test="${not empty postList}">
                                        <c:forEach var="postDTO" items="${postList}">
                                            <c:set var="a" value="${postDTO}"/>

                                            <!-- day la bai post template, duoc dung trong c:forEach -->
                                            <div class="posty">
                                                <div class="post-bar no-margin">
                                                    <div class="post_topbar">
                                                        <div class="usy-dt">
                                                            <img style="width: 50px; height: 50px" src="${postDTO.getAuthorAvatarLink()}" alt="">
                                                            <div class="usy-name">
                                                                <h3>${postDTO.getAuthorName()}</h3>
                                                                <span><img src="static/images/clock.png" alt="">
                                                                    <a href="EditPostServlet?id=${postDTO.getPostID()}" style="color: #b2b2b2">${postDTO.getPostTime()}</a>
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
                                                        <img style="display: block; width: 100%" src="${postDTO.getImageLinks().get(0)}" alt="">
                                                    </div>
                                                    <div class="job-status-bar">
                                                        <ul class="like-com">
                                                            <li>
                                                                <a href="#"><i class="fas fa-heart"></i> Like</a>
                                                                <span>25</span>
                                                            </li>
                                                            <li><a href="EditPostServlet?id=${postDTO.getPostID()}" class="com"><i class="fas fa-comment-alt"></i>
                                                                Comment 15</a></li>
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
                                                        <form action="EditPostServlet" method="post">
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
                                                                    <img id="output" style="display: block; width: 50%" src="${postDTO.getImageLinks().get(0)}" alt="">
                                                                    <ul>
                                                                        <li><button class="active" type="submit" value="update">Update</button></li>
                                                                        <li style="margin-bottom: -15px">
                                                                            <input type="file" onchange="loadFile(event)" id="editfile" style="height: 0;overflow: hidden;width: 0;float: left; padding: 0px; margin-bottom: 0px"/>
                                                                            <label for="editfile" style="background: #fff; border: 2px solid #e44d3a;border-radius: 3px; color: #e44d3a; cursor: pointer; display: inline-block;font-size: 15px; font-weight: 600; outline: none; padding: 10px 20px;position: relative; transition: all 0.3s; vertical-align: middle; margin: 0;float: right; text-transform: uppercase;">
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
                                    <c:if test="${empty postList}">
                                        <p>There is no post, Creat post or follow someone to see more</p>
                                    </c:if>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


<%--    Creat new post popup--%>
        <div class="creat-new-post post-popup pst-pj ">
            <div class="post-project">
                <h3>Create post</h3>
                <div class="post-project-fields">
                    <form action="ViewNewsFeedServlet" method="post">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="inp-field">
                                    <select name="categoryID">
                                        <c:forEach var="categoryDTO" items="${categoryList}">
                                            <option value="${categoryDTO.getCategoryID()}">${categoryDTO.getCategory()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <input name="title" placeholder="Title"/>
                            </div>
                            <div class="col-lg-12">
                                <textarea name="description" placeholder="What's on your mind?"></textarea>
                            </div>
                            <div class="col-lg-12">
                                <ul>
                                    <li><button class="active" type="submit" value="update">Update</button></li>
                                    <li style="margin-bottom: -15px">
                                        <input type="file" id="file" style="height: 0;overflow: hidden;width: 0;
                                        float: left; padding: 0px; margin-bottom: 0px">

                                        <label for="file" style="background: #fff; border: 2px solid #e44d3a;
                                    border-radius: 3px; color: #e44d3a; cursor: pointer; display: inline-block;
                                    font-size: 15px; font-weight: 600; outline: none; padding: 10px 20px;
                                    position: relative; transition: all 0.3s; vertical-align: middle; margin: 0;
                                    float: right; text-transform: uppercase;">
                                            Add images
                                        </label>
                                    </li>
<%--                                    <li><a href="#" title="">Cancel</a>--%>
<%--                                    </li>--%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<script type="text/javascript" src="static/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/scrollbar.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>
<script>
    var loadFile = function(event) {
        var image = document.getElementById('output');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>

</body>

</html>
