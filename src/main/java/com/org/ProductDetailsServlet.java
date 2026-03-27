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

import com.pojo.Product;

@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Product product = null;

        try {

            
        	Connection con = DBConnection.getConnection();

            String query = "SELECT p.*, c.category_name FROM product p "
                    + "JOIN categories c ON p.category_id=c.category_id "
                    + "WHERE p.product_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                product = new Product();

                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setColor(rs.getString("color"));
                product.setImage(rs.getString("image"));
                product.setCategoryName(rs.getString("category_name"));
                product.setDescription(rs.getString("description"));
                product.setDetails(rs.getString("details"));
                product.setPatternType(rs.getString("pattern_Type"));

            }
            
         // Get sizes
            ps = con.prepareStatement("SELECT * FROM product_size WHERE product_id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();

            List<String> sizeList = new ArrayList<>();

            while (rs.next()) {
                sizeList.add(rs.getString("size"));
            }
            
            request.setAttribute("product", product);
            request.setAttribute("sizes", sizeList);
            request.getRequestDispatcher("product-details.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
       
    }
}