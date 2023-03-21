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
        <title>Varsity | Course Detail</title>

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
    </style>
    <body>
        
        <a class="scrollToTop" href="#">
            <i class="fa fa-angle-up"></i>      
        </a>
        <!-- END SCROLL TOP BUTTON -->

        <!-- Start menu -->
        <section id="mu-menu">
            <nav class="navbar navbar-default" role="navigation">  
                <div class="container">
                    <div class="navbar-header">
                        <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- LOGO -->              
                        <!-- TEXT BASED LOGO -->
                        <a class="navbar-brand" href="/LearningEnglish/home""><i class="fa fa-university"></i><span>E-Learn</span></a>
                        <!-- IMG BASED LOGO  -->
                        <!-- <a class="navbar-brand" href="index.html"><img src="./Views/assets/img/logo.png" alt="logo"></a> -->
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                            <li><a href="/LearningEnglish/home">Home</a></li>            
                            <li class="dropdown active">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Course <span class="fa fa-angle-down"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="course.html">Course Archive</a></li>                
                                    <li><a href="course-detail.html">Course Detail</a></li>                
                                </ul>
                            </li>           
                            <li><a href="gallery.html">Gallery</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <span class="fa fa-angle-down"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="blog-archive.html">Blog Archive</a></li>                
                                    <li><a href="blog-single.html">Blog Single</a></li>                
                                </ul>
                            </li>            
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="#" id="mu-search-icon"><i class="fa fa-search"></i></a></li>
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
                                                        <a href="#"><img src="https://images5.alphacoders.com/129/1292802.jpg" alt="img"></a>
                                                       
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h2><a href="#">${classOnline.nameClass}</a></h2>
                                                        <h4>Class Online Information</h4>
                                                        <span id="btnEnroll" class="btnEnroll">
                                                            <c:if test="${isEnrolled!=true}">
                                                                <button onclick="ShowConfirm(${classOnline.id})" >Enroll</button>
                                                            </c:if>    
                                                        </span>
                                                        <ul>
<!--                                                            <li> <span>Course Price</span> <span>$${course.price}</span></li>
                                                            <li> <span>Place</span> <span>California,USA</span></li>
                                                            <li> <span>Total Students</span> <span>800+</span></li>-->
                                                            <li> <span>Time Start</span> <span>${classOnline.timeStart}</span></li>
                                                            <li> <span>Time End</span> <span>${classOnline.timeEnd}</span></li>
                                                        </ul>
<!--                                                        <h4>Description</h4>
                                                        <p>${course.description}</p>-->
                                                    </div>
                                                </div> 
                                            </div>                                   
                                        </div>
                                    </div>
                                    <!-- end course content container -->
                                    <!-- start related course item -->
<!--                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mu-related-item">
                                                <h3>Related Courses</h3>
                                                <div class="mu-related-item-area">
                                                    <div id="mu-related-item-slide">

                                                        <c:forEach items="${list}" var="c">
                                                        <div class="col-md-6">
                                                            <div class="mu-latest-course-single">
                                                                <figure class="mu-latest-course-img">
                                                                    <a href="#"><img alt="img" height="300" src="${c.image}"></a>
                                                                    <figcaption class="mu-latest-course-imgcaption">
                                                                        <a href="#">Drawing</a>
                                                                        <span><i class="fa fa-clock-o"></i>90Days</span>
                                                                    </figcaption>
                                                                </figure>
                                                                <div class="mu-latest-course-single-content">
                                                                    <h4><a href="#">Lorem ipsum dolor sit amet.</a></h4>
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet quod nisi quisquam modi dolore, dicta obcaecati architecto quidem ullam quia.</p>
                                                                    <div class="mu-latest-course-single-contbottom">
                                                                        <a href="#" class="mu-course-details">Details</a>
                                                                        <span href="#" class="mu-course-price">$165.00</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>-->
                                    <!-- end start related course item -->
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
                                        <li><a href="#">About Us</a></li>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
            function ShowConfirm(id){
                if(confirm("Do you want to enroll this class?") == true){
                    $.ajax({
                            type: "GET",
                            url: "/LearningEnglish/enrollClassOnline",
                            data: {
                                id:id
                            },
                            success: function(data) {
                                document.getElementById("btnEnroll").innerHTML = data;
                            }
                        });
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
