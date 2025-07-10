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

@WebServlet("/ManageReqServletDelete")
public class ManageReqServletDelete extends HttpServlet {

    // FIX: Use the correct database name
    private static final String dburl = "jdbc:derby://localhost:1527/MediAidDB";
    private static final String dbname = "app";
    private static final String dbpass = "app";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id_info = request.getParameter("id");
        int id = Integer.parseInt(id_info);

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver"); // Ensure Derby driver is loaded
            Connection conn = DriverManager.getConnection(dburl, dbname, dbpass);
            String sql = "DELETE FROM Manage WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            int rows = stmt.executeUpdate();
            conn.close();

            if (rows > 0) {
                response.sendRedirect("ManageReqDelete.jsp?message=Record+deleted+successfully");
            } else {
                response.sendRedirect("ManageReqDelete.jsp?message=No+record+found+with+that+ID");
            }

        } catch (Exception e) {
            //e.printStackTrace();
            response.getWriter().println("SQL Error: " + e.getMessage());
            response.sendRedirect("ManageReqDelete.jsp?message=Error+occurred+while+deleting");
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
        return "Short description";
    }
}
