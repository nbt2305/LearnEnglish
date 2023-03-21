<%-- 
    Document   : manageClassOnline
    Created on : Feb 28, 2023, 8:51:07 PM
    Author     : 84877
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css" integrity="sha512-/2285SnGiTHjSKBkJzedsJ8wwSP0j74ZQyusMQ9j5Z1RtyKqZ3XtfS8hVp8OadLs2uq+8V6/n+CyqUNTO/UpYg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>

        body{
            font-family: Helvetica;
            -webkit-font-smoothing: antialiased;
            /*background: rgba( 71, 147, 227, 1);*/
            background: #f7f7f9
        }


        /* Table Styles */

        .table-wrapper{
            margin: 10px 70px 70px;
            box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
        }

        .fl-table {
            border-radius: 5px;
            font-size: 12px;
            font-weight: normal;
            border: none;
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            white-space: nowrap;
            background-color: white;
        }

        .fl-table td, .fl-table th {
            text-align: center;
            padding: 8px;
        }

        .fl-table td {
            border-right: 1px solid #f8f8f8;
            font-size: 16px;
        }

        .fl-table thead th {
            color: #ffffff;
            background: #4FC3A1;
        }


        .fl-table thead th:nth-child(odd) {
            color: #ffffff;
            background: #324960;
        }

        .fl-table tr:nth-child(even) {
            background: #F8F8F8;
        }
        @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);

        body {
            background: #ffffff;
            color: #414141;
            font: 400 17px/2em 'Source Sans Pro', sans-serif;
        }

        .select-box {
            cursor: pointer;
            position : relative;
            max-width:  20em;
            margin: 5em auto;
            width: 100%;
        }

        .select,
        .label {
            color: #414141;
            display: block;
            font: 400 17px/2em 'Source Sans Pro', sans-serif;
        }

        .select {
            width: 100%;
            position: absolute;
            top: 0;
            padding: 5px 0;
            height: 40px;
            opacity: 0;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            background: none transparent;
            border: 0 none;
        }
        .select-box1 {
            background: #ececec;
        }

        .label {
            position: relative;
            padding: 5px 10px;
            cursor: pointer;
        }
        .open .label::after {
            content: "▲";
        }
        .label::after {
            content: "▼";
            font-size: 12px;
            position: absolute;
            right: 0;
            top: 0;
            padding: 5px 15px;
            border-left: 5px solid #fff;
        }

        /* Responsive */

        @media (max-width: 767px) {
            .fl-table {
                display: block;
                width: 100%;
            }
            .table-wrapper:before{
                content: "Scroll horizontally >";
                display: block;
                text-align: right;
                font-size: 11px;
                color: white;
                padding: 0 0 10px;
            }
            .fl-table thead, .fl-table tbody, .fl-table thead th {
                display: block;
            }
            .fl-table thead th:last-child{
                border-bottom: none;
            }
            .fl-table thead {
                float: left;
            }
            .fl-table tbody {
                width: auto;
                position: relative;
                overflow-x: auto;
            }
            .fl-table td, .fl-table th {
                padding: 20px .625em .625em .625em;
                height: 60px;
                vertical-align: middle;
                box-sizing: border-box;
                overflow-x: hidden;
                overflow-y: auto;
                width: 120px;
                font-size: 13px;
                text-overflow: ellipsis;
            }
            .fl-table thead th {
                text-align: left;
                border-bottom: 1px solid #f7f7f9;
            }
            .fl-table tbody tr {
                display: table-cell;
            }
            .fl-table tbody tr:nth-child(odd) {
                background: none;
            }
            .fl-table tr:nth-child(even) {
                background: transparent;
            }
            .fl-table tr td:nth-child(odd) {
                background: #F8F8F8;
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tr td:nth-child(even) {
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tbody td {
                display: block;
                text-align: center;
            }
        }
        .modal{
            display: none;
        }
        table td{
            font-size: 20px;
        }
        a{
            text-decoration: none;
        }
        .class-name {
            border-radius: 9px;
            border: 2px solid #ccc;
            padding: 5px;
            font-size: 16px;
            outline: none;
        }

        .class-name:focus {
            border-color: #4d90fe;
            box-shadow: 0 0 5px rgba(77, 144, 254, 0.8);
        }

        .class-name:valid {
            border-color: #000;
        }



    </style>
    <body>
        <div style="background: #324960;">
            <h2 style="text-align: center;padding:35px 0px;margin-top: 0px;color: #ffffff;font-size: 40px;font-weight: 600;">Schedule </h2>
            <div>
                <h4 style="text-align: center;color: #ffffff;padding-bottom: 30px"><i class="fa-solid fa-house"></i> 
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff" href="/LearningEnglish/manageExperts">Manage Experts</a>  <i class="fa-solid fa-angle-right"></i>
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff" href="/LearningEnglish/manageExperts">Manage Requests</a> </h4>


            </div>
        </div>
        <a style="margin-left: 60px" href="/LearningEnglish/manageExperts"><button class="bttn-minimal bttn-md bttn-primary">Back To Home</button></a>

        <div class="table-wrapper">
            <h2 style="text-align: center">Set Class Online</h2>
            <c:if test="${list.size()>0}">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>Class ID</th>
                            <th>Teacher Name</th>
                            <th>Class Name</th>
                            <th>Time Start</th>
                            <th>Time End</th>
                            <th>Confirm</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="l">
                            <tr>
                                <td>${l.id}</td>
                                <c:forEach items="${expert}" var="e">
                                    <c:if test="${l.username==e.username}">
                                        <td>${e.fullname}</td>
                                    </c:if>
                                </c:forEach>
                                <td>${l.nameClass}</td>
                                <td>${l.timeStart}</td>
                                <td>${l.timeEnd}</td>
                                <td>
                                    <button style="width: 100px" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="GetClassId(${l.id})" >Confirm</button>
                                    <button style="width: 100px" type="button" class="btn btn-danger btn-sm" onclick="GetConfirm(${l.id})">Cancel</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <h2 style="text-align: center">Set Schedule</h2>
            <c:if test="${request.size()>0}">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Class ID</th>
                            <th>Day Of Week/ Date</th>
                            <th>Slot</th>
                            <th>State</th>
                            <th>Confirm</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${request}" var="r">
                            <tr>
                                <td>${r.id}</td>
                                <td>${r.classId}</td>
                                <c:choose>
                                    <c:when test="${r.dayOfWeek=='2'}">
                                        <td>Mondays</td>
                                    </c:when>
                                    <c:when test="${r.dayOfWeek=='3'}">
                                        <td>Tuesday</td>
                                    </c:when>
                                    <c:when test="${r.dayOfWeek=='4'}">
                                        <td>Wednesday</td>
                                    </c:when>
                                    <c:when test="${r.dayOfWeek=='5'}">
                                        <td>Thursday</td>
                                    </c:when>
                                    <c:when test="${r.dayOfWeek=='6'}">
                                        <td>Friday</td>
                                    </c:when>
                                    <c:when test="${r.dayOfWeek=='7'}">
                                        <td>Saturday</td>
                                    </c:when>
                                    <c:when test="${r.dayOfWeek=='1'}">
                                        <td>Sunday</td>
                                    </c:when>
                                    <c:otherwise>
                                        <!--<td>${r.dayOfWeek}</td>-->
                                    </c:otherwise>
                                </c:choose>

                                <td>${r.slot}</td>
                                <c:choose>
                                    <c:when test="${r.isUpdate}">
                                        <td>Update a slot</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>Set a schedule</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    <button style="width: 100px" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#check" onclick="CheckExist(${r.classId})" class="btn btn-info btn-sm">Check Exist</button>
                                    <form action="/LearningEnglish/confirmSetUpSchedule" method="post">
                                        <input name="id" value="${r.id}" hidden=""/>
                                        <input name="dayOfWeek" value="${r.dayOfWeek}" hidden=""/>
                                        <input name="classId" value="${r.classId}" hidden=""/>
                                        <input name="slot" value="${r.slot}" hidden=""/>
                                        <button style="width: 100px" type="submit" class="btn btn-info btn-sm" >Confirm</button>
                                    </form>
                                        <a style="width: 100px" class="btn btn-info btn-sm" href="/LearningEnglish/deleteRequest?rId=${r.id}">Cancel</a>    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <h2 style="text-align: center">Update Schedule</h2>
            <c:if test="${requestUpdate.size()>0}">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Class ID</th>
                            <th>Confirm</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestUpdate}" var="ru">
                            <tr>
                                <td>${ru.id}</td>
                                <c:forEach items="${timeTables}" var="t">
                                    <c:if test="${ru.id==t.id}">
                                        <td>Date: ${t.dateStudy} Slot: ${t.slot}</td>
                                    </c:if>
                                </c:forEach>
                                <td>Date: ${ru.newDate} Slot: ${ru.newSlot}</td>
                                <td>${ru.classId}</td>
                                <td id="${ru.id}">
                                    <form action="/LearningEnglish/confirmRequestUpdate" method="post">
                                        <input id="ruId" name="id" value="${ru.id}" hidden=""/>
                                        <input id="ruDate" name="newDate" value="${ru.newDate}" hidden=""/>
                                        <input id="ruSlot" name="newSlot" value="${ru.newSlot}" hidden=""/>
                                        <input name="classId" value="${ru.classId}" hidden=""/>
                                        <button style="width: 100px" type="submit" class="btn btn-info btn-sm" >Confirm</button>
                                    </form>
                                        <a style="width: 100px" class="btn btn-info btn-sm" href="/LearningEnglish/deleteRequest?ruId=${ru.id}">Cancel</a> <br>
                                    <button style="width: 100px" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#checkStudent" onclick="CheckStudentExist(${ru.id})" class="btn btn-info btn-sm">Check Exist</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create Class Online</h4>
                        </div>
                        <div class="modal-body">
                            <form action="/LearningEnglish/confirmClassOnline" method="post">
                                <input name="id" id="id" hidden="" />
                                <div class="form-group">
                                    Create Link: <input name="link" type="text"/>
                                </div>
                                <div style="margin-top: 20px" class="form-group">
                                    <button id="btnCreate" class="btn btn-lg btn-primary">Create</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="check" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Check Schedule Class Online</h4>
                        </div>
                        <div class="modal-body">
                            <p id="message"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

            <div class="modal fade" id="checkStudent" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Check Schedule Class Online</h4>
                        </div>
                        <div class="modal-body">
                            <p id="message1"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!-- Modal -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
            
            function GetConfirm(id){
                if(confirm('Do you want to cancel?') == true){
                    window.location.href = "/LearningEnglish/deleteRequest?classOnlineId="+id;
                }
            }
            
            function GetClassId(id) {
                document.getElementById("id").value = id;
            }

            function CheckExist(classId) {
                $.ajax({
                    type: "POST",
                    url: "/LearningEnglish/manageTeacher",
                    data: {
                        classId: classId
                    },
                    //if received a response from the server
                    success: function (data) {
                        document.getElementById("message").innerHTML = data;
                    }
                });
            }

            function CheckStudentExist(id) {
                var parent = document.getElementById(id);
                var input = parent.getElementsByTagName("input");
    //                            alert(input.length);
                var result = input[1].value + "///" + input[2].value + "///" + input[3].value;
                $.ajax({
                    type: "POST",
                    url: "/LearningEnglish/manageTeacher",
                    data: {
                        result: result
                    },
                    //if received a response from the server
                    success: function (data) {
                        document.getElementById("message1").innerHTML = data;
                    }
                });
            }
        </script>
    </body>
</html>
