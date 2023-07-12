<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/logincss.css"/>
        <title>OTP</title>
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
            .forgot-box{
                padding: 20px;
                border: 1px solid #dfdfdf;
                border-radius: 10px;
                background: linear-gradient(rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.8)), url('path/to/your/background/image.jpg') no-repeat;
                background-position: center;
                background-size: cover;
            }
            .form-group{
                margin-top: 10px;
            }
        </style>

    </head>
    <body>
        <c:if test="${not empty error}">
            <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="errorModalLabel">Thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ${error}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-info" data-dismiss="modal" onclick="goBack()">Trở lại</button>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Đóng</button>

                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Show the error modal on page load
                document.addEventListener('DOMContentLoaded', function () {
                    var myModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    myModal.show();
                });
            </script>
        </c:if>

        <c:choose>
            <c:when test="${not empty email}">
                <section>

                    <div class="container">
                        <div class="form-gap"></div>
                        <div class="row justify-content-center">
                            <div class="col-md-4 col-md-offset-4">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center forgot-box">
                                            <h3>
                                                <i class="fa fa-lock fa-4x"></i>
                                            </h3>
                                            <h2 style="color: black" class="text-center">Enter OTP</h2>
                                            <c:if test="${not empty message}">
                                                <p class="text-danger ml-1">${message}</p>
                                            </c:if>

                                            <div class="panel-body">
                                                <form id="register-form" action="ValiOtp" role="form" autocomplete="off" class="form" method="post">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                                            <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="" value="${param.otp}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary w-100" id="loginButton">Reset Password</button>
                                                    </div>
                                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                                </form>
                                            </div>
                                        </div>
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
                        myModal.show();
                    });

                    function goBack() {
                        window.location.href = "forgot-password.jsp";
                    }
                </script>

            </c:otherwise>
        </c:choose>
        <button type="button" class="btn btn-secondary position-fixed top-0 end-0 m-3" onclick="toggleTheme()">
            <ion-icon name="contrast-outline"></ion-icon>
        </button>
        <script>
            function goBack() {
                window.location.href = "forgot-password.jsp";
            }
        </script>
        <script src="JavaScript/changetheme.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
