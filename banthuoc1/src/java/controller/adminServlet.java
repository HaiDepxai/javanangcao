package controller;

import data.impl.ThuocImpl;
import data.impl.UserImpl;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Thuoc;

@WebServlet("/admin")
public class adminServlet extends HttpServlet {

    private UserImpl userDao = new UserImpl();
    private ThuocImpl thuocDao = new ThuocImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "dashboard";
        }

        switch (action) {
            case "dashboard":
                request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
                break;

            case "user-list":
                List<User> users = userDao.getAll();
                request.setAttribute("listUser", users);
                request.getRequestDispatcher("/inc/user-list.jsp").forward(request, response);
                break;

            case "user-new":
                request.removeAttribute("user");   // xóa nếu tồn tại trong request
                request.getSession().removeAttribute("user"); // xóa luôn trong session (nếu có)
                request.getRequestDispatcher("/inc/user-form.jsp").forward(request, response);
                break;

            case "user-edit":
                int id = Integer.parseInt(request.getParameter("id"));
                User u = userDao.getById(id);
                request.setAttribute("user", u);
                request.getRequestDispatcher("/inc/user-form.jsp").forward(request, response);
                break;

            case "user-delete":
                int idDel = Integer.parseInt(request.getParameter("id"));
                userDao.delete(idDel);
                response.sendRedirect("admin?action=user-list");
                break;
            case "thuoc-list":
                List<Thuoc> listThuoc = thuocDao.findAll();
                request.setAttribute("thuocList", listThuoc);
                request.getRequestDispatcher("/inc/thuoc-list.jsp").forward(request, response);
                break;

            case "thuoc-add":
                request.getRequestDispatcher("/inc/thuoc-form.jsp").forward(request, response);
                break;

            case "thuoc-edit":
                int idThuoc = Integer.parseInt(request.getParameter("id"));
                Thuoc t = thuocDao.find(idThuoc);
                request.setAttribute("thuoc", t);
                request.getRequestDispatcher("/inc/thuoc-form.jsp").forward(request, response);
                break;

            case "thuoc-delete":
                int idDelThuoc = Integer.parseInt(request.getParameter("id"));
                thuocDao.delete(idDelThuoc);
                response.sendRedirect("admin?action=thuoc-list");
                break;

            default:
                request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("user-insert".equals(action) || "user-update".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            if ("user-insert".equals(action)) {
                User u = new User();
                u.setName(name);
                u.setEmail(email);
                u.setPhone(phone);
                u.setPassword(password);
                u.setRole(role);
                userDao.insert(u);  // cần có insert(User u) trong UserImpl
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                User u = new User();
                u.setId(id);
                u.setName(name);
                u.setEmail(email);
                u.setPhone(phone);
                u.setPassword(password);
                u.setRole(role);
                userDao.update(u);
            }
            response.sendRedirect("admin?action=user-list");
        }
        // Quản lý thuốc
        if ("thuoc-insert".equals(action) || "thuoc-update".equals(action)) {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            boolean status = "on".equals(request.getParameter("status"));
            String idLoaiStr = request.getParameter("id_loai");
            String hansudungStr = request.getParameter("hansudung");

            double price = priceStr != null && !priceStr.isEmpty() ? Double.parseDouble(priceStr) : 0;
            int quantity = quantityStr != null && !quantityStr.isEmpty() ? Integer.parseInt(quantityStr) : 0;
            int idLoai = idLoaiStr != null && !idLoaiStr.isEmpty() ? Integer.parseInt(idLoaiStr) : 0;

            java.util.Date hansudung = null;
            try {
                if (hansudungStr != null && !hansudungStr.isEmpty()) {
                    hansudung = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(hansudungStr);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            Thuoc t = new Thuoc();
            t.setName(name);
            t.setImage(image);
            t.setPrice(price);
            t.setQuantity(quantity);
            t.setStatus(status);
            t.setId_loai(idLoai);
            t.setHansudung(hansudung);

            if ("thuoc-insert".equals(action)) {
                thuocDao.insert(t);
            } else {
                t.setId(Integer.parseInt(idStr));
                thuocDao.update(t);
            }
            response.sendRedirect("admin?action=thuoc-list");
        }
    }
}
