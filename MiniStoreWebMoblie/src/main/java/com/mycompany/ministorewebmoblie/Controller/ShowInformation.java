/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ministorewebmoblie.Controller;

import com.mycompany.ministorewebmoblie.DTO.EmployeeDTO;
import com.mycompany.ministorewebmoblie.DTO.WorksheetDTO;
import com.mycompany.ministorewebmoblie.Utils.MyUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author nanat
 */
public class ShowInformation extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String idemp = (String) session.getAttribute("IdEmpapi");
        boolean type = false;
        if (idemp == null || idemp.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng đăng nhập để vào trang này!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        EmployeeDTO empDTO = MyUtils.getInfo(idemp);
        if (empDTO == null) {
            request.setAttribute("errorMessage", "không lấy được thông tin");
            request.getRequestDispatcher("qr-code.jsp").forward(request, response);
        }
        session.setAttribute("EmployeeDTOAPI", empDTO);
        request.getRequestDispatcher("View-info.jsp").forward(request, response);
    }
}
