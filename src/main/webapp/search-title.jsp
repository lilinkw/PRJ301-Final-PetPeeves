<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 7/1/2022
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="header.jsp"></jsp:include>

<main>
    <div class="main-section">
        <div class="container">
            <div class="main-section-data">
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
                                    <form action="SearchUserServlet" method="post">
                                        <input type="text" name="search-user" placeholder="Search user">
                                        <button type="reset" style="float: right; font-size: 14px;
                                            color: #666666; border: none; background-color: white; margin-top: 0.5rem;">
                                            Clear
                                        </button>
                                    </form>
                                </div>

                                <div class="filter-dd">
                                    <div class="filter-ttl">
                                        <h3>Title</h3>
                                    </div>
                                    <form action="SearchTitleServlet" method="post">
                                        <input type="text" name="search-title" placeholder="Search title">
                                        <button type="reset" style="float: right; font-size: 14px;
                                            color: #666666; border: none; background-color: white; margin-top: 0.5rem;">
                                            Clear
                                        </button>
                                    </form>
                                </div>

                                <div class="filter-dd">
                                    <div class="filter-ttl">
                                        <h3>Category</h3>
                                    </div>
                                    <form class="job-tp" action="SearchCategoryServlet" method="get">
                                        <c:set var="categoryList" value="${sessionScope.CATEGORYLIST}"/>
                                        <select name="categoryID">
                                            <c:forEach var="categoryDTO" items="${categoryList}">
                                                <option value="${categoryDTO.getCategoryID()}">${categoryDTO.getCategory()}</option>
                                            </c:forEach>
                                        </select>
                                        <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                                        <button type="submit" style="background-color: #e44d3a; color: white; margin-top: 1rem;
                                            border: none; padding: 0.2rem;">Search
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="main-ws-sec">
                            <div class="posts-section">
                                <c:set var="currentUser" value="${sessionScope.CURRENTUSER}"/>

                                <c:set var="postList" value="${requestScope.POSTLIST}"/>

                                <c:if test="${empty postList}">
                                    <p>There is no post here :((</p>
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
                                                    <form action="EditPostServlet" method="post" enctype="multipart/form-data">
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
                                                                <img id="output-edit" style=" width: 30%" src="" alt="">

                                                                <ul>
                                                                    <li><button class="active" type="submit" value="update">Update</button></li>
                                                                    <li style="margin-bottom: -15px">
                                                                        <input  type="file" onchange="loadFileEdit(event)" id="editfile" style="height: 0;overflow: hidden;width: 0;float: left; padding: 0px; margin-bottom: 0px"/>
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
<footer>
    <div class="footy-sec mn no-margin">
        <div class="container">
            <ul>
                <li><a href="https://gambolthemes.net/workwise-new/help-center.html" title="">Help Center</a>
                </li>
                <li><a href="https://gambolthemes.net/workwise-new/about.html" title="">About</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                       title="">Privacy Policy</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                       title="">Community Guidelines</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                       title="">Cookies Policy</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                       title="">Career</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/forum.html" title="">Forum</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                       title="">Language</a></li>
                <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
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

<%--<script type="text/javascript" src="static/js/bootstrap.min.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<script type="text/javascript" src="static/js/jquery.range-min.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

<script>
    var loadFileEdit = function (event) {
        var image = document.getElementById('output-edit');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
</body>

</html>