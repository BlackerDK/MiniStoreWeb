<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/logincss.css"/>
        <title>Forgot Password</title>
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
            h2 {
                color: #333333;
            }

            a.forgot-password:hover {
                text-decoration: underline;
            }

            .forgot-box{
                padding: 20px;
                border: 1px solid #dfdfdf;
                border-radius: 10px;
                background: linear-gradient(rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.8)), url('path/to/your/background/image.jpg') no-repeat;
                background-position: center;
                background-size: cover;
            }


        </style>
    </head>
    <body>
        <c:if test="${not empty error}">
            <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
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
        <section>
            <div class="container padding-bottom-3x mb-2 mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="forgot-box">
                            <h2>Forgot your password?</h2>
                            <p>Change your password in three easy steps. This will help you to secure your password!</p>
                            <ol class="list-unstyled">
                                <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
                                <li><span class="text-primary text-medium">2. </span>Our system will send you an OTP to your email</li>
                                <li><span class="text-primary text-medium">3. </span>Enter the OTP on the next page</li>
                            </ol>
                        </div>
                        <form class="card mt-4 forgot-box" id="forgot-form" action="forget" method="POST">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="email-for-pass">Enter your email address</label>
                                    <input class="form-control" type="email" name="email" id="email-for-pass" required="" value="${param.email}">
                                    <small class="form-text text-muted">Enter the registered email address. Then we'll email an OTP to this address.</small>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button class="btn btn-success" type="submit" value="new" name="actionform">Get New Password</button>
                                <button class="btn btn-danger" type="submit" value="back" name="actionform" onclick="redirectToForget()">Back to Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <button type="button" class="btn btn-secondary position-fixed top-0 end-0 m-3" onclick="toggleTheme()">
            <ion-icon name="contrast-outline"></ion-icon>
        </button>

        <script>
            function redirectToForget() {
                document.getElementById('email-for-pass').removeAttribute('required');
                document.getElementById('forgot-form').action = "forget";
            }
        </script>


        <script src="JavaScript/changetheme.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
