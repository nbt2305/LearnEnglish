<%-- 
    Document   : course-detail.jsp
    Created on : Feb 7, 2023, 11:22:18 AM
    Author     : datla
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>E-Learn | Course Detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Favicon -->
        <link rel="shortcut icon" href="./Views/assets/img/favicon.ico" type="image/x-icon">

        <!-- Font awesome -->
        <link href="./Views/assets/css/font-awesome.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="./Views/assets/css/bootstrap.css" rel="stylesheet">   
        <!-- Slick slider -->
        <link rel="stylesheet" type="text/css" href="./Views/assets/css/slick.css">          
        <!-- Fancybox slider -->
        <link rel="stylesheet" href="./Views/assets/css/jquery.fancybox.css" type="text/css" media="screen" /> 
        <!-- Theme color -->
        <link id="switcher" href="./Views/assets/css/theme-color/default-theme.css" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="./Views/manage/img/favicon.png">
        <link rel="stylesheet" href="./Views/manage/css/feathericon.min.css">


        <!-- Main style sheet -->
        <link href="./Views/assets/css/style.css" rel="stylesheet">    


        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,300,300italic,500,700' rel='stylesheet' type='text/css'>

    </head>
    <style>
        .btnEnroll{
            position: absolute;
            top: 600px;
            left: 600px;
            padding: 10px 30px;
            background-color: #01BAFD;
            border-radius: 10px;
            border: none;
            color: white;
        }
        .btnEnroll button{
            background-color: #01BAFD;
            border: none;
        }
        body {
            background: rgba(231, 236, 237, 0.5);

            -webkit-font-smoothing: antialiased;
        }
        .rating {
            margin: auto;
            margin-top: 10px;
            width: 170px;
            height: 30px;
            padding: 5px 10px;
            /*margin: auto;*/
            border-radius: 30px;
            background: #FFF;
            display: block;
            overflow: hidden;

            box-shadow: 0 1px #CCC,
                0 5px #DDD,
                0 9px 6px -3px #999;

            unicode-bidi: bidi-override;
            direction: rtl;
        }
        .rating:not(:checked) > input {
            display: none;
        }

        /* - - - - - RATE */
        #rate {
            top: -65px;
        }
        #rate:not(:checked) > label {
            cursor:pointer;
            float: right;
            width: 30px;
            height: 30px;
            display: block;

            color: rgba(0, 135, 211, .4);
            line-height: 33px;
            text-align: center;
        }
        #rate:not(:checked) > label:hover,
        #rate:not(:checked) > label:hover ~ label {
            color: rgba(0, 135, 211, .6);
        }
        #rate > input:checked + label:hover,
        #rate > input:checked + label:hover ~ label,
        #rate > input:checked ~ label:hover,
        #rate > input:checked ~ label:hover ~ label,
        #rate > label:hover ~ input:checked ~ label {
            color: rgba(0, 135, 211, .8);
        }
        #rate > input:checked ~ label {
            color: rgb(0, 135, 211);
        }
        /* - - - - - LIKE */
        #like {
            bottom: -65px;
        }
        #like:not(:checked) > label {
            cursor:pointer;
            float: right;
            width: 30px;
            height: 30px;
            display: block;

            color: rgba(233, 54, 40, .4);
            line-height: 33px;
            text-align: center;
        }
        #like:not(:checked) > label:hover,
        #like:not(:checked) > label:hover ~ label {
            color: rgba(233, 54, 40, .6);
        }
        #like > input:checked + label:hover,
        #like > input:checked + label:hover ~ label,
        #like > input:checked ~ label:hover,
        #like > input:checked ~ label:hover ~ label,
        #like > label:hover ~ input:checked ~ label {
            color: rgba(233, 54, 40, .8);
        }
        #like > input:checked ~ label {
            color: rgb(233, 54, 40);
        }

        .form-rating{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            width: 300px;
            height: 100px;
            border-radius: 15px;
        }

        .star_rating {
            user-select: none;
            display: flex;
        }

        .star {
            font-size: 3rem;
            color: #ff9800;
            background-color: unset;
            border: none;
        }

        .star:hover {
            cursor: pointer;
        }
    </style>
    <body>

        <a class="scrollToTop" href="#">
            <i class="fa fa-angle-up"></i>      
        </a>
        <!-- END SCROLL TOP BUTTON -->

        <section id="mu-menu">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                                aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- LOGO -->
                        <!-- TEXT BASED LOGO -->
                        <a class="navbar-brand" href="/LearningEnglish/home"><i class="fa fa-university"></i><span>E-Learn</span></a>
                        <!-- IMG BASED LOGO  -->

                        <!-- <a class="navbar-brand" href="index.html"><img src="./Views/assets/img/logo.png" alt="logo"></a> -->
                    </div>



                    <div id="navbar" class="navbar-collapse collapse">
                        <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                            <li class="active"><a href="/LearningEnglish/home">Home</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Course <span
                                        class="fa fa-angle-down"></span></a>


                                <ul class="dropdown-menu" role="menu">
                                    <c:if test="${account.role == 1}">
                                        <li><a href="/LearningEnglish/teacher/manageCourse">Manage Course</a></li>
                                        </c:if>
                                        <c:if test="${account.role == 2}">
                                        <li>
                                            <a href="/LearningEnglish/student/course">My Course</a>
                                        </li>
                                    </c:if>    
                                    <li><a href="/LearningEnglish/search?categoryId=10">Grade 10 </a></li>
                                    <li><a href="/LearningEnglish/search?categoryId=11">Grade 11</a></li>
                                    <li><a href="/LearningEnglish/search?categoryId=12" >Grade 12</a></li>


                                </ul>
                            </li>
                            <li><a href="gallery.html">Gallery</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <span
                                        class="fa fa-angle-down"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="blog-archive.html">Blog Archive</a></li>
                                    <li><a href="blog-single.html">Blog Single</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact</a></li>
                                <c:if test="${account.username != null}">
                                <li class="dropdown">

                                    <img src="${profile.avatar}" class="img-circle"
                                         style="width: 50px;margin-top: 10px;margin-left: 10px;position: absolute;"
                                         alt="Avatar" />
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-left: 50px;"> <span
                                            class="fa fa-angle-down"></span></a>
                                    <ul class="dropdown-menu" role="menu">

                                        <li><a href=""> <i style="margin-right: 10px;" class="fa-solid fa-user"></i>Profile ${account.username}</a>
                                        </li>
                                        <li><a href=""><i style="margin-right: 10px;" class="fa-solid fa-key"></i>Change
                                                password</a></li>
                                        <li><a href="/LearningEnglish/logout"> <i style="margin-right: 10px;"
                                                                                  class="fa-solid fa-right-from-bracket"></i>Log out</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${account.username == null}">
                                <li><a href="/LearningEnglish/login">Login</a></li>
                                </c:if>    

                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </nav>
        </section>
        <!-- End menu -->
        <!-- Start search box -->
        <div id="mu-search">
            <div class="mu-search-area">      
                <button class="mu-search-close"><span class="fa fa-close"></span></button>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">            
                            <form class="mu-search-form">
                                <input type="search" placeholder="Type Your Keyword(s) & Hit Enter">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End search box -->
        <!-- Page breadcrumb -->
        <section id="mu-page-breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-page-breadcrumb-area">
                            <h2>Course Detail</h2>
                            <ol class="breadcrumb">
                                <li><a href="#">Home</a></li>            
                                <li class="active">Course Detail</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End breadcrumb -->
        <section id="mu-course-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-course-content-area">
                            <div class="row">
                                <div class="col-md-9">
                                    <!-- start course content container -->
                                    <div class="mu-course-container mu-course-details">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#"><img src="${course.image}" alt="img"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Drawing</a>
                                                            <span><i class="fa fa-clock-o"></i>90Days</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h2><a href="#">(${course.nameCourse})</a></h2>
                                                        <div class="star_rating">
                                                            <button class="star">&#9734;</button>
                                                            <button class="star">&#9734;</button>
                                                            <button class="star">&#9734;</button>
                                                            <button class="star">&#9734;</button>
                                                            <button class="star">&#9734;</button>

                                                        </div>
                                                        <h4>Course Information</h4>


                                                        <c:if test="${isEnrolled==true}">
                                                            <span id="btnEnroll" class="btnEnroll">
                                                                <a href="/LearningEnglish/student/course?courseId=${course.courseId}">Go to courses</a>
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${isEnrolled!=true && account!=null}">
                                                            <span id="btnEnroll" class="btnEnroll">

                                                                <button onclick="ShowConfirm(${course.courseId})" >Enroll</button>
                                                            </span>
                                                        </c:if>    
                                                        </span>
                                                        <ul>
                                                            <li> <span>Course Price</span> <span>$${course.price}</span></li>
                                                            <li> <span>Place</span> <span>California,USA</span></li>
                                                            <li> <span>Total Students</span> <span>800+</span></li>
                                                            <li> <span>Course Duration</span> <span>4 Weeks</span></li>
                                                            <li> <span>Course Start</span> <span>July 25, 2016</span></li>
                                                        </ul>
                                                        <h4>Description</h4>
                                                        <p>${course.description}</p>
                                                    </div>
                                                </div> 
                                            </div>                                   
                                        </div>
                                    </div>
                                    <!-- end course content container -->
                                    <!-- start related course item -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mu-related-item">
                                                <h3>Related Courses</h3>
                                                <div class="mu-related-item-area">
                                                    <div id="mu-related-item-slide">

                                                        <c:forEach items="${list}" var="c">
                                                            <div class="col-md-6">
                                                                <div class="mu-latest-course-single">
                                                                    <figure class="mu-latest-course-img">
                                                                        <a href="/LearningEnglish/courseDetail?courseId=${c.courseId}"><img alt="img" style="height: 300px;" src="${c.image}"></a>
                                                                        <figcaption class="mu-latest-course-imgcaption">
                                                                            <a>Drawing</a>
                                                                            <span><i class="fa fa-clock-o"></i>90Days</span>
                                                                        </figcaption>
                                                                    </figure>
                                                                    <div class="mu-latest-course-single-content">
                                                                        <h4><a href="/LearningEnglish/courseDetail?courseId=${c.courseId}">Lorem ipsum dolor sit amet.</a></h4>
                                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet quod nisi quisquam modi dolore, dicta obcaecati architecto quidem ullam quia.</p>
                                                                        <div class="mu-latest-course-single-contbottom">
                                                                            <a href="/LearningEnglish/courseDetail?courseId=${c.courseId}" class="mu-course-details">Details</a>
                                                                            <span href="#" class="mu-course-price">${c.price}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end related course item -->

                                    <!-- start list comments -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mu-comments-area">
                                                <h3>${countComments} Comments</h3>
                                                <c:forEach items="${listRatings}" var="i">
                                                    <div class="comments">
                                                        <ul class="commentlist">
                                                            <li>
                                                                <div class="media">
                                                                    <div class="media-left">    
                                                                        <img alt="img" src="${(studentServices.getProfileStudentByUsername(i.student)).avatar}" ${i.timeComment} class="media-object news-img">
                                                                    </div>
                                                                    <div class="media-body">
                                                                        <h4 class="author-name">${(studentServices.getStudentByUsername(i.student)).fullname}</h4>
                                                                        <span class="comments-date">Post at ${i.timeComment}</span>
                                                                        <p>${i.comment}</p>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <!-- comments pagination -->
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end list comments -->

                                    <!-- start comment -->
                                    <c:if test="${isEnrolled}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="respond">
                                                    <h3 class="reply-title">Leave a Comment</h3>
                                                    <form id="commentform" action="commentForCourse?courseId=${course.courseId}" method="post">
                                                        <p class="comment-notes">
                                                            Your email address will not be published. Required fields are marked <span class="required">*</span>
                                                        </p>
                                                        <p class="comment-form-comment">
                                                            <label for="comment">Comment<span class="required">*</span></label>
                                                            <textarea required="required" aria-required="true" rows="8" cols="45" name="comment"></textarea>
                                                        </p>
                                                        <p class="form-submit">
                                                            <input type="submit" value="Post Comment" class="mu-post-btn" name="submit">
                                                            <input onclick="ShowRatingStar()" type="button" value="Rate Course" class="mu-post-btn" name="submit">
                                                        </p>        
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <!-- end comment -->

                                </div>
                                <div class="col-md-3">
                                    <!-- start sidebar -->
                                    <aside class="mu-sidebar">
                                        <!-- start single sidebar -->
                                        <div class="mu-single-sidebar">
                                            <h3>Categories</h3>
                                            <ul class="mu-sidebar-catg">
                                                <li><a href="#">Web Design</a></li>
                                                <li><a href="">Web Development</a></li>
                                                <li><a href="">Math</a></li>

                                            </ul>
                                        </div>
                                        <!-- end single sidebar -->
                                        <!-- start single sidebar -->
                                        <div class="mu-single-sidebar">
                                            <h3>Popular Course</h3>
                                            <div class="mu-sidebar-popular-courses">
                                                <div class="media">
                                                    <div class="media-left">
                                                        <a href="#">
                                                            <img class="media-object" src="./Views/assets/img/courses/1.jpg" alt="img">
                                                        </a>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading"><a href="#">Medical Science</a></h4>                      
                                                        <span class="popular-course-price">$200.00</span>
                                                    </div>
                                                </div>
                                                <div class="media">
                                                    <div class="media-left">
                                                        <a href="#">
                                                            <img class="media-object" src="./Views/assets/img/courses/2.jpg" alt="img">
                                                        </a>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading"><a href="#">Web Design</a></h4>                      
                                                        <span class="popular-course-price">$250.00</span>
                                                    </div>
                                                </div>
                                                <div class="media">
                                                    <div class="media-left">
                                                        <a href="#">
                                                            <img class="media-object" src="./Views/assets/img/courses/3.jpg" alt="img">
                                                        </a>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading"><a href="#">Health & Sports</a></h4>                      
                                                        <span class="popular-course-price">$90.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end single sidebar -->
                                        <!-- start single sidebar -->
                                        <div class="mu-single-sidebar">
                                            <h3>Archives</h3>
                                            <ul class="mu-sidebar-catg mu-sidebar-archives">
                                                <li><a href="#">May <span>(25)</span></a></li>
                                                <li><a href="">June <span>(35)</span></a></li>
                                                <li><a href="">July <span>(20)</span></a></li>
                                                <li><a href="">August <span>(125)</span></a></li>
                                                <li><a href="">September <span>(45)</span></a></li>
                                                <li><a href="">October <span>(85)</span></a></li>
                                            </ul>
                                        </div>
                                        <!-- end single sidebar -->

                                    </aside>
                                    <!-- / end sidebar -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Start footer -->
        <footer id="mu-footer">
            <!-- start footer top -->
            <div class="mu-footer-top">
                <div class="container">
                    <div class="mu-footer-top-area">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>Information</h4>
                                    <ul>
                                        <li><a href="">About Us</a></li>
                                        <li><a href="">Features</a></li>
                                        <li><a href="">Course</a></li>
                                        <li><a href="">Event</a></li>
                                        <li><a href="">Sitemap</a></li>
                                        <li><a href="">Term Of Use</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>Student Help</h4>
                                    <ul>
                                        <li><a href="">Get Started</a></li>
                                        <li><a href="#">My Questions</a></li>
                                        <li><a href="">Download Files</a></li>
                                        <li><a href="">Latest Course</a></li>
                                        <li><a href="">Academic News</a></li>                  
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>News letter</h4>
                                    <p>Get latest update, news & academic offers</p>
                                    <form class="mu-subscribe-form">
                                        <input type="email" placeholder="Type your Email">
                                        <button class="mu-subscribe-btn" type="submit">Subscribe!</button>
                                    </form>               
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>Contact</h4>
                                    <address>
                                        <p>P.O. Box 320, Ross, California 9495, USA</p>
                                        <p>Phone: (415) 453-1568 </p>
                                        <p>Website: www.markups.io</p>
                                        <p>Email: info@markups.io</p>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end footer top -->
            <!-- start footer bottom -->
            <div class="mu-footer-bottom">
                <div class="container">
                    <div class="mu-footer-bottom-area">
                        <p>&copy; All Right Reserved. Designed by <a href="http://www.markups.io/" rel="nofollow">MarkUps.io</a></p>
                    </div>
                </div>
            </div>
            <!-- end footer bottom -->
        </footer>
        <!-- End footer -->
        <c:if test="${isEnrolled && account.role == 2}">
            <div id="rating_star" style="background-color:rgba(0,0,0,1); position: fixed; height: 100%; width: 100%; background-color: rgba(0,0,0,0.3);
                 display: none">
                <i onclick="CloseShowRatingStar()" style="position: absolute; top: 44%; left: 58%; z-index: 100; color: white; padding: 3px 5px 3px 5px; border-radius: 50%;
                   background-color: #01BAFD; cursor: pointer" class="fe fe-close"></i>
                <form  action="addRating" method="post" class="form-rating">
                    <input  name="courseId1" value="${course.courseId}" hidden/>
                    <section id="rate" class="rating">
                        <!-- FIFTH STAR -->
                        <input type="radio" id="star_5" name="rate" value="5" />
                        <label for="star_5" title="Five">&#9733;</label>
                        <!-- FOURTH STAR -->
                        <input type="radio" id="star_4" name="rate" value="4" />
                        <label for="star_4" title="Four">&#9733;</label>
                        <!-- THIRD STAR -->
                        <input type="radio" id="star_3" name="rate" value="3" />
                        <label for="star_3" title="Three">&#9733;</label>
                        <!-- SECOND STAR -->
                        <input type="radio" id="star_2" name="rate" value="2" />
                        <label for="star_2" title="Two">&#9733;</label>
                        <!-- FIRST STAR -->
                        <input type="radio" id="star_1" name="rate" value="1" />
                        <label for="star_1" title="One">&#9733;</label>
                    </section>
                    <input style="position: absolute; left: 50%; transform: translateX(-50%); top: 60px;
                           background-color: #01BAFD; border-radius: 5px; border:none; padding:5px 7px 5px 7px; color: white" type="submit" value="Save">

                </form>
            </div>
        </c:if>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
                    function ShowConfirm(id) {
                        if (confirm("Do you want to enroll this course?") == true) {
                            $.ajax({
                                type: "GET",
                                url: "/LearningEnglish/student/enrollCourse",
                                data: {
                                    courseId: id
                                },
                                success: function (data) {
                                    document.getElementById("btnEnroll").innerHTML = data;
                                }
                            });
                        }
                    }

                    function AddRating(id) {
                        $.ajax({
                            type: "POST",
                            url: "addRating",
                            data: {
                                courseId: id
                            },
                            success: function (data) {
                                window.location.href = "addRating?courseId=" + data;
                            }
                        });
                    }



                    function ShowRatingStar() {
                        var rating = document.getElementById('rating_star');
                        rating.style.display = 'block';
                    }

                    function CloseShowRatingStar() {
                        var rating = document.getElementById('rating_star');
                        rating.style.display = 'none';
                    }

                    // Show star
                    let allStars = document.querySelectorAll('.star');
                    for (let i = 0; i < allStars.length; i++) {
                        if (i <= ${avgStar-1}) {
                            allStars[i].innerHTML = '&#9733';
                        } else {
                            allStars[i].innerHTML = '&#9734';
                        }
                    }
        </script>


        <!-- jQuery library -->
        <script src="./Views/assets/js/jquery.min.js"></script>  
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="./Views/assets/js/bootstrap.js"></script>   
        <!-- Slick slider -->
        <script type="text/javascript" src="./Views/assets/js/slick.js"></script>
        <!-- Counter -->
        <script type="text/javascript" src="./Views/assets/js/waypoints.js"></script>
        <script type="text/javascript" src="./Views/assets/js/jquery.counterup.js"></script>  
        <!-- Mixit slider -->
        <script type="text/javascript" src="./Views/assets/js/jquery.mixitup.js"></script>
        <!-- Add fancyBox -->        
        <script type="text/javascript" src="./Views/assets/js/jquery.fancybox.pack.js"></script>

        <!-- Custom js -->
        <script src="./Views/assets/js/custom.js"></script> 

    </body>
</html>
