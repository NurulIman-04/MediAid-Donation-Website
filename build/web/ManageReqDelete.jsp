<%-- 
    Document   : ManageReqDelete
    Created on : Jul 6, 2025, 2:15:58 PM
    Author     : Firdaus
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet" />
    <title>Delete Record</title>
    <style>
        body {
            font-family: 'Comic Neue', cursive;
            margin: 0;
            padding: 0;
            background: #f0f9f7;
            color: #333;
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
  max-width: 50%;
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

.logout-btn {
    background-color:#ff4d4d;
    color: white;
    border-radius: 8px;
}
.logout-btn:hover {
    background-color: #cc0000;

}
        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 30px;
        }
        h2 {
            color: #1d7874;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }
        table th {
            background-color: #1d7874;
            color: white;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #1d7874;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #145a58;
        }
        .message {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <section class="header">
        <nav>
            <img src="Image/MediAidLogo.png" class="logo" alt="MediAid Logo" style="width: 150px;" />
            <div class="nav-links">
                <ul>
                    <li><a href="AdminDashboard.jsp">HOME</a></li>
                    <li><a href="ManageCharityRequest.jsp">LIST</a></li>
                    <li><a href="ViewReports.jsp">REPORT</a></li>
                    <li><a href="ViewFeedback.jsp">FEEDBACK</a></li>
                    <li><a href="Dashboard.jsp" class="logout-btn">LOGOUT</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h2>Delete Charity</h2>
            <div class="card">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Category</th>
                        <th>Place</th>
                        <th>Date</th>
                    </tr>
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        try {
                            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/MediAidDB","app","app");
                            String query = "SELECT * FROM Manage";
                            stmt = conn.prepareStatement(query);
                            rs = stmt.executeQuery();
                            while(rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("CATEGORY") %></td>
                        <td><%= rs.getString("PLACE") %></td>
                        <td><%= rs.getString("DONATION_DATE") %></td>
                    </tr>
                    <%
                            }
                        } catch(SQLException e) {
                            out.println("Error retrieving records " + e.getMessage());
                        } finally {
                            if(rs != null) rs.close();
                            if(stmt != null) stmt.close();
                            if(conn != null) conn.close();
                        }
                    %>
                </table>
            </div>

            <div class="card">
                <h2>Delete Record Charity</h2>
                <form action="ManageReqServletDelete" method="post">
                    <label for="id">Enter ID to Delete:</label>
                    <input type="text" name="id" required>
                    <input type="submit" value="Delete">
                </form>
            </div>

            <%
                String message = request.getParameter("message");
                if (message != null) {
            %>
            <p class="message"><%= message %></p>
            <%
                }
            %>
        </div>
    </section>
</body>
</html>
