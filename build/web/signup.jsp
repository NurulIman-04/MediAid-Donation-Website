<%--
    Document   : signup
    Created on : Jun 27, 2025, 12:52:07 AM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - MediAid</title>
</head>
<body>
    <h2>Sign Up for MediAid</h2>
    <form action="RegisterServlet" method="post">
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="Register">
        <span><input type="button" value="Back To Login" onclick="window.location.href='login.jsp';"/></span>
    </form>

    <%
        // Check for success parameter
        if ("1".equals(request.getParameter("success"))) {
    %>
        <p style="color:green;">Successfully registered! Please login.</p>
    <%
        }
        // Check for error parameters
        if ("exists".equals(request.getParameter("error"))) {
    %>
        <p style="color:red;">Username already exists. Please choose a different one.</p>
    <%
        } else if ("db".equals(request.getParameter("error"))) {
    %>
        <p style="color:red;">Database error. Please try again later.</p>
    <%
        } else if ("db_driver".equals(request.getParameter("error"))) {
    %>
        <p style="color:red;">A critical database driver error occurred. Please contact support.</p>
    <%
        }
    %>
</body>
</html>