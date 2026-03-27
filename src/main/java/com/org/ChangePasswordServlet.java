package com.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pojo.User;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    private Connection getConnection() throws Exception {
    	Connection con = DBConnection.getConnection();
		return con;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String oldPass = request.getParameter("oldPassword");
        String newPass = request.getParameter("newPassword");

        try (Connection con = getConnection()) {

            if (user.getPassword().equals(oldPass)) {

                PreparedStatement ps = con.prepareStatement(
                        "UPDATE users SET password=? WHERE id=?");

                ps.setString(1, newPass);
                ps.setInt(2, user.getId());

                ps.executeUpdate();

                user.setPassword(newPass);
                session.setAttribute("user", user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("profile.jsp?msg=passwordUpdated");
    }
}