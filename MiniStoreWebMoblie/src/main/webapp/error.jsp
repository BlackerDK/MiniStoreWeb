<%-- 
    Document   : error
    Created on : Jun 29, 2023, 8:41:54 AM
    Author     : nanat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Thêm liên kết tới CSS của Bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* CSS tùy chỉnh */
            .modal-dialog-centered {
                display: flex;
                align-items: center;
                min-height: calc(100% - (1.75rem * 2));
            }
        </style>
    </head>
    <body>
        <!-- Modal popup -->
        <div class="modal fade show d-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header  d-flex justify-content-center">
                        <h5 class="modal-title  d-flex justify-content-center text-danger text-center" id="myModalLabel">Thông báo</h5>
                    </div>
                    <div class="modal-body text-center text-danger">
                        <p>Check In/Out bị lỗi</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="closeWindow1()">Đăng nhập lại</button>
                        <button type="button" class="btn btn-info" data-dismiss="modal" onclick="closeWindow2()">Tiếp tục</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Kịch bản JavaScript -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <script>

                            $(document).ready(function () {
                                // Hiển thị modal khi trang web được tải
                                $('#myModal').modal('show');
                            });
                            function closeWindow1() {
                                var form = document.createElement("form");
                                form.method = "POST";
                                form.action = "Login"; // Thay thế "LogoutServlet" bằng URL của Servlet xử lý logout

                                document.body.appendChild(form);
                                form.submit();
                            }
                            function closeWindow2() {
                                var form = document.createElement("form");
                                form.method = "POST";
                                form.action = "ShowList"; // Thay thế "LogoutServlet" bằng URL của Servlet xử lý logout

                                document.body.appendChild(form);
                                form.submit();
                            }

        </script>
    </body>
</html>
