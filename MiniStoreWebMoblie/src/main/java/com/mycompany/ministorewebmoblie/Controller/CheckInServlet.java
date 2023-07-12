package com.mycompany.ministorewebmoblie.Controller;

import com.mycompany.ministorewebmoblie.DTO.SheetTimeSlotDTO;
import com.mycompany.ministorewebmoblie.Utils.JWTUtils;
import com.mycompany.ministorewebmoblie.Utils.MyUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.json.JSONObject;

public class CheckInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String idemp = (String) session.getAttribute("IdEmpapi");
        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String checkinTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        LocalTime checkTime = LocalTime.now();
        String check = "checkin";
//        if (checkTime.isAfter(LocalTime.MIDNIGHT.minusMinutes(5)) && checkTime.isBefore(LocalTime.MAX)) {
//            LocalDate nextDate = LocalDate.parse(date).plusDays(1);
//            date = nextDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
////            checkOutTime = LocalDateTime.of(previousDate, LocalTime.MAX).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        }
        // Check if employee already checked in
        String jsonResponse = MyUtils.sendGetRequest("http://localhost/swp/api/ms/fws?idemp=" + idemp + "&date=" + date);
        JSONObject json = null;
        try {
            json = new JSONObject(jsonResponse);
        } catch (Exception e) {
            // Handle JSON parsing error
            if (idemp == null || idemp.isEmpty()) {
                request.setAttribute("errorMessage", "Đã hết phiên làm việc hãy đăng nhập lại!!!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("errorMessage", "Hôm nay bạn không có ca làm");
                request.getRequestDispatcher("qr-code.jsp").forward(request, response);
                return;
            }
        }

        String jwt = json.getString("jwt");

        if (jwt.equals("Unauthorized")) {
            // Invalid user
            request.setAttribute("errorMessage", "Invalid credentials");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        Claims claims = JWTUtils.parseJWT(jwt);
        String checkInTimeapi = claims.get("TimeCheckIn", String.class);
        String sheet = claims.get("Sheet", String.class);
        boolean isValidCheckInTime = false;

        // Lấy danh sách SheetTimeSlotDTO từ API
        List<SheetTimeSlotDTO> sheetTimeSlots = MyUtils.getSheetTimeSlots(true);

        if (!sheetTimeSlots.isEmpty()) {
            for (SheetTimeSlotDTO slot : sheetTimeSlots) {
                LocalTime startTime = slot.getStartTime();
                LocalTime endTime = slot.getEndTime();
                LocalTime shiftStartTime = slot.getShiftStartTime();
                if (sheet.equals(slot.getSheet())) {
                    if (endTime.isBefore(startTime)) {
                        if (checkTime.isAfter(startTime) || checkTime.isBefore(endTime)) {
                            isValidCheckInTime = true;
                            if (checkTime.isAfter(startTime) && checkTime.isBefore(LocalTime.MAX)) {
//                                LocalDate nextDate = LocalDate.parse(date).plusDays(1);
//                                date = nextDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                                LocalDate dateLD = LocalDate.parse(date);
                                checkinTime = LocalDateTime.of(dateLD, shiftStartTime).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                            }
                            break;
                        }
                    } else {
                        if (checkTime.isAfter(startTime) && checkTime.isBefore(endTime)) {
                            isValidCheckInTime = true;
                            if (checkTime.isAfter(startTime) && checkTime.isBefore(shiftStartTime)) {
                                LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                                LocalDateTime checkinDateTime = LocalDateTime.of(localDate, shiftStartTime);
                                checkinTime = checkinDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                            }
                            break;
                        }
                    }
                }
            }
            if (!isValidCheckInTime) {
                request.setAttribute("errorMessage", "không phải giờ check in");
                request.getRequestDispatcher("qr-code.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("errorMessage", "không phải giờ check in");
            request.getRequestDispatcher("qr-code.jsp").forward(request, response);
            return;
        }

        if (isValidCheckInTime) {
            jwt = MyUtils.updateWorksheetQR(idemp, date, checkinTime, check);
            if (jwt!=null) {
                String qrCodeURL = MyUtils.generateQRCodeURLG(jwt);
                session.setAttribute("TimeCheckInapi", checkinTime);
                request.setAttribute("qrCodeURL", qrCodeURL);
            } else {
                request.setAttribute("errorMessage", "check in failed");
            }
        }

        request.getRequestDispatcher("ShowList").forward(request, response);
    }
}
