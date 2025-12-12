package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "chatboxServlet", urlPatterns = {"/chatbox"})
public class chatboxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        String msg = request.getParameter("message");
        String reply;

        if (msg == null || msg.trim().isEmpty()) {
            reply = "Xin chào! Bạn có thể hỏi về giá, khuyến mãi, giao hàng hoặc tình trạng tồn kho.";
        } else {
            String s = msg.toLowerCase();

            if (s.contains("giá") || s.contains("price")) {
                reply = "Bạn vui lòng cho biết mã sản phẩm để mình báo giá chính xác nhé.";
            } else if (s.contains("khuyến mãi") || s.contains("giảm giá") || s.contains("promotion")) {
                reply = "Đang có mã WELCOME10 giảm 10% cho đơn đầu tiên trong tuần này.";
            } else if (s.contains("giao hàng") || s.contains("ship") || s.contains("vận chuyển")) {
                reply = "Bọn mình giao hàng toàn quốc 2–5 ngày, miễn phí cho đơn từ 500 nghìn.";
            } else if (s.contains("bảo hành") || s.contains("đổi trả")) {
                reply = "Sản phẩm được bảo hành 12 tháng, đổi mới 7 ngày nếu lỗi nhà sản xuất.";
            } else if (s.contains("còn hàng") || s.contains("tồn kho") || s.contains("stock")) {
                reply = "Bạn cho mình biết mẫu cần kiểm tra, mình sẽ xác nhận tồn kho ngay.";
            } else {
                reply = "Mình đã nhận: \"" + msg + "\". Bạn cần hỏi thêm thông tin nào cụ thể không?";
            }
        }

        response.getWriter().write(reply);
    }
}
