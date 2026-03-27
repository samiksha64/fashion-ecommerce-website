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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    		//it get the parameters from register form
    	
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");

        

        try {

        		//it will print message if password did not match
        	
        	// password mismatch
        	if(!password.equals(confirmPassword)){

        	    request.setAttribute("message","Passwords do not match!");
        	    request.getRequestDispatcher("register.jsp").forward(request,response);
        	    return;
        	}

            //Connection of database to Java application
            
        	Connection con = DBConnection.getConnection();

            
            //it will check if email already exists

            String checkQuery = "SELECT * FROM users WHERE email=?";
            PreparedStatement checkPs = con.prepareStatement(checkQuery);
            checkPs.setString(1, email);

            ResultSet rs = checkPs.executeQuery();

            // if yes then print this message
            
            if (rs.next()) {

            	request.setAttribute("message","Account already exists with this email!");
            	request.getRequestDispatcher("register.jsp").forward(request,response);

            } else {

            		//if not exists then it will register or insert the user

                String insertQuery = "INSERT INTO users(name,email,password,phone) VALUES(?,?,?,?)";

                PreparedStatement ps = con.prepareStatement(insertQuery);

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, phone);

                int result = ps.executeUpdate();

                //if register successful then print successful message
                
                if(result > 0){

                    request.setAttribute("msg","Registration Successful!");
                    request.getRequestDispatcher("register.jsp").forward(request,response);

                }else{

                    request.setAttribute("message","Something went wrong!");
                    request.getRequestDispatcher("register.jsp").forward(request,response);

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
