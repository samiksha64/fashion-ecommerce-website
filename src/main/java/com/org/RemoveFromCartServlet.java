package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.User;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int cartId = Integer.parseInt(request.getParameter("cartId"));

        try {
        	Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM cart WHERE cart_id=? AND user_id=?");

            ps.setInt(1, cartId);
            ps.setInt(2, user.getId());

            ps.executeUpdate();

            session.setAttribute("msg", "Product Remove From cart successfully!");

            String referer = request.getHeader("referer");

            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect("index.jsp");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
