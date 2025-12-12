/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "chatboxServlet", urlPatterns = {"/chatbox"})
public class chatboxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet chatboxServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet chatboxServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
