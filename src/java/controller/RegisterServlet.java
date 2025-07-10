/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    private final String dbURL = "jdbc:derby://localhost:1527/MediAidDB";
    private final String dbUser = "app";
    private final String dbPass = "app";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // Set default role if not provided
        if (role == null || role.trim().isEmpty()) {
            role = "donor";
        }

        Connection conn = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Check if user already exists
            String checkQuery = "SELECT * FROM users WHERE username = ?";
            psCheck = conn.prepareStatement(checkQuery);
            psCheck.setString(1, username);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                // User already exists
                response.sendRedirect("login.jsp?error=exists");
            } else {
                // Insert new user with all fields
                String insertQuery = "INSERT INTO users(username, password, fullname, email, role) VALUES (?, ?, ?, ?, ?)";
                psInsert = conn.prepareStatement(insertQuery);
                psInsert.setString(1, username);
                psInsert.setString(2, password);
                psInsert.setString(3, fullname);
                psInsert.setString(4, email);
                psInsert.setString(5, role);
                psInsert.executeUpdate();
                response.sendRedirect("login.jsp?success=1");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db_driver");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db");
        } finally {
            try {
                if (psCheck != null) psCheck.close();
                if (psInsert != null) psInsert.close();
                if (conn != null) conn.close();
            } catch (SQLException ignored) {
                // Log this if necessary, but often ignored for closing resources
            }
        }
    }
}