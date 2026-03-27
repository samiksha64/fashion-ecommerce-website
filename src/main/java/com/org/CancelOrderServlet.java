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

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
        	Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE orders SET status='Cancelled' WHERE order_id=?");

            ps.setInt(1, orderId);
            ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("orders.jsp?msg=orderCancelled");
    }
}