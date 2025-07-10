/*
 * H2 Database Version of LoginServlet
 * Use this if you prefer H2 over Derby
 */
package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

public class LoginServletH2 extends HttpServlet {
    // H2 Database connection details
    private final String dbURL = "jdbc:h2:./MediAidDB"; 
    private final String dbUser = "sa";
    private final String dbPass = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // H2 Database driver
            Class.forName("org.h2.Driver");
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
                    response.sendRedirect("Dashboard.jsp");
                } else {
                    response.sendRedirect("user/index.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db_driver");
        } catch (SQLException e) {
            e.printStackTrace();
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