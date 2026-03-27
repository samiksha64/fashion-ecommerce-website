package com.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pojo.User;

@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {

    private Connection getConnection() throws Exception {
    
    	Connection con = DBConnection.getConnection();
		return con;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        try (Connection con = getConnection()) {

            // 🔍 Check if address already exists
            PreparedStatement check = con.prepareStatement(
                    "SELECT * FROM address WHERE user_id=?");

            check.setInt(1, user.getId());
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // ✅ UPDATE
                PreparedStatement ps = con.prepareStatement(
                        "UPDATE address SET full_address=?, city=?, state=?, pincode=? WHERE user_id=?");

                ps.setString(1, address);
                ps.setString(2, city);
                ps.setString(3, state);
                ps.setString(4, pincode);
                ps.setInt(5, user.getId());

                ps.executeUpdate();

            } else {
                // ✅ INSERT
                PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO address(user_id, full_address, city, state, pincode) VALUES(?,?,?,?,?)");

                ps.setInt(1, user.getId());
                ps.setString(2, address);
                ps.setString(3, city);
                ps.setString(4, state);
                ps.setString(5, pincode);

                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("profile.jsp?msg=addressUpdated");
    }
}