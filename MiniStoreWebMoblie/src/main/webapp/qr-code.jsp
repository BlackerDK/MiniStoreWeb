<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mycompany.ministorewebmoblie.Utils.MyUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <link rel="stylesheet" href="CSS/qrcss.css"/>
        <title>QR-page</title>
        <style>
            .loginButton {
                width: 100%;
                height: 40px;
                border-radius: 40px;
                background: #fff;
                border: none;
                outline: none;
                cursor: pointer;
                font-size: 1em;
                font-weight: 600;
                padding: 0 20px;
                margin: 3px 0;
            }

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
            .dataTables_length {
                color: white; /* Đổi màu sắc theo ý muốn */
                margin-bottom: 20px;
            }

            .dataTables_info {
                color: white; /* Đổi màu sắc theo ý muốn */
                margin-top: 10px; /* Đổi khoảng cách theo ý muốn */
                margin-bottom: 10px;
            }
            .dataTables_filter {
                margin-bottom: 10px;
                color: white;
            }

            .dataTables_paginate .paginate_button.previous,
            .dataTables_paginate .paginate_button.next {
                color: #3300ff; /* Đổi màu sắc theo ý muốn */
                margin: 0 auto; /* Căn giữa */
                margin-top: 20px;
                margin-bottom: 30px; /* Khoảng cách dưới */
                width: fit-content; /* Đóng gói theo nội dung */
                padding: 5px; /* Khoảng cách giữa nội dung và viền */
            }

            .paginate_button {
                color: #3300ff;
                margin: 0 5px;
                border-radius: 50%;
                padding: 5px;
                background-color: #f0f0f0; /* Màu nền */
                border: 1px solid #ccc; /* Viền */
                padding: 5px 10px; /* Khoảng cách giữa nội dung và viền */
                border-radius: 5px; /* Bo hình nút */
            }

            .current {
                color: white;
                background-color: #0000ff; /* Màu nền */
                border: 1px solid #ccc; /* Viền */
                padding: 5px 10px; /* Khoảng cách giữa nội dung và viền */
                border-radius: 5px; /* Bo hình nút */
            }

            .disabled
            {
                color: #979494 !important;
                background-color: #ccc  !important; /* Màu nền khi nút "Previous" ở trang đầu */
            }



        </style>
    </head>
    <body>
        <c:if test="${not empty errorMessage}">
            <!-- Modal -->
            <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="errorModalLabel">Thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ${errorMessage}
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

        <c:if test="${not empty fullnameemapi}">
            <section class="d-flex justify-content-center align-items-center min-vh-100 bg-cover bg-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-5 col-sm-10 col-xs-10">
                            <br>
                            <h2 name="welcome">Welcome ${fullnameemapi}</h2>
                            <div class="row justify-content-center">
                                <form class="col-md-6" style="width: auto !important;" action="Info" method="POST">
                                    <label for="logoutButton" class="btn btn-info" style="background: transparent; color: white">
                                        <ion-icon name="person-outline"></ion-icon> Thông tin tài khoản
                                    </label>
                                    <input type="submit" id="logoutButton" value="Đăng xuất" style="display: none;">
                                </form>
                            </div>

                            <div class="row justify-content-center">
                                <form class="col-md-6" style="width: auto !important;" action="Login" method="POST" id="logoutForm">
                                    <input type="button" value="Đăng xuất" class="btn btn-danger loginButton" style="background-color: #dc3545; color: #000000;"  onclick="showLogoutConfirmation()">
                                </form>
                            </div>
                            <br>
                            <div class="row justify-content-center">
                                <div class="col-md-6 col-sm-6 col-xs-6 card border-2 border-white rounded-3 shadow-lg bg-transparent align-items-center" style="width: auto !important;">

                                    <c:choose>
                                        <c:when test="${TimeCheckInapi == 'nonsheet' && TimeCheckOutapi == 'noOut'}">
                                            <p style="color: white">Hôm nay bạn không có ca làm!!!</p> 
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${empty TimeCheckInapi}">
                                                <form action="CheckIn" method="post">
                                                    <input type="submit" value="Check In" class="loginButton">
                                                </form>
                                            </c:if>
                                            <c:if test="${empty TimeCheckOutapi && not empty TimeCheckInapi}">
                                                <form action="CheckOut" method="post">
                                                    <input type="submit" value="Check Out" class="loginButton">
                                                </form>
                                            </c:if>
                                            <c:if test="${not empty TimeCheckOutapi && not empty qrCodeURL || not empty TimeCheckInapi && not empty qrCodeURL}">
                                                <p style="color: white">Hãy quét mã qr để Check In hoặc Check Out</p>
                                            </c:if>
                                            <c:if test="${not empty TimeCheckOutapi && not empty TimeCheckInapi && empty qrCodeURL}">
                                                <p style="color: white">Đã hoàn thành ca làm</p>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <br>
                            <c:if test="${not empty qrCodeURL}">
                                <div class="row justify-content-center">
                                    <div class="col-md-10 card border-2 border-white rounded-3 shadow-lg bg-transparent align-items-center" style="width: auto !important;">
                                        <img name="qrimg" src="${qrCodeURL}" alt="QR Code">
                                    </div>
                                </div>
                                <br>
                            </c:if>
                            <br>
                            <h3 name="welcome" style="color: white">Bảng công việc</h3>
                            <!-- Trường nhập liệu ngày bắt đầu -->
                            <form action="ShowList" method="post" onsubmit="return validateDates()">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label for="startDate" style="color: white">From:</label>
                                        <input type="date" class="form-control" id="startDate" name="startDate" required="" value="${sessionScope.dateStarS}">
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label for="endDate" style="color: white">To:</label>
                                        <input type="date" class="form-control" id="endDate" name="endDate" required="" value="${sessionScope.dateEndS}">
                                    </div>
                                </div>
                                <br>
                                <div class="row justify-content-center">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label for="sortOrder" style="color: white">Sort Worksheets:</label>
                                        <select class="form-select" id="sortOrder" name="sortOrder">
                                            <option value="ascending" ${sessionScope.sortOrder == 'ascending' ? 'selected' : ''}>Tăng dần</option>
                                            <option value="descending" ${sessionScope.sortOrder == 'descending' ? 'selected' : ''}>Giảm dần</option>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-primary" value="Search">
                                    </div>
                                </div>
                            </form>
                            <br>


                            <c:set var="worksheetList" value="${sessionScope.worksheetList}" />
                            <c:if test="${not empty worksheetList}">
                                <div id="paginationContainer">
                                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                                        <thead class="thead-dark">
                                            <tr class="table-dark">
                                                <th scope="col">No</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Time Check in</th>
                                                <th scope="col">Time Check out</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="worksheet" items="${worksheetList}" varStatus="status">
                                                <tr class="table-success">
                                                    <th scope="row" class="table-light">${status.index + 1}</th>
                                                    <td class="table-info">${worksheet.date}</td>
                                                    <td>${worksheet.timeCheckIn}</td>
                                                    <c:if test="${worksheet.timeCheckOut != '00:00:00'}">
                                                        <td>${worksheet.timeCheckOut}</td>
                                                    </c:if>
                                                    <c:if test="${worksheet.timeCheckOut == '00:00:00'}">
                                                        <td class="table-warning">__-__-__</td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${empty worksheetList}">
                                <div class="col-md-6 col-sm-6 col-xs-6 card border-2 border-white rounded-3 shadow-lg bg-transparent align-items-center" style="width: auto !important; background-color: #ccc !important">
                                    <h3 style="color: #ff3333">Hiện chưa có dữ liệu của khoảng thời gian này</h3>
                                </div>
                            </c:if>
                            <br>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Place this button before the closing body tag -->
            <button type="button" class="btn btn-secondary position-fixed top-0 end-0 m-3" onclick="toggleTheme()">
                <ion-icon name="contrast-outline"></ion-icon>
            </button>
        </c:if>
        <!-- Modal logout-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="logoutModalLabel">Xác nhận đăng xuất</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn đăng xuất?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Không</button>
                        <button type="button" class="btn btn-danger" onclick="logout()">Đăng xuất</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal login-->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-flex justify-content-center">
                        <h5 class="modal-title text-danger" id="loginModalLabel">Thông báo</h5>
                    </div>
                    <div class="modal-body text-center text-danger">
                        Phiên làm việc đã hết hạn vui lòng đăng nhập lại!!!
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" onclick="redirectToLoginPage()">Đăng nhập</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal mess-->
        <div class="modal fade" id="messModal" tabindex="-1" role="dialog" aria-labelledby="messModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="messModalLabel">Thông báo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Ngày bắt đầu không thể sau ngày kết thúc.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${empty fullnameemapi}">
            <script>
                $(document).ready(function () {
                    $('#loginModal').modal('show');
                });

                function redirectToLoginPage() {
                    var form = document.createElement("form");
                    form.method = "POST";
                    form.action = "Login"; // Thay thế "LogoutServlet" bằng URL của Servlet xử lý logout

                    document.body.appendChild(form);
                    form.submit();
                }

            </script>
        </c:if>

        <script>
            function showLogoutConfirmation() {
                $('#logoutModal').modal('show');
            }

            function logout() {
                $('#logoutForm').submit();
            }

            $(document).ready(function () {
                $('#logoutModal').on('hidden.bs.modal', function () {
                    // Reset the form inside the modal
                    $('#logoutForm').trigger('reset');
                });
            });

            $(document).ready(function () {
                $('#example').DataTable();
            });

            function validateDates() {
                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;

                if (startDate > endDate) {
                    $('#messModal').modal('show'); // Hiển thị modal khi ngày bắt đầu sau ngày kết thúc
                    return false; // Ngăn không cho form được gửi đi
                }

                return true; // Cho phép form được gửi đi
            }
        </script>



        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" ></script>
        <script src=https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"" ></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script src="JavaScript/changetheme.js"></script>
    </body>
</html>
