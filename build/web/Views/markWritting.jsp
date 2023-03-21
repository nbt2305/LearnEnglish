
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css" integrity="sha512-/2285SnGiTHjSKBkJzedsJ8wwSP0j74ZQyusMQ9j5Z1RtyKqZ3XtfS8hVp8OadLs2uq+8V6/n+CyqUNTO/UpYg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <style>
        div{
            margin: 20px 30px;
        }
        .writting{
            border: 1px solid gray;
            border-radius: 10px;
            padding: 10px 30px;
        }

        #name{
            width: 600px;
            height: 40px;
            padding-top: 20px;
            padding-left: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px #555;
            border-bottom: 3px solid #fffff;
            background-color: #04AA6D;
        }
        #name:hover{
            opacity: 0.5;
        }
        input[type=number]{
            width: 70px;
            height: 25px;
            border-radius: 5px;
        }
        .back{
            text-decoration: none;
            margin-top: 20px;
        }
        .view{
            background-color: #009ce7;
            border: none;
            font-size: 15px;
            border-radius: 7px;
            float: right    ;
            margin-right: 13px;
        }
        .title-score{
            text-align: center;
            font-size: 40px;
            font-weight: 600;
            margin-top: -10px;
            margin-left: -10px;
            margin-right: -10px;
            margin-bottom: 40px;
            padding: 50px 0px;
        }
        .result{
            width: fit-content;
            justify-content: center;
            align-items: center;
            margin-left: 30%;
        }
    </style>
    <body>
        <h1 class='title-score'>Student's Result</h1>
        <a style="margin-left: 30%" href="/LearningEnglish/home"><button class="bttn-minimal bttn-md bttn-primary">Back To Home</button></a>
        <c:forEach items="${write}" var="w">
            <c:forEach items="${listAcc}" var="a">
                <c:if test="${w.username==a.username}">
                    <div class="result">
                        <p id="name">${a.fullname} | ${w.date} 
                            <button class="view"onclick="View('${a.username}', this)">View</button>
                        <p>
                            
                        <div class="writting" style="display: none" id="${a.username}">
                            <div>
                                <input placeholder="mark..." type="number" value="${score.getScore(w.quizId, a.username) == -1 ? "" : score.getScore(w.quizId, a.username)}"/>
                                <button onclick="SaveScore('${a.username}', ${w.quizId})" class="save">Save</button>
                                <span></span>
                            </div>
                            ${w.content}
                        </div>
                    </div>
                </c:if>

            </c:forEach>
        </c:forEach>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
                                    function View(a, t) {
                                        var x = document.getElementById(a);
                                        if (x.style.display === "none") {
                                            x.style.display = "block";
                                            t.innerHTML = "Hide";
                                        } else {
                                            t.innerHTML = "View";
                                            x.style.display = "none";
                                        }
                                    }

                                    function SaveScore(username, id) {
                                        var x = document.getElementById(username);
                                        var score = x.getElementsByTagName("input")[0].value;
                                        if (score < 0 || score > 10) {
                                            alert("please input score from 0 to 10");
                                        } else {
                                            var content = username + "///" + id + "///" + score;
                                            $.ajax({
                                                type: "POST",
                                                url: "/LearningEnglish/teacher/markWritting",
                                                data: {
                                                    content: content
                                                },
                                                success: function (data) {
                                                    x.getElementsByTagName("span")[0].innerHTML = data;
                                                }
                                            });
                                        }
                                    }
        </script>
    </body>
</html>
