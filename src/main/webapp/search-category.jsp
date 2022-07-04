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
                  <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                     title="">Clear all filters</a>
                </div>
                <div class="paddy">
                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Skills</h3>
                      <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                         title="">Clear</a>
                    </div>
                    <form>
                      <input type="text" name="search-skills" placeholder="Search skills">
                    </form>
                  </div>
                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Availabilty</h3>
                      <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                         title="">Clear</a>
                    </div>
                    <ul class="avail-checks">
                      <li>
                        <input type="radio" name="cc" id="c1">
                        <label for="c1">
                          <span></span>
                        </label>
                        <small>Hourly</small>
                      </li>
                      <li>
                        <input type="radio" name="cc" id="c2">
                        <label for="c2">
                          <span></span>
                        </label>
                        <small>Part Time</small>
                      </li>
                      <li>
                        <input type="radio" name="cc" id="c3">
                        <label for="c3">
                          <span></span>
                        </label>
                        <small>Full Time</small>
                      </li>
                    </ul>
                  </div>
                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Job Type</h3>
                      <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                         title="">Clear</a>
                    </div>
                    <form class="job-tp">
                      <select>
                        <option>Select a job type</option>
                        <option>Select a job type</option>
                        <option>Select a job type</option>
                        <option>Select a job type</option>
                      </select>
                      <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                    </form>
                  </div>
                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Pay Rate / Hr ($)</h3>
                      <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                         title="">Clear</a>
                    </div>
                    <div class="rg-slider">
                      <input class="rn-slider slider-input" type="hidden" value="5,50"
                             style="display: none;">
                      <div class="slider-container theme-green" style="width: 300px;">
                        <div class="back-bar">
                          <div class="selected-bar" style="width: 93px; left: 10.5px;">
                          </div>
                          <div class="pointer low" style="left: 4px;"></div>
                          <div class="pointer-label low" style="left: 0px;">5</div>
                          <div class="pointer high" style="left: 97px;"></div>
                          <div class="pointer-label high" style="left: 78px;">50</div>
                          <div class="clickable-dummy"></div>
                        </div>
                        <div class="scale"></div>
                      </div>
                    </div>
                    <div class="rg-limit">
                      <h4>1</h4>
                      <h4>100+</h4>
                    </div>
                  </div>
                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Experience Level</h3>
                      <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                         title="">Clear</a>
                    </div>
                    <form class="job-tp">
                      <select>
                        <option>Select a experience level</option>
                        <option>3 years</option>
                        <option>4 years</option>
                        <option>5 years</option>
                      </select>
                      <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                    </form>
                  </div>
                  <div class="filter-dd">
                    <div class="filter-ttl">
                      <h3>Countries</h3>
                      <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                         title="">Clear</a>
                    </div>
                    <form class="job-tp">
                      <select>
                        <option>Select a country</option>
                        <option>United Kingdom</option>
                        <option>United States</option>
                        <option>Russia</option>
                      </select>
                      <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="main-ws-sec">
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
                                                                <a href="post.jsp" style="color: #b2b2b2">3 min ago</a>
                                                            </span>
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
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                          luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                          magna sit amet... <a href="#" title="">view more</a></p>
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
                        <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                           title="" class="ed-opts-open"><i
                                class="la la-ellipsis-v"></i></a>
                        <ul class="ed-options">
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Edit Post</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Unsaved</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Unbid</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Close</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Hide</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="epi-sec">
                      <ul class="descp">
                        <li><img src="static/images/icon8.png" alt=""><span>Front End
                                                            Developer</span></li>
                        <li><img src="static/images/icon9.png"
                                 alt=""><span>India</span></li>
                      </ul>
                      <ul class="bk-links">
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title=""><i class="la la-bookmark"></i></a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title=""><i class="la la-envelope"></i></a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="" class="bid_now">Bid Now</a></li>
                      </ul>
                    </div>
                    <div class="job_descp">
                      <h3>Ios Shopping mobile app</h3>
                      <ul class="job-dt">
                        <li><span>$300 - $350</span></li>
                      </ul>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                        luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                        magna sit amet... <a
                                href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                title="">view more</a></p>
                      <ul class="skill-tags">
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">HTML</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">PHP</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">CSS</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Javascript</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Wordpress</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Photoshop</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Illustrator</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Corel Draw</a></li>
                      </ul>
                    </div>
                    <div class="job-status-bar">
                      <ul class="like-com">
                        <li>
                          <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                             class="active"><i class="fas fa-heart"></i> Like</a>
                          <img src="static/images/liked-img.png" alt="">
                          <span>25</span>
                        </li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               class="com"><i class="fas fa-comment-alt"></i> Comments
                          15</a></li>
                      </ul>
                      <a
                              href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"><i
                              class="fas fa-eye"></i>Views 50</a>
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
                        <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                           title="" class="ed-opts-open"><i
                                class="la la-ellipsis-v"></i></a>
                        <ul class="ed-options">
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Edit Post</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Unsaved</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Unbid</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Close</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Hide</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="epi-sec">
                      <ul class="descp">
                        <li><img src="static/images/icon8.png" alt=""><span>Front End
                                                            Developer</span></li>
                        <li><img src="static/images/icon9.png"
                                 alt=""><span>India</span></li>
                      </ul>
                      <ul class="bk-links">
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title=""><i class="la la-bookmark"></i></a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title=""><i class="la la-envelope"></i></a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="" class="bid_now">Bid Now</a></li>
                      </ul>
                    </div>
                    <div class="job_descp">
                      <h3>Simple Classified Site</h3>
                      <ul class="job-dt">
                        <li><span>$300 - $350</span></li>
                      </ul>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                        luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                        magna sit amet... <a
                                href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                title="">view more</a></p>
                      <ul class="skill-tags">
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">HTML</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">PHP</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">CSS</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Javascript</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Wordpress</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Photoshop</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Illustrator</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Corel Draw</a></li>
                      </ul>
                    </div>
                    <div class="job-status-bar">
                      <ul class="like-com">
                        <li>
                          <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                             class="active"><i class="fas fa-heart"></i> Like</a>
                          <img src="static/images/liked-img.png" alt="">
                          <span>25</span>
                        </li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               class="com"><i class="fas fa-comment-alt"></i> Comments
                          15</a></li>
                      </ul>
                      <a
                              href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"><i
                              class="fas fa-eye"></i>Views 50</a>
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
                        <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                           title="" class="ed-opts-open"><i
                                class="la la-ellipsis-v"></i></a>
                        <ul class="ed-options">
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Edit Post</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Unsaved</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Unbid</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Close</a></li>
                          <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                 title="">Hide</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="epi-sec">
                      <ul class="descp">
                        <li><img src="static/images/icon8.png" alt=""><span>Front End
                                                            Developer</span></li>
                        <li><img src="static/images/icon9.png"
                                 alt=""><span>India</span></li>
                      </ul>
                      <ul class="bk-links">
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title=""><i class="la la-bookmark"></i></a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title=""><i class="la la-envelope"></i></a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="" class="bid_now">Bid Now</a></li>
                      </ul>
                    </div>
                    <div class="job_descp">
                      <h3>Ios Shopping mobile app</h3>
                      <ul class="job-dt">
                        <li><span>$300 - $350</span></li>
                      </ul>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                        luctus hendrerit metus, ut ullamcorper quam finibus at. Etiam id
                        magna sit amet... <a
                                href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                                title="">view more</a></p>
                      <ul class="skill-tags">
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">HTML</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">PHP</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">CSS</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Javascript</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Wordpress</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Photoshop</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Illustrator</a></li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               title="">Corel Draw</a></li>
                      </ul>
                    </div>
                    <div class="job-status-bar">
                      <ul class="like-com">
                        <li>
                          <a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                             class="active"><i class="fas fa-heart"></i> Like</a>
                          <img src="static/images/liked-img.png" alt="">
                          <span>25</span>
                        </li>
                        <li><a href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"
                               class="com"><i class="fas fa-comment-alt"></i> Comments
                          15</a></li>
                      </ul>
                      <a
                              href="https://gambolthemes.net/workwise-new/projects.html?search-skills=aa#"><i
                              class="fas fa-eye"></i>Views 50</a>
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