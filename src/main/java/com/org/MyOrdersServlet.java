package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.User;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        List<Map<String, Object>> orders = new ArrayList<>();

        try {
        	Connection con = DBConnection.getConnection();

            String sql = "SELECT oi.order_id, oi.quantity, oi.price, " +
                    "p.product_name, p.image, p.color, p.description, " +
                    "o.payment_method, o.status  " +   
                    "FROM orders o " +
                    "JOIN order_items oi ON o.order_id = oi.order_id " +
                    "JOIN product p ON oi.product_id = p.product_id " +
                    "WHERE o.user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getId());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();

                row.put("order_id", rs.getInt("order_id"));
                row.put("product_name", rs.getString("product_name"));
                row.put("image", rs.getString("image"));
                row.put("quantity", rs.getInt("quantity"));
                row.put("price", rs.getDouble("price"));
                row.put("color", rs.getString("color"));
                row.put("description", rs.getString("description"));
                row.put("payment_method", rs.getString("payment_method"));
                row.put("status", rs.getString("status")); 
                orders.add(row);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}