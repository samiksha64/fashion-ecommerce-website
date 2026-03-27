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

import com.pojo.User;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");

        try {

        	Connection con = DBConnection.getConnection();


            PreparedStatement ps = con.prepareStatement(
                "SELECT c.product_id, c.quantity, p.price " +
                "FROM cart c JOIN product p ON c.product_id = p.product_id " +
                "WHERE c.user_id=?");

            ps.setInt(1, user.getId());
            ResultSet rs = ps.executeQuery();

            double subtotal = 0;

            
            List<Object[]> cartList = new ArrayList<>();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int qty = rs.getInt("quantity");
                double price = rs.getDouble("price");

                subtotal += price * qty;

                cartList.add(new Object[]{productId, qty, price});
            }

            double shipping = 10;
            double total = subtotal + shipping;

            PreparedStatement orderPs = con.prepareStatement(
                "INSERT INTO orders(user_id,total_amount,shipping_amount,payment_method,status) VALUES(?,?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);

            orderPs.setInt(1, user.getId());
            orderPs.setDouble(2, total);
            orderPs.setDouble(3, shipping);
            orderPs.setString(4, paymentMethod);
            orderPs.setString(5, "Confirmed");

            orderPs.executeUpdate();

            ResultSet keys = orderPs.getGeneratedKeys();
            int orderId = 0;

            if (keys.next()) {
                orderId = keys.getInt(1);
            }

            PreparedStatement itemPs = con.prepareStatement(
                "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(?,?,?,?)");

            for (Object[] item : cartList) {

                itemPs.setInt(1, orderId);
                itemPs.setInt(2, (int) item[0]); 
                itemPs.setInt(3, (int) item[1]); 
                itemPs.setDouble(4, (double) item[2]); 

                itemPs.addBatch();
            }

            itemPs.executeBatch();

            // 5️⃣ Clear cart
            PreparedStatement deletePs = con.prepareStatement(
                "DELETE FROM cart WHERE user_id=?");
            deletePs.setInt(1, user.getId());
            deletePs.executeUpdate();

            con.close();

            response.sendRedirect("ordersuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}