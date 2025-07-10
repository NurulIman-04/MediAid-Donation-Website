<%-- 
    Document   : history
    Created on : Jun 26, 2025, 7:36:04 AM
    Author     : user
--%>

<%@ page import="java.util.*, java.sql.*, model.Donation" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Donation History - MediAid</title>
  <link rel="stylesheet" href="style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Comic Neue', cursive;
      margin: 0;
      padding: 0;
      background: linear-gradient(90deg, rgba(67, 206, 162, 0.15), rgba(24, 90, 157, 0.15));
      color: black;
      overflow-x: hidden;
    }

    nav {
      position: sticky;
      top: 0;
      width: 100%;
      background: linear-gradient(90deg, rgba(67, 206, 162, 0.2), rgba(24, 90, 157, 0.2));
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      padding: 10px 30px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      z-index: 999;
      box-sizing: border-box;
    }

    .navbar-logo {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .logo {
      height: 80px;
      max-width: 100%;
    }

    .navbar-logo span {
      font-size: 1.5em;
      color: #007BFF;
      font-weight: bold;
    }

    .nav-links ul {
      list-style: none;
      display: flex;
      gap: 20px;
      margin: 0;
      padding: 0;
      flex-wrap: wrap;
    }

    .nav-links ul li a {
      text-decoration: none;
      color: #333;
      font-size: 1em;
      padding: 8px 12px;
      transition: color 0.3s, background 0.3s;
    }

    .nav-links ul li a:hover,
    .nav-links ul li a.active {
      color: #007BFF;
      background-color: #f0f8ff;
      border-radius: 5px;
      font-weight: bold;
    }

    .menu-toggle {
      font-size: 1.2em;
      cursor: pointer;
      color: #007BFF;
    }

    .dropdown {
      display: none;
      position: absolute;
      top: 40px;
      right: 0;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
      padding: 15px;
      z-index: 9999;
      min-width: 200px;
      font-size: 0.95em;
      text-align: left;
    }

    .dropdown p {
      margin: 5px 0;
      color: #333;
    }

    .menu-toggle:hover .dropdown,
    .menu-toggle.active .dropdown {
      display: block;
    }

    .logout-btn {
      padding: 8px 10px;
      background: #ff4d4d;
      color: white;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      font-weight: bold;
      width: 50%;
      text-align: center;
      display: block;
      text-decoration: none;
    }

    .logout-btn:hover {
      background: #cc0000;
    }

    h1 {
      margin-bottom: 20px;
      color: #2d4373;
    }

    .history-table {
      background-color: white;
      border-collapse: collapse;
      width: 90%;
      max-width: 800px;
      margin-top: 20px;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    .history-table th, .history-table td {
      border: 1px solid #ccc;
      padding: 12px;
      text-align: center;
    }

    .history-table th {
      background-color: #3a74d8;
      color: white;
    }

    .success-message {
      background-color: #d4edda;
      color: #155724;
      padding: 10px 20px;
      border-radius: 8px;
      margin: 15px auto;
      font-weight: bold;
      animation: fadeIn 1s ease-in-out;
      width: fit-content;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    footer {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
      margin-top: 40px;
      font-size: 0.9em;
    }

    .center-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 30px 15px;
      text-align: center;
    }

    @media screen and (max-width: 768px) {
      nav {
        flex-direction: column;
        align-items: flex-start;
        padding: 10px 20px;
      }

      .nav-links ul {
        flex-direction: column;
        gap: 10px;
        width: 100%;
      }

      .logo {
        height: 40px;
      }

      .navbar-logo span {
        font-size: 1.2em;
      }
    }
  </style>
</head>
<body>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
      response.sendRedirect("../login.jsp");
      return;
  }

  List<Donation> list = new ArrayList<Donation>();

  try {
      Class.forName("org.apache.derby.jdbc.ClientDriver");
      Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/MediAidDB", "app", "app");

      String sql = "SELECT * FROM DONATION WHERE username = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, username);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
          Donation d = new Donation();
          d.setUsername(rs.getString("username"));
          d.setCause(rs.getString("cause"));
          d.setAmount(rs.getDouble("amount"));
          d.setDate(rs.getDate("donation_date").toString());
          d.setPaymentMethod(rs.getString("payment_method"));
          list.add(d);
      }

      rs.close();
      ps.close();
      con.close();

  } catch (Exception e) {
      out.println("Error: " + e.getMessage());
  }

  double totalAmount = 0;
  int donationCount = list.size();
  for (Donation d : list) {
      totalAmount += d.getAmount();
  }
%>


  <nav>
    <div class="navbar-logo">
      <img src="../images/MediAidLogo.png" class="logo" alt="MediAid Logo" />
      <span>MediAid</span>
    </div>
    <div class="nav-links">
      <ul>
        <li><a href="index.jsp">HOME</a></li>
        <li><a href="donate.jsp">DONATE</a></li>
        <li><a href="history.jsp">HISTORY</a></li>
        <li class="menu-toggle">&#9776;
          <div class="dropdown">
            <p><strong><%= session.getAttribute("fullname") %></strong></p>
            <p><%= session.getAttribute("email") %></p>
            <a href="../Dashboard.jsp" class="logout-btn">Logout</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
            
            <section class="header">
<%
  String success = request.getParameter("success");
  if ("1".equals(success)) {
%>
  <div class="success-message">
    Thank you! Your donation was successfully recorded.
  </div>
<%
  }
%>


  <div class="center-container">
    <h1>Your Donation History</h1>

    <div style="background-color:#ffff; ; padding:15px; border-radius:10px; width:90%; max-width:800px; font-size:1.1em;">
      <p><strong>Total Donations:</strong> RM <%= String.format("%.2f", totalAmount) %></p>
      <p><strong>Number of Donations:</strong> <%= donationCount %> time(s)</p>
    </div>
    <br>

    <table class="history-table">
      <thead>
        <tr>
          <th>No.</th>
          <th>Date</th>
          <th>Cause</th>
          <th>Amount (RM)</th>
          <th>Payment Method</th>
        </tr>
      </thead>
      <tbody>
        <%
          int no = 1;
          for (Donation d : list) {
        %>
          <tr>
            <td><%= no++ %></td>
            <td><%= d.getDate() %></td>
            <td><%= d.getCause() %></td>
            <td><%= d.getAmount() %></td>
            <td><%= d.getPaymentMethod() %></td>
          </tr>
        <%
          }
          if (list.isEmpty()) {
        %>
          <tr>
            <td colspan="5">No donation records found.</td>
          </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>
</section>

<footer>
  &copy; 2025 MediAid. All rights reserved. | <a href="#">Contact Us</a>
</footer>

<script>
  function toggleMenu() {
    var nav = document.getElementById("navLinks");
    nav.classList.toggle("show");
  }
</script>
</body>
</html>
