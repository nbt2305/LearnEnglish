<%-- 
    Document   : editMyExpertProfile
    Created on : Feb 16, 2023, 12:22:27 AM
    Author     : Trung Nguyễn Bá
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/styleeditprofile.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css" integrity="sha512-/2285SnGiTHjSKBkJzedsJ8wwSP0j74ZQyusMQ9j5Z1RtyKqZ3XtfS8hVp8OadLs2uq+8V6/n+CyqUNTO/UpYg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title></title>
    </head>
    <style>
        body {
            background: linear-gradient(to right, #4ca2cd, #67B26F);
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #01bafd
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #01bafd
        }

        .profile-button:focus {
            background: #01bafd;
            box-shadow: none
        }

        .profile-button:active {
            background: #01bafd;
            box-shadow: none
        }

        .back:hover {
            color: #01bafd;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }

        img {
            opacity:1;
            transition: opacity 0.3s ease-in-out;
        }

        img:hover {
            opacity: 0.7;
        }

        .image-container {
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
        }

        .overlay-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #fff;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
    <body>
<!--        <h1>${account.getUsername()}</h1>
        <form action="updateMyStudentProfile" method="post">
            <label for="fname">Full Name:</label>
            <input type="text" id="fname" name="fullname" value="${account.getFullname()}"><br>
            <label for="lname">Age:</label>
            <input type="text" id="lname" name="age" value="${account.getAge()}"><br>
            <label for="fname">Address:</label>
            <input type="text" id="fname" name="address" value="${account.getAddress()}"><br>
            <label for="lname">Email:</label>
            <input type="text" id="lname" name="email" value="${account.getEmail()}"><br>
            <label for="fname">Phone:</label>
            <input type="text" id="fname" name="phone" value="${account.getPhone()}"><br>
            <label for="fname">Description</label><br>
            <textarea id="id" name="description" value="${student.getDescription()} "></textarea>
            <button type="submit">Save</button>
            <h1>${bell}</h1>
            <a href="myExpertProfile">Back</a>
        </form>-->

        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5"
                                                                                                 width="150px"
                                                                                                 height="150px"
                                                                                                 src="${student.getAvatar()}"><span
                                                                                                 class="font-weight-bold">${account.getFullname()}</span><span
                                                                                                 class="text-black-50">${account.getEmail()}</span><span>
                        </span>
                        <button class="btn btn-primary mt-3" style="background-color: #0d6efd;" data-toggle="modal" data-target="#myModal">Change avatar</button>
                    </div>
                </div>
                <div class="col-md-5 border-right">
                    <form action="updateMyStudentProfile" method="post">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Full Name</label><input type="text"
                                                                                                     class="form-control" name="fullname" value="${account.getFullname()}" required></div>
                                                                                                     <div class="col-md-12"><label class="labels">Age</label><input type="number"
                                                                                               class="form-control" name="age" value="${account.getAge()}" required></div>
                                <div class="col-md-12"><label class="labels">Address</label><input type="text"
                                                                                                   class="form-control" name="address" value="${account.getAddress()}" required></div>
                                <div class="col-md-12"><label class="labels">Email</label><input type="text"
                                                                                                 class="form-control" name="email" value="${account.getEmail()}" required></div>
                                <div class="col-md-12"><label class="labels">Phone</label><input type="text"
                                                                                                 class="form-control" name="phone" value="${account.getPhone()}" required></div>
                            </div>
                            <div style="display: flex; justify-content: space-around" class="mt-5 text-center">
                                <a  class="btn btn-primary profile-button" href="myStudentProfile">Back</a> <button class="btn btn-primary profile-button" type="submit">Save
                                    Profile</button>
                                </div>

<!--<div><p style="color: green">${bell}</p></div>-->
                        </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience"><span>Edit
                                Description</span>   </div><br>
                        <div class="col-md-12"><input type="text"
                                                      class="form-control" name="description" value="${student.getDescription()}"></div> <br>
                    </div>
                </div>
                </form>
            </div>
        </div>


        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/LearningEnglish/changeAvatar" enctype="multipart/form-data">

                            <div style="margin-top: 20px" class="form-group">
                                <input type="file"name="avatar">
                            </div>
                            <input type="submit" value="Save">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
