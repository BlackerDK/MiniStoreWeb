/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ministorewebmoblie.Controller;

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

public class ShowListWSServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String idemp = (String) session.getAttribute("IdEmpapi");
        String dateStar = (String) request.getParameter("startDate");
        String dateEnd = (String) request.getParameter("endDate");
        String sortOrder = (String) request.getParameter("sortOrder");
        boolean type = false;
        if (idemp == null || idemp.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng đăng nhập để vào trang này!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        if (dateStar == null && dateEnd == null && sortOrder == null) {
            // Lấy đầu tháng hiện tại
            LocalDate firstDayOfMonth = LocalDate.now().withDayOfMonth(1);
            // Lấy cuối tháng hiện tại
            LocalDate lastDayOfMonth = LocalDate.now().withDayOfMonth(LocalDate.now().lengthOfMonth());
            sortOrder = "descending";
            dateStar = firstDayOfMonth.toString();
            dateEnd = lastDayOfMonth.toString();
        } else {
            if (sortOrder.equals("ascending")) {
                type = true;
            }
        }

        List<WorksheetDTO> ListWS = MyUtils.getSheetAvailable(idemp, dateStar, dateEnd, type);

        session.setAttribute("dateStarS", dateStar);
        session.setAttribute("dateEndS", dateEnd);
        session.setAttribute("sortOrder", sortOrder);
        session.setAttribute("worksheetList", ListWS);
//        response.sendRedirect("qr-code.jsp");
        request.getRequestDispatcher("qr-code.jsp").forward(request, response);
    }
}
