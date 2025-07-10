<%-- 
    Document   : donate
    Created on : Jun 26, 2025, 7:35:53 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Donate - MediAid</title>
  <link rel="stylesheet" href="style.css">
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

 

    .header {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 50px 20px;
  min-height: 100vh;
  box-sizing: border-box;
}


    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 30px;
      width: 100%;
      max-width: 850px;
    }

    .card {
  background-color: rgba(255, 255, 255, 0.95); /* putih tapi translucent sikit */
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
  width: 80%;
  max-width: 800px;
  text-align: left;
}


    label {
      font-weight: bold;
    }

    input, select {
      width: 100%;
      padding: 10px;
      margin: 8px 0 16px;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 1em;
    }

    button[type="submit"] {
  background: linear-gradient(to right, #43cea2, #185a9d);
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 30px;
  cursor: pointer;
  font-size: 1em;
  font-weight: bold;
  transition: background 0.3s ease;
}


    button[type="submit"]:hover {
  filter: brightness(1.1);
}


    footer {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
      font-size: 0.9em;
      margin-top: 40px;
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
  String user = (String) session.getAttribute("username");
  if (user == null) {
    response.sendRedirect("../login.jsp");
    return;
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
            <a href="../lDashboard.jsp" class="logout-btn">Logout</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>

<section class="header">
  <h1>💖 Make a Donation</h1>
  <div class="container">
    <div class="card">
      <form action="../DonationServlet" method="post">
        <label for="cause">Select Cause:</label>
        <select id="cause" name="cause" required>
  <option value="">-- Choose a cause --</option>
  <%
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MediAidDB", "app", "app");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT category, place FROM Manage");
        while (rs.next()) {
            String category = rs.getString("category");
            String place = rs.getString("place");
  %>
    <option value="<%= category %>"><%= category %> - <%= place %></option>
  <%
        }
        rs.close();
        st.close();
        con.close();
    } catch (Exception e) {
        out.println("<option disabled>Error loading causes</option>");
    }
  %>
</select>


        <label for="amount">Donation Amount (RM):</label>
        <input type="number" id="amount" name="amount" min="1" required>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>

        <label for="payment">Payment Method:</label>
        <select id="payment" name="payment" required>
          <option value="">-- Select Payment Method --</option>
          <option value="Online Banking">Online Banking</option>
          <option value="Credit Card">Credit Card</option>
          <option value="e-Wallet">e-Wallet</option>
        </select>

        <button type="submit">Donate Now</button>
      </form>
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
