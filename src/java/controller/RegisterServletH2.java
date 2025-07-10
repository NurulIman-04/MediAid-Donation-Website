/*
 * H2 Database Version of RegisterServlet
 * Use this if you prefer H2 over Derby
 */
package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServletH2 extends HttpServlet {

    // H2 Database connection details
    private final String dbURL = "jdbc:h2:./MediAidDB";
    private final String dbUser = "sa";
    private final String dbPass = "";

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
            // H2 Database driver
            Class.forName("org.h2.Driver");
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