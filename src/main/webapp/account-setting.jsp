 <jsp:include page="header.jsp"></jsp:include>

    <section class="profile-account-setting">
        <div class="container">
            <div class="account-tabs-setting">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="acc-leftbar">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link ${requestScope.ACTION == "Info" ?"active":""}" id="nav-acc-tab" data-toggle="tab"
                                   href="#nav-acc"
                                   role="tab" aria-controls="nav-acc" aria-selected="true"><i
                                        class="la la-cogs"></i>Account Setting</a>
                                <a class="nav-item nav-link ${requestScope.ACTION == "Password" ?"active":""}" id="nav-password-tab" data-toggle="tab"
                                   href="#nav-password"
                                   role="tab" aria-controls="nav-password" aria-selected="false"><i
                                        class="fa fa-lock"></i>Change Password</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade ${requestScope.ACTION == "Info" ?"show active":""}" id="nav-acc" role="tabpanel"
                                 aria-labelledby="nav-acc-tab">
                                <div class="acc-setting">
                                    <h3>Account Setting</h3>
                                    <form id="update-user-info-form" method="post" action="UpdateUserInfoServlet" onsubmit="return false" >
                                        <div class="cp-field">
                                            <h5>Full Name</h5>
                                            <p class="error" id="fullname-error"></p>
                                            <div class="cpp-fiel">
                                                <input type="text" name="fullname" placeholder="Enter your full name" value="${sessionScope.CURRENTUSER.getFullname()}">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Date of birth</h5>
                                            <p class="error" id="birthday-error"></p>
                                            <div class="cpp-fiel">
                                                <input type="date" name="birthday" value="${sessionScope.CURRENTUSER.getDateOfBirth()}">
                                                <i class="fa fa-calendar-days"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Gender</h5>
                                            <p class="error" id="gender-error"></p>
                                            <div class="cpp-fiel">
                                                <select class="form-control" name="gender" style="-webkit-appearance: menulist-button;">
                                                    <option value="Male" ${sessionScope.CURRENTUSER.getGender() == "Male" ? "selected":""}>Male</option>
                                                    <option value="Female" ${sessionScope.CURRENTUSER.getGender() == "Female" ? "selected":""}>Female</option>
                                                    <option value="Others" ${sessionScope.CURRENTUSER.getGender() == "Others" ? "selected":""}>Others</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Location</h5>
                                            <p class="error" id="location-error"></p>
                                            <div class="cpp-fiel">
                                                <input type="text" name="location"
                                                       placeholder="Enter your location" value="${sessionScope.CURRENTUSER.getLocation()}">
                                                <i class="fa fa-location-dot"></i>
                                            </div>
                                        </div>
                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li><button id="save-info" type="submit">Save Setting</button></li>
                                                <li><button type="reset">Restore Setting</button></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade ${requestScope.ACTION == "Password" ?"show active":""}" id="nav-password" role="tabpanel"
                                 aria-labelledby="nav-password-tab">
                                <div class="acc-setting">
                                    <h3>Change Password</h3>
                                    <p>${requestScope.OLDPASSWORDERROR}</p>
                                    <form id="change-password-form" action="UpdateUserPasswordServlet" method="post" onsubmit="return false">
                                        <div class="cp-field">
                                            <h5>Old Password</h5>
                                            <p class="error" id="old-password-error"></p>
                                            <div class="cpp-fiel">
                                                <input type="password" name="old-password" placeholder="Old Password" >
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>New Password</h5>
                                            <p class="error" id="new-password-error"></p>
                                            <div class="cpp-fiel">
                                                <input type="password" name="new-password" placeholder="New Password"  >
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Repeat Password</h5>
                                            <p class="error" id="repeat-password-error"></p>
                                            <div class="cpp-fiel">
                                                <input type="password" name="repeat-password"
                                                       placeholder="Repeat Password" >
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><a href="#"
                                                   title="">Forgot Password?</a></h5>
                                        </div>
                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li><button id="save-password" type="submit">Save Setting</button></li>
                                                <li><button type="reset">Restore Setting</button></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/popper.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>
<script type="text/javascript" src="static/js/validate.js"></script>

</body>

</html>
