package admin.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageReqServletAdd")  // ✅ Penting untuk elak error 404
public class ManageReqServletAdd extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String category = request.getParameter("category");
        String place = request.getParameter("place");
        String date = request.getParameter("donationDate");

        try {
            // Connect ke database MediAidDB
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/MediAidDB", "app", "app");

            // Masukkan data ke dalam table Manage
            String query = "INSERT INTO Manage (CATEGORY, PLACE, DONATION_DATE) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, category);
            stmt.setString(2, place);
            stmt.setDate(3, java.sql.Date.valueOf(date));

            stmt.executeUpdate();

            conn.close();

            // Redirect balik ke page senarai
            response.sendRedirect("ManageCharityRequest.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("SQL Error: " + e.getMessage());
        }
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
        return "Servlet for adding new charity record into Manage table";
    }
}
