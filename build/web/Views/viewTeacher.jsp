
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Varsity | Blog Single</title>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,300,300italic,500,700' rel='stylesheet'
              type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css"
              integrity="sha512-/2285SnGiTHjSKBkJzedsJ8wwSP0j74ZQyusMQ9j5Z1RtyKqZ3XtfS8hVp8OadLs2uq+8V6/n+CyqUNTO/UpYg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />



    </head>

    <body>

        <!--START SCROLL TOP BUTTON -->
        <a class="scrollToTop" href="#">
            <i class="fa fa-angle-up"></i>
        </a>

        <!-- END SCROLL TOP BUTTON -->
        <section id="mu-page-breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-page-breadcrumb-area">
                            <h2>Teacher's Introduction</h2>
                            <ol class="breadcrumb">
                                <li><a>Home</a></li>
                                <li class="active">Teacher</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- <section id="mu-course-content"> -->
        <div class="animate__animated animate__fadeInLeftBig" ">
            <img src="" style="margin-left: 20%;margin-top: 100px;">

            <figure class="mu-blog-single-img col-md-10"
                    style="width: 100%;background-color: #f8f4f4;padding-bottom: 50px;margin: 100px 0;">

                <div
                    style="margin-top: 50px; display:flex; width:auto;padding-bottom: 50px;background-color: white;margin-left: 150px;margin-right: 150px;">

                    <div style="margin-left:50px;border-radius: 5px;margin-top: 50px;"
                         class="animate__animated animate__fadeInUpBig">
                        <img alt="img" width="500" height="500" style="border-radius:6px"
                             src="${profileOfExpert.avatar}">

                    </div>


                    <div class="profile-content animate__animated animate__fadeInTopRight"
                         style="  padding:12px;margin-left: 10px;width:max-content">

                        <div style="padding:30px">
                            <h1 style="font-size: 80px;font-weight: 700;">${expert.fullname}</h1>
                         
                            <h3
                                style="color: #40424a;font-family: Verdana, Geneva, Tahoma, sans-serif;margin-bottom: 20px;">
                                General Infor</h3>



                            <ul>
                                <li>
                                    <p style=" font-size: 24px;color: #808181"><i class="fa-solid fa-user"
                                                                                  style="margin-right: 10px;color: #01bafd;"> </i> <label for=""
                                                                                  style="margin-right:30px; font-size: 24px;color: #40424a;">Name </label> ${expert.fullname}
                                </li>
                                </p>

                                <li>
                                    <p style=" font-size: 24px;color: #808181"><i class="fa-solid fa-calendar-days"
                                                                                  style="margin-right: 10px;color: #01bafd;"></i>
                                        <label for="" style="margin-right:37px; font-size: 24px;color: #40424a;">
                                            Age</label> ${expert.age}
                                    </p>
                                </li>
                                <li>
                                    <p style=" font-size: 24px;color: #808181"><i class="fa-solid fa-envelope"
                                                                                  style="margin-right: 10px;color: #01bafd;"></i>
                                        <label for=""
                                               style="margin-right:10px; font-size: 24px;color: #40424a;">Email</label>
                                        ${expert.email}
                                    </p>
                                </li>
                            </ul>


                        </div>

                    </div>

                </div>

            </figure>



        </div>




        <div class="about-teachers" style="margin-bottom: 50px;margin-top: 500px;opacity: 0;">
            <section class="about-us col-md-12">
                <div class="about" style="display: flex;">

                    <div class="text">
                        <h2>About me</h2>
                        <h5><span>${profileOfExpert.title}</span></h5>
                        <p>${profileOfExpert.description}</p>

                    </div>
                </div>
            </section>
        </div>


        <div class="container">
            <div>
                <div>
                    <div class="mu-course-content-area">
                        <div>
                            <div>
                                <!-- start course content container -->


                                <!-- end course content container -->

                                <h1 style="margin-top: 1000px;text-align: center;font-weight: bolder;">My
                                    Students</h1>


                                <!-- Start testimonial -->
                                <section id="mu-testimonial" style="margin-bottom:50px;margin-top: 70px;">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mu-testimonial-area">
                                                    <div id="mu-testimonial-slide" class="mu-testimonial-content">
                                                        <!-- start testimonial single item -->
                                                        <div class="mu-testimonial-item">
                                                            <div class="mu-testimonial-quote">
                                                                <blockquote>
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                                                        elit. Voluptatem rerum soluta
                                                                        aperiam
                                                                        blanditiis obcaecati eveniet aliquam consequatur
                                                                        nobis eaque id.</p>
                                                                </blockquote>
                                                            </div>
                                                            <div class="mu-testimonial-img">
                                                                <img src="./Views/assets/img/teachers/johnysin.jpg" alt="img">
                                                            </div>
                                                            <div class="mu-testimonial-info">
                                                                <h4>John Doe</h4>
                                                                <span>Happy Student</span>
                                                            </div>
                                                        </div>
                                                        <!-- end testimonial single item -->
                                                        <!-- start testimonial single item -->
                                                        <div class="mu-testimonial-item">
                                                            <div class="mu-testimonial-quote">
                                                                <blockquote>
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                                                        elit. Voluptatem rerum soluta
                                                                        aperiam
                                                                        blanditiis obcaecati eveniet aliquam consequatur
                                                                        nobis eaque id.</p>
                                                                </blockquote>
                                                            </div>
                                                            <div class="mu-testimonial-img">
                                                                <img src="./Views/assets/img/testimonial-3.png" alt="img">
                                                            </div>
                                                            <div class="mu-testimonial-info">
                                                                <h4>Rebaca Michel</h4>
                                                                <span>Happy Parent</span>
                                                            </div>
                                                        </div>
                                                        <!-- end testimonial single item -->
                                                        <!-- start testimonial single item -->
                                                        <div class="mu-testimonial-item">
                                                            <div class="mu-testimonial-quote">
                                                                <blockquote>
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                                                        elit. Voluptatem rerum soluta
                                                                        aperiam
                                                                        blanditiis obcaecati eveniet aliquam consequatur
                                                                        nobis eaque id.</p>
                                                                </blockquote>
                                                            </div>
                                                            <div class="mu-testimonial-img">
                                                                <img src="./Views/assets/img/testimonial-2.png" alt="img">
                                                            </div>
                                                            <div class="mu-testimonial-info">
                                                                <h4>Stev Smith</h4>
                                                                <span>Happy Student</span>
                                                            </div>
                                                        </div>
                                                        <!-- end testimonial single item -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- End testimonial -->





                                <h1 style="font-weight: 900;margin-top: 20px;text-align: center;">My Courses</h1>




                                <!-- các khóa h?c ?ang d?y c?a Expert -->

                                <div class="mu-related-item"
                                     style="margin-bottom: 30px;box-shadow: 0px 0px 5px;border-radius: 6px;background-color: rgb(22, 96, 160);">

                                    <c:forEach items="${listCourse}" var="i">
                                        <div class="coursess" style="display: inline;">
                                            <div class="col-md-4 my-course"
                                                 style="padding: 20px;box-shadow: 0px 0px 5px;margin: 20px;background-color: white;border-radius: 6px;"
                                                 data-index="1">
                                                <article class="mu-blog-single-item">
                                                    <figure class="mu-blog-single-img">
                                                        <a href="#"><img style="width: 100%; height: 300px" alt="img"
                                                                         src="${i.image}"></a>
                                                        <figcaption class="mu-blog-caption">
                                                            <h3><a href="#">${i.nameCourse}</a></h3>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-blog-meta">
                                                        <a href="">Teacher: ${expert.fullname}</a>

                                                        <span><i class="fa fa-comments-o"></i>87</span>
                                                    </div>
                                                    <div class="mu-blog-description">
                                                        <p>${i.skill}</p>
                                                        <a href="courseDetail?courseId=${i.courseId}" class="mu-read-more-btn">Details</a>
                                                </article>

                                            </div>
                                            <div class="course-desc">
                                                <h1 class="course-content-title">${i.title}</h1>
                                                <p class="course-content-desc">${i.description}</p>

                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>


                                <div style="margin-left: 45%;margin-bottom: 110px; ">
                                    <button onclick="nextDiv()" id="prev-button" class="bttn-fill bttn-md bttn-primary"
                                            style="margin-right: 10px;">Prev</button>
                                    <button onclick="prevDiv()" id="next-button" class="bttn-fill bttn-md bttn-primary"
                                            style="margin-left: 10px;">Next</button>
                                </div>

                                <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/noframework.waypoints.min.js"></script>

                                <script>
                                        /*
                                         var currentDiv = 1;
                                         var numDivs = 4; // T?ng s? kh?i div
                                         var divs = document.querySelectorAll('.col-md-4.my-course');
                                         
                                         function showDiv(n) {
                                         if (n < 1) {
                                         currentDiv = numDivs;
                                         }
                                         if (n > numDivs) {
                                         currentDiv = 1;
                                         }
                                         for (var i = 0; i < divs.length; i++) {
                                         divs[i].style.display = 'none';
                                         }
                                         divs[currentDiv - 1].style.display = 'block';
                                         }
                                         
                                         showDiv(currentDiv);
                                         
                                         function nextDiv() {
                                         currentDiv++;
                                         showDiv(currentDiv);
                                         }
                                         
                                         function prevDiv() {
                                         currentDiv--;
                                         showDiv(currentDiv);
                                         }
                                         */
                                        var waypoint = new Waypoint({
                                            element: document.querySelector('.about-teachers'),
                                            handler: function (direction) {
                                                if (direction === 'down') {
                                                    document.querySelector('.about-teachers').classList.add('animate__animated', 'animate__fadeInLeft');
                                                    document.querySelector('.about-teachers').style.opacity = 1;
                                                } else {
                                                    document.querySelector('.about-teachers').classList.remove('animate__animated', 'animate__fadeInLeft', 'animate__faster');
                                                    document.querySelector('.about-teachers').style.opacity = 0;
                                                }
                                            },
                                            offset: '50%'
                                        });
                                        var aboutTeachers = document.querySelector('.about-teachers');
                                        var windowHeight = window.innerHeight;
                                        var scrollPosition = window.scrollY || window.pageYOffset;

                                        function fadeInOnScroll() {
                                            if (scrollPosition + windowHeight > aboutTeachers.offsetTop + 50) {
                                                aboutTeachers.classList.add('animate__animated', 'animate__slideInUp');
                                                aboutTeachers.style.opacity = 1;
                                                window.removeEventListener('scroll', fadeInOnScroll);
                                            }
                                        }

                                        window.addEventListener('scroll', fadeInOnScroll);

                                        var currentCourseIndex = 0;
                                        var courses = document.getElementsByClassName("coursess");
                                        // courses.add('animate__animated', 'animate__bounceOutLeft');
                                        function showCourse(index) {
                                            // ?n t?t c? các th? div
                                            for (var i = 0; i < courses.length; i++) {
                                                courses[i].style.display = "none";


                                            }

                                            // Hi?n th? th? div t??ng ?ng v?i index
                                            courses[index].style.display = "inline";

                                            // C?p nh?t bi?n currentCourseIndex
                                            currentCourseIndex = index;
                                        }

                                        // Hi?n th? th? div ??u tiên khi trang ???c t?i lên
                                        showCourse(0);

                                        // B?t s? ki?n khi nh?n nút "Next"
                                        document.getElementById("next-button").addEventListener("click", function () {
                                            if (currentCourseIndex < courses.length - 1) {

                                                showCourse(currentCourseIndex + 1);

                                            } else if (currentCourseIndex == courses.length - 1) {
                                                showCourse(0);
                                            }
                                        });

                                        // B?t s? ki?n khi nh?n nút "Prev"
                                        document.getElementById("prev-button").addEventListener("click", function () {
                                            if (currentCourseIndex > 0) {
                                                showCourse(currentCourseIndex - 1);
                                            } else {
                                                showCourse(courses.length - 1);
                                            }
                                        });


                                        const paragraph = document.querySelector('.course-content-desc');

                                        paragraph.addEventListener('mouseenter', () => {
                                            paragraph.style.overflowY = 'scroll';
                                        });

                                        paragraph.addEventListener('mouseleave', () => {
                                            paragraph.style.overflowY = 'hidden';
                                        });

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
                                <script type="text/javascript" src="./Views/assets/js/jquery.mixitup.js"></script>
                                <!-- Add fancyBox -->
                                <script type="text/javascript" src="./Views/assets/js/jquery.fancybox.pack.js"></script>

                                <!-- Custom js -->
                                <script src="./Views/assets/js/custom.js"></script>


                                </body>

                                </html>