package controller;

import data.dao.ThuocDao;
import data.impl.ThuocImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Thuoc;

import java.io.IOException;

@WebServlet(name = "muangayServlet", urlPatterns = {"/muangay"})
public class muangayServlet extends HttpServlet {

    private final ThuocDao thuocDao = new ThuocImpl(); // DAO kết nối CSDL

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    // Kiểm tra đăng nhập
    Object user = request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");  // Chuyển đến trang login nếu chưa đăng nhập
        return;
    }

    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    if (idStr == null) {
        response.sendRedirect("home");
        return;
    }

    try {
        int id = Integer.parseInt(idStr);
        Thuoc thuoc = thuocDao.find(id);

        if (thuoc == null) {
            response.sendRedirect("home");
            return;
        }

        request.setAttribute("thuoc", thuoc);
        request.setAttribute("quantity", 1);
        request.getRequestDispatcher("/views/muangay.jsp").forward(request, response);

    } catch (NumberFormatException e) {
        response.sendRedirect("home");
    }
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Kiểm tra đăng nhập
    Object user = request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }

    request.setCharacterEncoding("UTF-8");

    try {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String bank = request.getParameter("bank");

        Thuoc thuoc = thuocDao.find(id);

        // TODO: Lưu đơn hàng vào DB

        request.setAttribute("message", "🎉 Đặt hàng thành công!");
        request.setAttribute("thuoc", thuoc);
        request.setAttribute("quantity", quantity);
        request.getRequestDispatcher("/views/thanhtoanthanhcong.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("home");
    }
}


    @Override
    public String getServletInfo() {
        return "Servlet xử lý chức năng mua ngay";
    }
}
