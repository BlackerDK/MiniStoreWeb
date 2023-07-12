package com.mycompany.ministorewebmoblie.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hủy bỏ phiên làm việc của người dùng
        HttpSession session = request.getSession();
        session.invalidate();

        // Chuyển hướng về trang đăng nhập
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

}
