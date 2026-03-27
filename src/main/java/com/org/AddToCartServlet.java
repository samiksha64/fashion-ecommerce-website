package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pojo.User;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        int productId = Integer.parseInt(request.getParameter("productId"));
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
        	Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO cart(user_id, product_id, size, quantity) VALUES(?,?,?,?)");

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setString(3, size);
            ps.setInt(4, quantity);

            ps.executeUpdate();

            session.setAttribute("msg", "Product added to cart successfully!");

            String referer = request.getHeader("referer");

            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
