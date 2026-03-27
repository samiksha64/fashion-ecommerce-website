package com.org;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pojo.Product;

@WebServlet("/HomeProductsServlet")
public class HomeProductsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = new ArrayList<>();

        try {
        	Connection con = DBConnection.getConnection();

            String query = "SELECT p.*, c.category_name FROM product p " +
                           "JOIN categories c ON p.category_id=c.category_id " +
                           "LIMIT 10";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();

                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setCategoryName(rs.getString("category_name"));

                productList.add(p);
            }

            request.setAttribute("products", productList);
            

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}