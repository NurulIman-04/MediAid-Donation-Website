/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Donation;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class DonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        if (username == null) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String cause = request.getParameter("cause");
        String amountStr = request.getParameter("amount");
        String date = request.getParameter("date");
        String payment = request.getParameter("payment");

        try {
            double amount = Double.parseDouble(amountStr);

            Donation donation = new Donation();
            donation.setUsername(username);
            donation.setCause(cause);
            donation.setAmount(amount);
            donation.setDate(date);
            donation.setPaymentMethod(payment);

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/MediAidDB", "app", "app");

            String sql = "INSERT INTO DONATION (username, amount, cause, payment_method, donation_date) VALUES (?, ?, ?, ?, CURRENT_DATE)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, donation.getUsername()); // donor_name
            ps.setDouble(2, donation.getAmount());   // amount
            ps.setString(3, donation.getCause());    // donation_type
            ps.setString(4, donation.getPaymentMethod()); // message (using payment method as message)
            // created_at is set to CURRENT_TIMESTAMP by SQL

            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("user/history.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
