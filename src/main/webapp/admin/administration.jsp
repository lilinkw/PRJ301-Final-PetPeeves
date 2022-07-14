<%--
  Created by IntelliJ IDEA.
  User: phamn
  Date: 7/13/2022
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="fud.model.CategoryDTO" %>
<jsp:include page="header.jsp"></jsp:include>

    <section class="profile-account-setting">
        <div class="container">
            <div class="account-tabs-setting">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="acc-leftbar">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-privcy-tab" data-toggle="tab"
                                   href="#privcy" role="tab" aria-controls="privacy" aria-selected="false"><i class="fa-solid fa-user-check"></i>User management</a>

                                <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab"
                                   href="#nav-password" role="tab" aria-controls="nav-password"
                                   aria-selected="false"><i class="fa-solid fa-list-check"></i>Category management</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="tab-content" id="nav-tabContent">

                            <div class="tab-pane fade active show" id="privcy" role="tabpanel"
                                 aria-labelledby="nav-privcy-tab">
                                <div class="acc-setting">
                                    <h3>User management</h3>
                                    <c:set var="Users" value="${requestScope.ALLUSER}" />
                                    <c:if test="${not empty Users}" >
                                    <div class="requests-list">
                                        <c:forEach var="User" items="${Users}" >
                                            <c:if test="${User.getUserID()  != sessionScope.CURRENTUSER.getUserID() }" >
                                            <c:set var="baned" value="false" />
                                            <div class="request-details">
                                                <div class="noty-user-img">
                                                    <img src="${User.getAvatarLink()}" alt="">
                                                </div>
                                                <div class="request-info">
                                                    <h3>${User.getUsername()}</h3>
                                                    <span>${User.getUserID()} - ${User.getFullname()}</span>
                                                </div>
                                                <div class="accept-feat">
                                                    <ul>
                                                        <c:url var="banUser" value="DeactivateUserServlet" >
                                                            <c:param name="userID" value="${User.getUserID()}"/>
                                                        </c:url>
                                                        <c:url var="unbanUser" value="ActivateUserServlet" >
                                                            <c:param name="userID" value="${User.getUserID()}"/>
                                                        </c:url>
                                                        <li><a href="${User.isStatus() == baned ?unbanUser:banUser }" class="${User.isStatus() == baned ?"accept-req":"unaccept-req" }">${User.isStatus() == baned ?"Unban":"Ban" }</a>
                                                        </li>
                                                        <li></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    </c:if>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="nav-password" role="tabpanel"
                                 aria-labelledby="nav-password-tab">
                                <div class="acc-setting">
                                    <h3>Category management</h3>
                                    <c:set var="categoryList" value="${sessionScope.CATEGORYLIST}"  />
                                    <c:if test="${not empty categoryList}" >
                                        <div class="requests-list">
                                        <c:forEach var="categoryDTO" items="${categoryList}" >
                                            <div class="request-details">
                                                <div class="request-info">
                                                    <h3>${categoryDTO.getCategory()}</h3>
                                                    <span>${categoryDTO.getCategoryID()}</span>
                                                </div>
                                                <div class="accept-feat">
                                                    <ul>
                                                        <li><a href="" class="accept-req">Modify</a>
                                                        </li>
                                                        <li><a href="" class="unaccept-req">Delete</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/popper.js"></script>
<script type="text/javascript" src="../static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="../static/js/slick.min.js"></script>
<script type="text/javascript" src="../static/js/script.js"></script>

</body>

</html>
