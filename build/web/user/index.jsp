<%-- 
    Document   : dashboard
    Created on : Jun 26, 2025, 7:34:18 AM
    Author     : user
--%>

<%@ page import="java.sql.*" %>
<%@ page session="true" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MediAid - User Dashboard</title>
  <link rel="stylesheet" href="style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet" />

  <style>
   body {
  font-family: 'Comic Neue', cursive;
  margin: 0;
  padding: 0;
  background: linear-gradient(90deg, rgba(67, 206, 162, 0.15), rgba(24, 90, 157, 0.15));
  color: black;
  overflow-x: hidden;
}

/* ===================== NAVBAR ===================== */
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
  line-height: 1;
}

.nav-links ul {
  list-style: none;
  display: flex;
  gap: 20px;
  margin: 0;
  padding: 0;
  flex-wrap: wrap;
}

.nav-links ul li {
  position: relative;
}

.nav-links ul li a {
  text-decoration: none;
  color: #333;
  font-size: 1em;
  padding: 8px 12px;
  white-space: nowrap;
  transition: color 0.3s, background 0.3s;
}

.nav-links ul li a:hover,
.nav-links ul li a.active {
  color: #007BFF;
  background-color: #f0f8ff;
  border-radius: 5px;
  font-weight: bold;
}

/* ===================== DROPDOWN USER MENU ===================== */
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
  transition: background 0.3s;
  width: 50%;
  text-align: center;
  display: block;
  text-decoration: none;
}

.logout-btn:hover {
  background: #cc0000;
}

/* ===================== CONTENT ===================== */
.header {
  text-align: center;
  padding: 50px 20px;
  animation: fadeIn 1s ease;
}

.title {
  font-size: 36px;
  color: #007BFF;
}

.subtitle {
  font-size: 18px;
  color: #185a9d;
  margin-bottom: 30px;
}

.card {
  background-color: #ffffff;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
  max-width: 700px;
  width: 90%;
  text-align: left;
  margin: 30px auto;
}

.card h2 {
  margin-top: 0;
  text-align: center;
  color: #185a9d;
}

.summary {
  display: flex;
  justify-content: space-around;
  margin-top: 20px;
  flex-wrap: wrap;
  gap: 20px;
}

.summary-box {
  background-color: #e6f7f7;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  width: 45%;
  font-size: 1.1em;
  color: #222;
  font-weight: bold;
}

.btn-group {
  margin-top: 30px;
  text-align: center;
}

.btn-group a {
  display: inline-block;
  margin: 10px;
  padding: 12px 24px;
  background: linear-gradient(90deg, #43cea2 0%, #185a9d 100%);
  color: white;
  text-decoration: none;
  border-radius: 30px;
  transition: background 0.3s, transform 0.2s;
  font-weight: bold;
}

.btn-group a:hover {
  background: linear-gradient(90deg, #185a9d 0%, #43cea2 100%);
  transform: scale(1.05);
}

footer {
  text-align: center;
  padding: 20px;
  background-color: #f2f2f2;
  margin-top: 40px;
  font-size: 0.9em;
}

/* ===================== RESPONSIVE ===================== */
@media screen and (max-width: 768px) {
  .summary-box {
    width: 100%;
  }

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

  .btn-group a {
    width: 100%;
  }

  .logo {
    height: 40px;
  }

  .navbar-logo span {
    font-size: 1.2em;
  }
}

/* ===================== ANIMATION ===================== */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
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

  double totalAmount = 0;
  int donationCount = 0;

  try {
      Class.forName("org.apache.derby.jdbc.ClientDriver");
      Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/MediAidDB", "app", "app");
      String sql = "SELECT amount FROM donation WHERE username = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, username);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
          totalAmount += rs.getDouble("amount");
          donationCount++;
      }

      rs.close();
      ps.close();
      con.close();
  } catch (Exception e) {
      out.println("Error: " + e.getMessage());
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
  <h1>👋 Welcome, <%= username %>!</h1>
  <h2 class="title">MediAid</h2>
  <div class="subtitle"><i>Giving Hope. Healing Lives.</i></div>
  <p style="margin-top: 10px;">Thank you for your continued support and kindness. 🌟</p>

  <div class="card">
    <h2>🎉 Your Donation Summary</h2>
    <div class="summary">
      <div class="summary-box">
        <strong>Total Donations:</strong><br />
        RM <%= String.format("%.2f", totalAmount) %>
      </div>
      <div class="summary-box">
        <strong>Number of Donations:</strong><br />
        <%= donationCount %> time(s)
      </div>
    </div>

    <div class="btn-group">
      <a href="donate.jsp">💖 Make a New Donation</a>
      <a href="history.jsp">📜 View Donation History</a>
    </div>
  </div>
</section>

<footer>
  &copy; 2025 MediAid. All rights reserved. | <a href="#">Contact Us</a>
</footer>

      <script>
      function toggleMenu() {
  console.log("Toggled!");
  var nav = document.getElementById("navLinks");
  nav.classList.toggle("show");
}
</script>

</body>
</html>
