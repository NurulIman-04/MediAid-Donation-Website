package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

public class LoginServlet extends HttpServlet {
    private final String dbURL = "jdbc:derby://localhost:1527/MediAidDB"; 
    private final String dbUser = "app";
    private final String dbPass = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("LoginServlet doPost called!");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // New role parameter

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Updated query to include role check if role is provided
            String sql;
            if (role != null && !role.trim().isEmpty()) {
                sql = "SELECT * FROM USERS WHERE USERNAME=? AND PASSWORD=? AND ROLE=?";
            } else {
                sql = "SELECT * FROM USERS WHERE USERNAME=? AND PASSWORD=?";
            }
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            if (role != null && !role.trim().isEmpty()) {
                stmt.setString(3, role);
            }
            rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", rs.getString("role") != null ? rs.getString("role") : role);
                
                // Store additional user information if available
                if (rs.getString("fullname") != null) {
                    session.setAttribute("fullname", rs.getString("fullname"));
                }
                if (rs.getString("email") != null) {
                    session.setAttribute("email", rs.getString("email"));
                }
                
                // Redirect based on role
                if ("admin".equals(role)) {
                    response.sendRedirect("AdminDashboard.jsp"); // Corrected: Admin dashboard
                } else {
                    response.sendRedirect("user/index.jsp"); // User dashboard
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db_driver"); // Specific error for driver not found
        } catch (SQLException e) {
            e.printStackTrace(); // Still logs in console
            response.sendRedirect("login.jsp?error=db");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ignored) {
                // Log this if necessary
            }
        }
    }
}