<%-- 
    Document   : ManageReqForm
    Created on : Jul 3, 2025, 11:06:48 PM
    Author     : Firdaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet" />
    <title>Add New Charity</title>
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
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #1d7874;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        select, input[type="text"], input[type="date"] {
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
        <h2>Add Charity</h2>
        <form action="ManageReqServletAdd" method="post">
            <label for="category">Category:</label>
            <select name="category" id="category" required>
                <option value="">-- Select Category --</option>
                <option value="medical">Medical Supplies</option>
                <option value="fund">Emergency Fund</option>
                <option value="patient">Patient Support</option>
            </select>

            <label for="place">Place:</label>
            <input type="text" name="place" id="place" required>

            <label for="donationDate">Date (YYYY-MM-DD):</label>
            <input type="date" name="donationDate" id="donationDate" required>

            <input type="submit" value="Add">
        </form>
    </div>
</section>
</body>
</html>
