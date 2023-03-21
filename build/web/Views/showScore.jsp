
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
        <title>Score</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            /*float: right;*/
            margin-top: 30px;
            margin-left: 30%;
            width: 282px;
        }
        table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 590px;
            /*margin-left: 30%;*/
            margin-top: 30px;
            margin-bottom: 1000px;

        }

        table td, table th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;

        }

        table th {
            width: 200px;
        }

        table tr:nth-child(even){
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #ddd;
        }

        table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
            text-align: center;

        }
        .score{
            text-align: center;
            font-weight: 600;
            font-size: 60px;
        }
    </style>
    <body>


        <h1 class="score">My Score</h1>

        <div style="display: flex;justify-content: center;width: 101%;margin-left:  -90px">
            <form action="/LearningEnglish/student/quiz" method="post">
                <button class="button"> Doing Quiz</button>  

            </form>
            <a href="/LearningEnglish/student/lession?courseId=${sessionScope.courseId}">
                <button class="button" style="background-color:  #F7931D"> Back</button>
            </a>
        </div>
        <div style="position: relative">
            <table style="position: absolute; left: 50%; transform: translateX(-50%)">
                <thead>
                <th>Time</th>
                <th>Score</th>
                </thead>
                <tbody>
                    <c:forEach items="${score}" var="s">
                        <tr>
                            <td>${s.time}</td>
                            <td>${s.score}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
