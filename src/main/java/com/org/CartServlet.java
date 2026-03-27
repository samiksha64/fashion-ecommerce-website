package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.User;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        try {
        	Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT c.cart_id, c.quantity, c.size, p.product_name, p.price, p.image " +
                "FROM cart c JOIN product p ON c.product_id = p.product_id " +
                "WHERE c.user_id=?");

            ps.setInt(1, userId);

            request.setAttribute("cartData", ps.executeQuery());
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
