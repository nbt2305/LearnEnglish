<%-- 
    Document   : createQuiz
    Created on : Feb 1, 2023, 8:12:24 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /*        $primary: #11998e;
                $secondary: #38ef7d;
                $white: #fff;
                $gray: #9b9b9b;*/
        .form__group {
            position: relative;
            padding: 15px 0 0;
            margin: 10px 50px;
            width: 80%;
        }

        .form__field {
            font-family: inherit;
            width: 100%;
            border: 0;
            border-bottom: 2px solid #9b9b9b;
            outline: 0;
            font-size: 1.3rem;
            color: #fff;
            padding: 7px 0;
            background: transparent;
            transition: border-color 0.2s;

            &::placeholder {
                color: transparent;
            }

            &:placeholder-shown ~ .form__label {
                font-size: 1.3rem;
                cursor: text;
                top: 20px;
            }
        }

        .form__label {
            position: absolute;
            top: 0;
            display: block;
            transition: 0.2s;
            font-size: 1rem;
            color: #9b9b9b;
        }

        .form__field:focus {
            ~ .form__label {
                position: absolute;
                top: 0;
                display: block;
                transition: 0.2s;
                font-size: 1rem;
                color: #11998e;
                font-weight:700;
            }
            padding-bottom: 6px;
            font-weight: 700;
            border-width: 3px;
            border-image: linear-gradient(to right, #11998e,#38ef7d);
            border-image-slice: 1;
        }
        /* reset input */
        .form__field{
            &:required,&:invalid {
                box-shadow:none;
            }
        }
        /* demo */
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-size: 1.5rem;
            background-color:#0A092D;
            color: white;
        }
        /*        body{
                    background-color: #0A092D;
                }*/
        #quiz{
            margin: 10px 300px;
        }
        .question{
            width: 750px;
            border: 1px solid gray;
            border-radius: 10px;
            box-shadow: 0px 0px 5px #2196F3;
            background-color: #2E3856;
        }
        /*        .question input{
                    border-radius: 10px;
                    margin: 10px 30px;
                    width: 670px;
                    height: 60px;
                }*/
        /*        .answer input{
                    width: 150px;
                    height: 40px;
                }
                .fa{
                    margin: 20px 30px;
                    width: 30px;
                    height: 30px;
                    color: #2196F3;
                    text-align: center;
                    border: 5px solid #2196F3;
                    border-radius: 50px;
                    box-shadow: 0px 0px 10px #ccc;
                }
                .fa:hover{
                    box-shadow: 0px 0px 10px #2196F3;
        
                }
                .add1{
                    margin: 10px 20px;
                    font-size: 30px;
                    font-weight: 1900;
                }*/
        .checkbox{
            width: 15px !important;
            height: 15px !important;
        }
    </style>
    <body>
        <form action="/TestFontend/load" method="post">
            <div id="quiz">
                <div id="question" class="question">
                    <div class="form__group field">
                        <input type="input" class="form__field" placeholder="question..." name="question" id='name' required />
                    </div>
                    <div id="all">

                        <div id="content-answer">
                            <div id="answer1" class="answer">
                                <a class="add1" onclick="loadMoreAns()">+</a>
                                <input type="text" name="answer"/> 
                                <input name="correctAns" class="checkbox" value="1" type="checkbox"/>
                                <!--<div id="answer1"></div>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div id="question1"></div>
            </div>
            <i class="fa fa-plus" onclick="loadMore()" style="font-size:36px"></i>
            <!--<i style="width:600px;"  class="add">+</i>-->
            <button type="submit" onclick="GetNum()" >Submit</button>
            <input name="number" hidden id="num"/>
        </form>
        <p>${ss}</p>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>-->
        <script>
            function GetNum(){
                var pa = document.getElementsByClassName("question");
                var qq = pa.length;
                var c = 0;
                var ee = "";
                for(let i = 0; i < qq; i++){
                    var el = pa[i].getElementsByTagName("input"); 
                    c = (el.length-1)/2;
                    if(i < qq-1)
                        ee += c+",";
                    else
                        ee += c+"";
                }
                document.getElementById("num").value = ee;
            }
            
            let count = 1;
            let ans = 1;
            let correct = 1;
            function loadMore(){    
                let s = "question"+count;
                var a = document.getElementById(s);
                count++;
                ans++;
                correct = 1;
                a.innerHTML = "<div id=\"question\" class=\"question\">\n" +
"                <div class=\"content-question\">\n" +
"                    <input name=\"question\" placeholder=\"question...\" type=\"text\"/>\n" +
"                </div>\n" +
"                <div id=\"all\">\n" +
"                    \n" +
"                    <div id=\"content-answer\">\n" +
"                        <div id=\"answer"+ans+"\" class=\"answer\">\n" +
"                            <a class=\"add1\" onclick=\"loadMoreAns(this)\">+</a>\n" +
"                            <input type=\"text\" name=\"answer\"/> \n" +
"                            <input name=\"correctAns\" class=\"checkbox\" value=\"1\" type=\"checkbox\"/>\n" +
"                            <!--<div id=\"answer1\"></div>-->\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"            <div id=\"question"+count+"\"></div>";
            }
            function loadMoreAns(){   
                correct++;
                let an = "answer"+ans;
                const node = document.createElement("input");
                document.getElementById(an).appendChild(node);
                document.getElementById(an).lastChild.setAttribute("name", "answer");
                const node1 = document.createElement("input");
                document.getElementById(an).appendChild(node1);
                document.getElementById(an).lastChild.setAttribute("name", "correctAns");
                document.getElementById(an).lastChild.setAttribute("type", "checkbox");
                document.getElementById(an).lastChild.setAttribute("class", "checkbox");
                document.getElementById(an).lastChild.value = correct;
            }
        </script>
    </body>
</html>
