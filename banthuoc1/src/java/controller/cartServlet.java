package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class cartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("./views/cart.jsp").forward(request, response);
    }

    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        } 
        Object user = session.getAttribute("user");
 if (user == null) {
    response.sendRedirect(request.getContextPath() + "/views/login.jsp");
    return;
}


        if ("add".equals(action)) {
            // Lấy dữ liệu từ form thêm
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");

            boolean found = false;
            for (Cart item : cart) {
                if (item.getId() == id) {
                    item.setQuantity(item.getQuantity() + quantity);
                    found = true;
                    break;
                }
            }
            if (!found) {
                cart.add(new Cart(id, name, price, quantity, image));
            }
        } else if ("remove".equals(action)) {
            // Xoá sản phẩm khỏi giỏ
            int id = Integer.parseInt(request.getParameter("id"));
            cart.removeIf(item -> item.getId() == id);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart"); // reload lại giỏ hàng
        response.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý giỏ hàng (thêm, xoá)";
    }
}
