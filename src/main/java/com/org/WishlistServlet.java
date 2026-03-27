package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Product;
import com.pojo.User;

@WebServlet("/WishlistServlet")
public class WishlistServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ Correct way
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        List<Product> wishlist = new ArrayList<>();

        try {
        	Connection con = DBConnection.getConnection();

            String sql = "SELECT p.* FROM product p "
                       + "JOIN wishlist w ON p.product_id = w.product_id "
                       + "WHERE w.user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();

                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setColor(rs.getString("color"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));

                wishlist.add(p);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("wishlist", wishlist);
        request.getRequestDispatcher("wishlist.jsp").forward(request, response);
    }
}
