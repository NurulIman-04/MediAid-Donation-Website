package admin.com.controller;

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

@WebServlet("/ManageCharityRequestEdit")
public class ManageCharityRequestEdit extends HttpServlet {

    // GET: Retrieve data from database and forward to ManageReqEdit.jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/MediAidDB", "app", "app");

            String query = "SELECT * FROM Manage WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(id));

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", id);
                request.setAttribute("category", rs.getString("category"));
                request.setAttribute("place", rs.getString("place"));
                request.setAttribute("donationDate", rs.getDate("donationDate").toString());
            } else {
                request.setAttribute("error", "No record found with ID " + id);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }

        request.getRequestDispatcher("ManageReqEdit.jsp").forward(request, response);
    }

    // POST: Receive form data and update the database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");
        String category = request.getParameter("category");
        String place = request.getParameter("place");
        String date = request.getParameter("donationDate");

        try {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/MediAidDB", "app", "app");

            String query = "UPDATE Manage SET category=?, place=?, donationDate=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setString(1, category);
            stmt.setString(2, place);
            stmt.setDate(3, java.sql.Date.valueOf(date));
            stmt.setInt(4, Integer.parseInt(id));

            stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // After update, redirect back to list page
        response.sendRedirect("ManageCharityRequest.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Handles editing of charity requests";
    }
}
