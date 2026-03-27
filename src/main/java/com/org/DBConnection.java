package com.org;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        try {
            String dbUrl = System.getenv("DB_URL");
            String dbUser = System.getenv("DB_USER");
            String dbPass = System.getenv("DB_PASSWORD");

            if (dbUrl == null) {
                dbUrl = "jdbc:mysql://localhost:3306/stylecartDb";
                dbUser = "root";
                dbPass = "root@0719";
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(dbUrl, dbUser, dbPass);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}