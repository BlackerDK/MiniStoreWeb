<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/logincss.css"/>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <title>Login Page</title>
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
            a.forgot-password {
                color: white;
                text-decoration: none;
                position: relative;
            }

            a.forgot-password:hover {
                text-decoration: underline;
            }

        </style>
    </head>
    <body>

        <c:if test="${not empty errorMessage}">
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var errorMessage = "${errorMessage}";
                    var myModal = new bootstrap.Modal(document.getElementById('alertModal'));
                    var modalBody = document.getElementById('alertModalBody');
                    modalBody.innerHTML = errorMessage;
                    myModal.show();
                });
            </script>
        </c:if>
        <section class="d-flex justify-content-center align-items-center min-vh-100 bg-cover bg-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-5 col-sm-11 col-xs-11">
                        <div class="card border-2 border-white rounded-3 shadow-lg bg-transparent">
                            <div class="card-body p-5 col-md-12">
                                <form action="login" method="POST" onsubmit="return validateForm()">
                                    <h2 class="mb-4">Đăng nhập</h2>
                                    <div class="mb-3">
                                        <div class="inputbox ">
                                            <ion-icon name="person-outline"></ion-icon>
                                            <input type="text" name="txtusername" required maxlength="20">
                                            <label for="">Username:</label>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="inputbox">
                                            <ion-icon name="lock-closed-outline"></ion-icon>
                                            <input type="password" name="txtpassword" required maxlength="20" >
                                            <label for="">Password</label>
                                        </div>
                                    </div>
                                    <div class="mb-3 d-flex justify-content-end">
                                        <a href="forgot-password.jsp" class="forgot-password">Quên mật khẩu?</a>
                                    </div>
                                    <div class="g-recaptcha mb-3" data-sitekey="6Lcf9XcmAAAAAJjJG3BepTpkCmglEjKSh8HCdMIQ"></div>
                                    <button type="submit" class="btn btn-primary w-100" id="loginButton">Đăng nhập</button>
                                    <!--<input type="submit" value="Đăng nhập" >-->
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Place this button before the closing body tag -->
        <button type="button" class="btn btn-secondary position-fixed top-0 end-0 m-3" onclick="toggleTheme()">
            <ion-icon name="contrast-outline"></ion-icon>
        </button>


        <!-- Bootstrap Modal -->
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

        <!-- Modal login-->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-flex justify-content-center">
                        <h5 class="modal-title text-danger" id="loginModalLabel">Thông báo</h5>
                    </div>
                    <div class="modal-body text-center text-danger">
                        Hiện đang trong phiên làm việc không thể đăng nhập!!!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="redirectToLoginPage()">Tiếp tục</button>
                    </div>
                </div> 
            </div>
        </div>

        <c:if test="${not empty fullnameemapi}">
            <script>
                $(document).ready(function () {
                    $('#loginModal').modal('show');
                });

                function redirectToLoginPage() {
                    var form = document.createElement("form");
                    form.method = "POST";
                    form.action = "ShowList"; // Thay thế "LogoutServlet" bằng URL của Servlet xử lý logout

                    document.body.appendChild(form);
                    form.submit();
                }
            </script>
        </c:if>

        <script>
            // Hàm kiểm tra và xác nhận reCAPTCHA trước khi gửi form
            function validateForm() {
                var response = grecaptcha.getResponse();
                if (response.length === 0) {
                    var myModal = new bootstrap.Modal(document.getElementById('alertModal'));
                    var modalBody = document.getElementById('alertModalBody');
                    modalBody.innerHTML = "Vui lòng hoàn thành reCAPTCHA để Đăng nhập!!!";
                    myModal.show();
                    return false;
                }
            }

        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="JavaScript/changetheme.js"></script>

    </body>
</html>
