package com.mycompany.ministorewebmoblie.Controller;

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

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("txtusername");
        String password = request.getParameter("txtpassword");

        try {
            String jsonResponse = MyUtils.sendGetRequest("http://localhost/swp/api/ms/facc?username=" + username + "&password=" + password);
            JSONObject json = new JSONObject(jsonResponse);
            String jwt = json.getString("jwt");

            if (jwt.equals("Unauthorized")) {
                request.setAttribute("errorMessage", "Invalid credentials");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            Claims claims = JWTUtils.parseJWT(jwt);
            String fullnameemapi = claims.get("FullNameEmp", String.class);
            String IdEmpapi = claims.get("IdEmp", String.class);
            String rolesapi = claims.get("Roles", String.class);
            String IsActiveapi = claims.get("IsActive", String.class);
            String TimeCheckinapi = claims.get("TimeCheckIn", String.class);
            String TimeCheckoutapi = claims.get("TimeCheckOut", String.class);
            
            if (!IsActiveapi.equals("True")) {
                request.setAttribute("errorMessage", "Tài khoản không hoạt động!!!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            if (!rolesapi.equals("3")) {
                request.setAttribute("errorMessage", "Chỉ có bảo vệ mới vào được trang này!!!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("fullnameemapi", fullnameemapi);
            session.setAttribute("TimeCheckInapi", TimeCheckinapi);
            session.setAttribute("TimeCheckOutapi", TimeCheckoutapi);
            session.setAttribute("IdEmpapi", IdEmpapi);
            request.getRequestDispatcher("ShowList").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không chính xác");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
