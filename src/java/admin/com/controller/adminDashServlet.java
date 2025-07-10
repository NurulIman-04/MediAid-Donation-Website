package admin.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminDashServlet extends HttpServlet {

    private static final String dburl = "jdbc:derby://localhost:1527/MediAidDB";
    private static final String dbname = "app";
    private static final String dbpass = "app";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int totalCharity = 0;
        double totalDonations = 0.0;
        int totalMembers = 0;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(dburl, dbname, dbpass);

            Statement stmt = conn.createStatement();

            // Count charities (if you have a 'charity' table)
            try {
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM charity");
                if (rs.next()) {
                    totalCharity = rs.getInt(1);
                }
                rs.close();
            } catch (Exception e) {
                // If no charity table, ignore or log
            }

            // Sum donations (assuming a 'donation' table)
            try {
                ResultSet rs = stmt.executeQuery("SELECT SUM(amount) FROM donation");
                if (rs.next()) {
                    totalDonations = rs.getDouble(1);
                }
                rs.close();
            } catch (Exception e) {
                // If no donation table, ignore or log
            }

            // Count members (assuming a 'users' table)
            try {
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
                if (rs.next()) {
                    totalMembers = rs.getInt(1);
                }
                rs.close();
            } catch (Exception e) {
                // If no users table, ignore or log
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "SQL Error: " + e.getMessage());
        }

        // Set attributes for the JSP
        request.setAttribute("totalCharity", totalCharity);
        request.setAttribute("totalDonations", totalDonations);
        request.setAttribute("totalMembers", totalMembers);

        // Forward to the admin dashboard JSP
        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin dashboard servlet";
    }
}