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
                                            color: #666666; border: none; background-color: white; margin-top: 0.5rem;">Clear</button>
                    </form>
                  </div>

                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Title</h3>
                    </div>
                    <form action="SearchTitleServlet" method="post">
                      <input type="text" name="search-title" placeholder="Search title">
                      <button type="reset" style="float: right; font-size: 14px;
                                            color: #666666; border: none; background-color: white; margin-top: 0.5rem;">Clear</button>
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
                                            border: none; padding: 0.2rem;">Search</button>
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

                  <c:forEach var="postDTO" items="${postList}">
                    <!-- day la bai post template, duoc dung trong c:forEach -->
                    <div class="posty">
                      <div class="post-bar no-margin">
                        <div class="post_topbar">
                          <div class="usy-dt">
                            <img style="width: 50px; height: 50px" src="${postDTO.getAuthorAvatarLink()}" alt="">
                            <div class="usy-name">
                              <h3>${postDTO.getAuthorName()}</h3>
                              <span><img src="static/images/clock.png" alt="">
                                <a href="post.jsp" style="color: #b2b2b2">${postDTO.getPostTime()}</a>
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
                                  <li><a href="#" title="">Edit Post</a></li>
                                </c:if>
                                <!-- for admin and user only -->
                                <li><a href="#" title="">Delete post</a></li>
                              </ul>
                            </c:if>

                          </div>
                        </div>
                        <div class="epi-sec">
                          <ul class="bk-links">
<%--                            <!-- this will be the icon of the category(trang tri cho dep, khong bam vao duoc) -->--%>
<%--                            <li><a title=""><i class="la la-bookmark"></i></a></li>--%>
                          </ul>
                        </div>
                        <div class="job_descp">
                          <!-- Can be deleted or change to another -->
                          <h3 style="margin-top: 10px">${postDTO.getPostTitle()}</h3>

                          <ul class="job-dt">
                            <li><a href="#" title="">${postDTO.getCategory()}</a></li>
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
                            <li><a href="#" class="com"><i class="fas fa-comment-alt"></i>
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
                  </c:forEach>




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

</body>

</html>