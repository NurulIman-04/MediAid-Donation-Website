<%-- 
    Document   : ManageReqForm
    Created on : Jul 3, 2025, 11:06:48 PM
    Author     : Firdaus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet"/>
    <title>Edit Charity</title>
    <style>
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #e6f5f2;
            margin: 0;
            padding: 0;
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
        .logo {
            height: 80px;
            max-width: 50%;
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
        .logout-btn {
            background-color: #ff4d4d;
            color: white;
            border-radius: 8px;
        }
        .logout-btn:hover {
            background-color: #cc0000;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #1d7874;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input[type="text"], input[type="date"], select {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #1d7874;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
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
            <h2>Edit Charity Request</h2>
            <form action="ManageCharityRequestEdit" method="post">
                <input type="hidden" name="id" value="${id}"/>

                <label>Category:</label>
                <select name="category" required>
                    <option value="">-- Select Category --</option>
                    <option value="medical" ${category == 'medical' ? 'selected' : ''}>Medical Supplies</option>
                    <option value="fund" ${category == 'fund' ? 'selected' : ''}>Emergency Fund</option>
                    <option value="patient" ${category == 'patient' ? 'selected' : ''}>Patient Support</option>
                </select>

                <label>Place:</label>
                <input type="text" name="place" value="${place}" required/>

                <label>Date (YYYY-MM-DD):</label>
                <input type="date" name="donationDate" value="${donationDate}" required/>

                <input type="submit" value="Update"/>
            </form>
        </div>
    </section>
</body>
</html>
