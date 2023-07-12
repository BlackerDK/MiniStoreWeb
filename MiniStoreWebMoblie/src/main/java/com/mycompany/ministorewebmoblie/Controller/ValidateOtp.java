package com.mycompany.ministorewebmoblie.Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");
        if (email == null || email.equals("")) {
            request.setAttribute("errorMessage", "otp đã hết hạn");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            return;
        }
        RequestDispatcher dispatcher = null;

        if (value == otp) {
            session.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("newPassword.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "otp không chính xác");
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }
}
