<%-- 
    Document   : manageCourse
    Created on : Feb 6, 2023, 11:55:01 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        :root {
            --primColor: #dcdcdc;
            --secoColor: #555555;
            --cornerRad: 4px;
        }
        body {
            background-color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 20px;

            flex-direction: column;
            justify-content: center;

            align-items: center;
        }
        details {
            margin: 70px;
        }
        summary {
            writing-mode: vertical-lr;
            text-align: center;
            padding: 12px 10px;
            width: 23px;
            height: auto;
            background-color: var(--primColor);
            border-radius: var(--cornerRad);
            color: var(--secoColor);
            cursor: pointer;
            user-select: none;
            outline: none;
            transition: transform 200ms ease-in-out 0s;
            margin-left: -60px;
        }
        summary::before,
        summary::after {
            position: static;
            top: 0;
            left: 0;
        }
        summary::before {
            content: "";
        }
        summary::after {
            content: "III";
            letter-spacing: -1px;
        }
        summary:hover {
            transform: scale(1.1);
        }
        summary::marker {
            font-size: 0;
        }
        summary::-webkit-details-marker {
            display: none;
        }
        details[open] .menu {
            animation-name: menuAnim;
        }
        details[open] summary::before {
            content: "X";
        }
        details[open] summary::after {
            content: "";
        }
        .menu {
            height: auto;
            width: fit-content;
            border-radius: var(--cornerRad);
            background-color: var(--primColor);
            box-shadow: 0 4px 12px 0 rgba(0, 0, 0, 0.2);
            margin-top: 8px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
            animation: closeMenu 300ms ease-in-out forwards;
        }
        .menu a {
            padding: 12px 24px;
            margin: 0 16px;
            color: var(--secoColor);
            border-bottom: 2px solid rgba(0, 0, 0, 0.1);
            text-decoration: none;
            text-align: center;
            transition: filter 200ms linear 0s;
            cursor: pointer;
            
        }
       
        .menu a:nth-of-type(1) {
            padding-top: 24px;
        }
        .menu a:nth-last-of-type(1) {
            border-bottom: none;
        }
        .menu a:hover {
            filter: brightness(200%);
           transform: translatex(10px);
        }
        details::before {
            content: "← Let's study";
            color: var(--secoColor);
            position: absolute;
            margin-left: 80px;
            padding: 10px 10px;
            opacity: 0.4;
            margin-left: 15px;
        }
        details[open]::before {
            animation: fadeMe 300ms linear forwards;
        }
        @keyframes menuAnim {
            0% {
                height: 0;
            }
            100% {
                height: auto;
            }
        }
        @keyframes fadeMe {
            0% {
                opacity: 0.4;
            }
            100% {
                opacity: 0;
            }
        }
        #lession{
            position: absolute;
            top: 110px;
            left: 500px;
            width: 1000px;
        }
        .video{
            /*            width: 800px;
                        height: 600px;*/
            /*margin-left: -150px;*/
            padding-left: 50px;
            width: 700px;
        }
        .quiz-options-list{
            float: right;
            margin-right: -10px;
            margin-top: -610px;
            position: relative;
            width: 300px;
        }

        .quiz-options-list p{
            background-color: #dcdcdc;
            border: none;
            margin: 5px 0px;
            padding: 10px;
            border-left: 6px solid #2a73cc;
        }
        .quiz-options-list a{
            color: #333333;
        }
        .quiz-options-list p:hover{
            background-color: #f7f7f7;
        }
        .quiz-time{
            font-size: 12px;
        }
        .video-contain{
            margin-left: -160px;
            border-radius: 14px;
            width: 800px;
            height: 550px;
            background-color: #ffff;
            box-shadow: 0 0 2px;
            border:none;
            position: relative;
            top:100px;
            margin-bottom: 200px;
            left: 40%;
            transform: translateX(-50%);
        }
        .video-contain h3{
            padding:30px;
            margin-left: 17px;
        }
        .duration{

        }
        .back{
            text-decoration: none;
        }
        .back:hover{
            text-decoration:#00d285;
        }
        a{
            text-decoration: none;
        }
        
    </style>
    <body style="align-content: center;">
        <div style="background: #324960;margin:-10px -10px -10px -10px">
            <h2 style="text-align: center;padding:20px 0px;margin-top: 0px;color: #ffffff;font-size: 40px;font-weight: 600;">My Courses </h2>
            <!--<div class="breadcrumb">-->
            <h4 style="text-align: center;color: #ffffff;padding-bottom: 30px;margin-top: -30px;"><i style="font-size: 16px" class="fa-solid fa-house"></i> 
                <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';" style="color: #ffffff;font-size: 16px" href="/LearningEnglish/home">Home</a>  <i style="font-size: 16px"class="fa-solid fa-angle-right"></i>
                <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff;font-size: 16px" href="/LearningEnglish/student/course">My course</a> 


                <!--</div>-->
        </div>

        <details>
            <summary></summary>
            <nav class="menu">
                <c:forEach items="${lession}" var="l">
                    <a class="lession-name"style="width: 100px;" onclick="showVideo(${l.lessionId}, '${l.nameLession}', '${l.path}')">${l.nameLession}</a>      
                </c:forEach>
            </nav>
        </details>
        <div id="lession">

        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
                        function showVideo(id, name, path) {
                            document.getElementById("lession").innerHTML = "<div class='video-contain'><h3>" + name + "</h3><video class='video'width=\"600\" height=\"400\" controls>\n" +
                                    "            <source src=\"" + path + "\" type=\"video/mp4\">\n" +
                                    "            Your browser does not support the video tag.\n" +
                                    "        </video></div>";

                            $.ajax({
                                type: "get",
                                url: "/LearningEnglish/load",
                                data: {
                                    id: id
                                },
                                success: function (data) {
                                    document.getElementById("lession").innerHTML += data;
                                }
                            });
                        }
        </script>
    </body>
</html>
