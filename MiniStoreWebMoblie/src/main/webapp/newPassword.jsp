<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/logincss.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>New Password</title>
        <style>
            section {
                background: url('background/morning.jpg')no-repeat;
                background-position: center;
                background-size: cover;
            }

            .night {
                background: url('background/background6.jpg')no-repeat;
                background-position: center;
                background-size: cover;
            }
            .form-group {
                margin: 10px 0px;
            }
            .icon-box {
                color: #fff;
                width: 95px;
                height: 95px;
                display: inline-block;
                border-radius: 50%;
                z-index: 9;
                border: 5px solid #fff;
                padding: 15px;
                text-align: center;
            }
            .modal-headerS {
                background: #47c9a2;
                border-bottom: none;
                position: relative;
                text-align: center;
                border-radius: 5px 5px 0 0;
                padding: 35px 0;
            }
            .material-icons {
                font-family: 'Material Icons';
                font-weight: normal;
                font-style: normal;
                font-size: 24px;
                line-height: 1;
                letter-spacing: normal;
                text-transform: none;
                display: inline-block;
                white-space: nowrap;
                word-wrap: normal;
                direction: ltr;
                -webkit-font-smoothing: antialiased;
            }
            .icon-box i {
                font-size: 48px;
            }

        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${status == 'success'}">
                <section>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                                <div class="container bg-white rounded mt-2 mb-2 px-0" style="background-color: rgba(255, 255, 255, 0.8) !important">
                                    <div class="row justify-content-center align-items-center pt-3">
                                        <h1 class="text-center">
                                            <strong>Reset Password</strong>
                                        </h1>
                                    </div>
                                    <div class="pt-3 pb-3">
                                        <form class="form-horizontal" action="newPass" method="POST" onsubmit="return validatePasswords(event)">
                                            <div class="form-group row justify-content-center px-3">
                                                <div class="col-9 px-0">
                                                    <div class="input-group">
                                                        <input type="password" name="password" value="${param.password}" id="password" placeholder="New Password" class="form-control border-info" required>
                                                        <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordVisibility('password', 'passwordToggleIcon')">
                                                            <ion-icon name="eye-outline" id="passwordToggleIcon"></ion-icon>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row justify-content-center px-3">
                                                <div class="col-9 px-0">
                                                    <div class="input-group">
                                                        <input type="password" name="confPassword" value="${param.confPassword}" id="confPassword" placeholder="Confirm New Password" class="form-control border-info" required>
                                                        <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordVisibility('confPassword', 'confPasswordToggleIcon')">
                                                            <ion-icon name="eye-outline" id="confPasswordToggleIcon"></ion-icon>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row justify-content-center">
                                                <div class="col-6 px-3 mt-3 d-flex justify-content-between">
                                                    <button type="button" class="btn btn-success w-100" onclick="clearPasswords()">Clear</button>
                                                    <button type="submit" class="btn btn-info w-100 ms-5" id="loginButton">Reset</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <!-- Modal login-->
                <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header d-flex justify-content-center">
                                <h5 class="modal-title text-danger" id="loginModalLabel">Thông báo</h5>
                            </div>
                            <div class="modal-body text-center text-danger">
                                chưa hoàn thành xác nhận otp 
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="btn btn-danger" onclick="goBack()">Lấy otp</button>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var errorMessage = "${errorMessage}";
                        var myModal = new bootstrap.Modal(document.getElementById('loginModal'));
                        var modalBody = document.getElementById('alertModalBody');
                        modalBody.innerHTML = errorMessage;
                        myModal.show();
                    });
                    
                    $(document).ready(function () {
                        $('#loginModal').modal('show');
                    });

                    function goBack() {
                        window.location.href = "forgot-password.jsp";
                    }
                </script>
            </c:otherwise>
        </c:choose>

        <c:if test="${not empty errorMess}">
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var errorMessage = "${errorMess}";
                    var myModal = new bootstrap.Modal(document.getElementById('alertModal'));
                    var modalBody = document.getElementById('alertModalBody');
                    modalBody.innerHTML = errorMessage;
                    myModal.show();
                });
            </script>
        </c:if>
        <!--model alert-->
        <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="alertModalLabel">Thông báo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="alertModalBody">
                        <!-- Error message will be displayed here -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal success-->
        <div class="modal fade" id="successModal"  aria-labelledby="alertModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content justify-content-center">
                    <div class="modal-headerS">
                        <div class="icon-box">
                            <i class="material-icons">&#xE876;</i>
                        </div>
                    </div>
                    <div class="modal-body justify-content-center text-center">
                        <p id="successMessage" class="text-center"></p>
                        <!-- Error message will be displayed here -->
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal" onclick="redirectToLoginPage()">Đăng nhập</button>
                    </div>
                </div>
            </div>
        </div>



        <c:if test="${not empty Message}">
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var message = "${Message}";
                    var successModal = new bootstrap.Modal(document.getElementById('successModal'));
                    var successMessage = document.getElementById('successMessage');
                    successMessage.innerHTML = message;
                    successModal.show();
                });
            </script>
        </c:if>

        <button type="button" class="btn btn-secondary position-fixed top-0 end-0 m-3" onclick="toggleTheme()">
            <ion-icon name="contrast-outline"></ion-icon>
        </button>

        <script>
            function togglePasswordVisibility(inputId, toggleIconId) {
                var passwordInput = document.getElementById(inputId);
                var toggleButton = document.getElementById(toggleIconId);

                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    toggleButton.setAttribute("name", "eye-off-outline");
                } else {
                    passwordInput.type = "password";
                    toggleButton.setAttribute("name", "eye-outline");
                }
            }

            function clearPasswords() {
                var passwordInput = document.getElementById("password");
                var confPasswordInput = document.getElementById("confPassword");

                passwordInput.value = "";
                confPasswordInput.value = "";
            }

            $(document).ready(function () {
                $('#successModal').modal('show');
            });

            function redirectToLoginPage() {
                var form = document.createElement("form");
                form.method = "POST";
                form.action = "Login"; // Thay thế "LogoutServlet" bằng URL của Servlet xử lý logout

                document.body.appendChild(form);
                form.submit();
            }
        </script>

        <script src="JavaScript/changetheme.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>
