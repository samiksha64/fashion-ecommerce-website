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

@WebServlet("/AddToWishlistServlet")
public class AddToWishlistServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = ((User) session.getAttribute("user")).getId();
        int productId = Integer.parseInt(request.getParameter("productId"));

        try {
        	Connection con = DBConnection.getConnection();
            System.out.println("connection");


            String sql = "INSERT IGNORE INTO wishlist(user_id, product_id) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();

            con.close();

            session.setAttribute("msg", "Product added to Wishlist successfully!");

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
