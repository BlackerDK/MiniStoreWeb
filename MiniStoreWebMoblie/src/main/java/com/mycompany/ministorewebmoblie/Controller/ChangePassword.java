/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ministorewebmoblie.Controller;

import com.mycompany.ministorewebmoblie.DTO.EmployeeDTO;
import com.mycompany.ministorewebmoblie.Utils.MyUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author nanat
 */
public class ChangePassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldpassword = request.getParameter("oldPassword").trim();
        String newPassword = request.getParameter("newPassword").trim();
        String confirmPassword = request.getParameter("confirmPassword").trim();
        HttpSession session = request.getSession();
        EmployeeDTO emp = (EmployeeDTO) session.getAttribute("EmployeeDTOAPI");
        if (emp == null) {
            request.setAttribute("errorMessage", "Phiên làm việc đã hết hạn");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        String email = emp.getEmail();
        String pass = emp.getPassword();
        if (!oldpassword.equals(pass)) {
            request.setAttribute("errorM", "Mật khẩu cũ không chính xác");
            request.getRequestDispatcher("View-info.jsp").forward(request, response);
            return;
        }
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorM", "Mật khẩu nhập xác nhận và mật khẩu mới không khớp");
            request.getRequestDispatcher("View-info.jsp").forward(request, response);
            return;
        }
        if (oldpassword.equals(newPassword)) {
            request.setAttribute("errorM", "Mật khẩu mới trùng với mật khẩu hiện tại");
            request.getRequestDispatcher("View-info.jsp").forward(request, response);
            return;
        }
        try {

            if (!MyUtils.updatePassword(email, newPassword)) {
                request.setAttribute("errorM", "cập nhật mật khẩu thất bại");
                request.getRequestDispatcher("View-info.jsp").forward(request, response);
                return;
            }
//            session.setAttribute("IdEmpapi", IdEmpapi);
            request.setAttribute("Message", "Hoàn thành đổi mật khẩu");
            request.getRequestDispatcher("View-info.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorM", "cập nhật mật khẩu thất bại");
            request.getRequestDispatcher("View-info.jsp").forward(request, response);
        }
    }

}
