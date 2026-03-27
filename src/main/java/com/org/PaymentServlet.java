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

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
        	Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT product_name, price, quantity FROM cart " +
                "JOIN product ON cart.product_id = product.product_id " +
                "WHERE user_id=?");

            ps.setInt(1, user.getId());

            request.setAttribute("paymentData", ps.executeQuery());
            request.getRequestDispatcher("payment.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
