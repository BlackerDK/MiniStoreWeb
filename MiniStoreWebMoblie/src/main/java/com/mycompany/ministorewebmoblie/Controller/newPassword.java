package com.mycompany.ministorewebmoblie.Controller;

import com.mycompany.ministorewebmoblie.DTO.EmployeeDTO;
import com.mycompany.ministorewebmoblie.Utils.JWTUtils;
import com.mycompany.ministorewebmoblie.Utils.MyUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.json.JSONObject;

public class newPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password").trim();
        String confPassword = request.getParameter("confPassword").trim();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String oldpassword = (String) session.getAttribute("oldpassword");
        if (email == null || email.equals("")) {
            request.setAttribute("error", "otp đã hết hạn");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confPassword)) {
            request.setAttribute("errorMess", "Mật khẩu nhập xác nhận và mật khẩu mới không khớp");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
            return;
        }
        if (oldpassword.equals(password)) {
            request.setAttribute("errorMess", "Mật khẩu mới trùng với mật khẩu hiện tại");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
            return;
        }
        try {

            if (!MyUtils.updatePassword(email, password)) {
                request.setAttribute("errorMess", "cập nhật mật khẩu thất bại");
                request.getRequestDispatcher("newPassword.jsp").forward(request, response);
                return;
            }
//            session.setAttribute("IdEmpapi", IdEmpapi);
            request.setAttribute("Message", "Hoàn thành đổi mật khẩu");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMess", "Tên đăng nhập hoặc mật khẩu không chính xác");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        }
    }

}
