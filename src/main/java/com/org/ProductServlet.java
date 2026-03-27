package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pojo.Product;


@WebServlet("/shop")
public class ProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String category = request.getParameter("category");
		String color = request.getParameter("color");
		String sort = request.getParameter("sort");

		List<Product> productList = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();

			String query = "SELECT p.*, c.category_name FROM product p JOIN categories c ON p.category_id=c.category_id WHERE 1=1";

			if (category != null && !category.equals("")) {
			    query += " AND c.category_name=?";
			}

			if (color != null && !color.equals("")) {
			    query += " AND p.color=?";
			}

			if (sort != null) {
			    if (sort.equals("low")) {
			        query += " ORDER BY p.price ASC";
			    } else if (sort.equals("high")) {
			        query += " ORDER BY p.price DESC";
			    }
			}
			PreparedStatement ps = con.prepareStatement(query);

			int i = 1;

			if (category != null && !category.equals("")) {
				ps.setString(i++, category);
			}

			if (color != null && !color.equals("")) {
				ps.setString(i++, color);
			}

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Product p = new Product();

				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setPrice(rs.getDouble("price"));
				p.setImage(rs.getString("image"));
				p.setColor(rs.getString("color"));
				p.setCategoryName(rs.getString("category_name"));

				productList.add(p);
			}

			request.setAttribute("products", productList);

			RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
