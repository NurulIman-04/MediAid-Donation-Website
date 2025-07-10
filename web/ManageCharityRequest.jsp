<%-- 
    Document   : ManageCharityRequest
    Created on : Jul 2, 2025, 1:16:31 PM
    Author     : Firdaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet" />
    <title>Manage Charity Requests</title>
    <style>
        body {
            font-family: 'Comic Neue', cursive;
            margin: 0;
            padding: 0;
            background: #e6f5f2;
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

.logout-btn {
    background-color:#ff4d4d;
    color: white;
    border-radius: 8px;
}
.logout-btn:hover {
    background-color: #cc0000;

}
        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #1d7874;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #29a19c;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .action-buttons a {
            text-decoration: none;
            background-color: #1d7874;
            color: white;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 8px;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .action-buttons a:hover {
            background-color: #145a58;
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
        <h1>Manage Charity</h1>
        <div class="card">
            <table>
                <tr>
                    <th>Category</th>
                    <th>Place</th>
                    <th>Date</th>
                    <th>Edit</th>
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

                        while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString("CATEGORY") %></td>
                    <td><%= rs.getString("PLACE") %></td>
                    <td><%= rs.getString("DONATION_DATE") %></td>
                    <td><a href="ManageCharityRequestEdit?id=<%= rs.getInt("ID") %>">Update</a></td>

                </tr>
                <%
                    }
                    } catch(SQLException e){
                        out.println("Error retrieving records: " + e.getMessage());
                    } finally {
                        if(rs != null) rs.close();
                        if(stmt != null) stmt.close();
                        if(conn != null) conn.close();
                    }
                %>
            </table>
        </div>

        <div class="action-buttons">
            <a href="ManageReqForm.jsp">Add New Charity Request</a>
            <a href="ManageReqDelete.jsp">Delete Request</a>
        </div>
    </div>
</section>

</body>
</html>
