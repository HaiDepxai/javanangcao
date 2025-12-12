package controller;

import data.impl.ThuocImpl;
import model.Thuoc;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = {"/Search"})
public class SearchServlet extends HttpServlet {

    private ThuocImpl thuocDao = new ThuocImpl();

    // Hàm loại bỏ dấu tiếng Việt
    private String removeAccent(String s) {
        String temp = java.text.Normalizer.normalize(s, java.text.Normalizer.Form.NFD);
        return temp.replaceAll("\\p{M}", "");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy keyword từ form
        String keyword = request.getParameter("keyword");
        if (keyword == null) keyword = "";
        keyword = keyword.trim().toLowerCase();

        // Tách keyword thành từng từ
        String[] words = removeAccent(keyword).split("\\s+");

        // Lấy tất cả thuốc
        List<Thuoc> listThuoc = thuocDao.findAll();
        List<Thuoc> result = new ArrayList<>();

        for (Thuoc t : listThuoc) {
            if (t.getName() == null) continue;

            String name = removeAccent(t.getName().toLowerCase());
            boolean match = false;
            for (String w : words) {
                if (name.contains(w)) {
                    match = true;
                    break;
                }
            }
            if (match) result.add(t);
        }

        request.setAttribute("thuocList", result);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/inc/search-result.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
