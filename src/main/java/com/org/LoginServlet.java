package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {

			 
			Connection con = DBConnection.getConnection();
            

			String sql = "select * from users where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				 HttpSession session = request.getSession();

	                User user = new User();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setPhone(rs.getString("phone"));

	                session.setAttribute("user", user);

				request.setAttribute("msg", "Login Successful!");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} else {

				request.setAttribute("message", "No matching credentials or account found!");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
