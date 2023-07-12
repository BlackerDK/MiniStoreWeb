
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServlet;

//@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        // Gửi yêu cầu POST để kiểm tra thông tin đăng nhập từ Web API
//        URL url = new URL("http://localhost/T_swp/api/ms/lacc");
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("POST");
//        conn.setRequestProperty("Content-Type", "application/json");
//        conn.setDoOutput(true);
//
//        // Tạo đối tượng JSON chứa thông tin đăng nhập
//        JSONObject loginJson = new JSONObject();
//        loginJson.put("username", username);
//        loginJson.put("password", password);
//
//        // Ghi đối tượng JSON vào dữ liệu yêu cầu
//        OutputStream outputStream = conn.getOutputStream();
//        outputStream.write(loginJson.toString().getBytes());
//        outputStream.flush();
//
//        if (conn.getResponseCode() != 200) {
//            throw new RuntimeException("Failed: HTTP error code: " + conn.getResponseCode());
//        }
//
//        // Đọc phản hồi từ Web API
//        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//        StringBuilder responseBuilder = new StringBuilder();
//        String output;
//        while ((output = br.readLine()) != null) {
//            responseBuilder.append(output);
//        }
//
//        // Kiểm tra phản hồi từ Web API
//        JSONObject responseJson = new JSONObject(responseBuilder.toString());
//        boolean loginSuccess = responseJson.getBoolean("loginSuccess");
//
//        // Kiểm tra thông tin đăng nhập thành công
//        if (loginSuccess) {
//            // Chuyển hướng sang trang mới (QR Code)
//            response.sendRedirect("qr-code.jsp");
//        } else {
//            // Thông báo lỗi đăng nhập
//            response.getWriter().println("Invalid username or password");
//        }
//
//        conn.disconnect();
//    }
}
