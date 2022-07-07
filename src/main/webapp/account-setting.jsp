 <jsp:include page="header.jsp"></jsp:include>

    <section class="profile-account-setting">
        <div class="container">
            <div class="account-tabs-setting">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="acc-leftbar">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-acc-tab" data-toggle="tab"
                                   href="#nav-acc"
                                   role="tab" aria-controls="nav-acc" aria-selected="true"><i
                                        class="la la-cogs"></i>Account Setting</a>
                                <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab"
                                   href="#nav-password"
                                   role="tab" aria-controls="nav-password" aria-selected="false"><i
                                        class="fa fa-lock"></i>Change Password</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-acc" role="tabpanel"
                                 aria-labelledby="nav-acc-tab">
                                <div class="acc-setting">
                                    <h3>Account Setting</h3>
                                    <form>
                                        <div class="cp-field">
                                            <h5>Name</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="fullname" placeholder="Enter your full name">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Date of birth</h5>
                                            <div class="cpp-fiel">
                                                <input type="date" name="birthday">
                                                <i class="fa fa-calendar-days"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Gender</h5>
                                            <div class="cpp-fiel">
                                                <select class="form-control" id="exampleFormControlSelect1" style="-webkit-appearance: menulist-button;">
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                    <option value="Others">Others</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Location</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="location"
                                                       placeholder="Enter your location">
                                                <i class="fa fa-location-dot"></i>
                                            </div>
                                        </div>
                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li><button type="submit">Save Setting</button></li>
                                                <li><button type="submit">Restore Setting</button></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-password" role="tabpanel"
                                 aria-labelledby="nav-password-tab">
                                <div class="acc-setting">
                                    <h3>Change Password</h3>
                                    <form>
                                        <div class="cp-field">
                                            <h5>Old Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="old-password" placeholder="Old Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>New Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="new-password" placeholder="New Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Repeat Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="repeat-password"
                                                       placeholder="Repeat Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><a href="#"
                                                   title="">Forgot Password?</a></h5>
                                        </div>
                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li><button type="submit">Save Setting</button></li>
                                                <li><button type="submit">Restore Setting</button></li>
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
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/popper.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="static/js/slick.min.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

</body>

</html>
