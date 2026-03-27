package com.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pojo.User;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private Connection getConnection() throws Exception {
    	Connection con = DBConnection.getConnection();
		return con;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // safety check
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        try (Connection con = getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE users SET name=?, phone=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setInt(3, user.getId());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // update session
                user.setName(name);
                user.setPhone(phone);
                session.setAttribute("user", user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("profile.jsp?msg=profileUpdated");
    }
}