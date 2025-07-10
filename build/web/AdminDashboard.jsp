<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.* , admin.com.model.AdminDashboard" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link href="https://fonts.googleapis.com" />
    <link href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet" />
    <title>Admin Dashboard</title>
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

.dashboard-container h1 {
    text-align: center;
}

.dashboard-features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin: 40px auto;
            max-width: 1000px;
        }
        .feature-card {
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            overflow: auto;
        }
        .feature-card h3 {
            margin-bottom: 10px;
        }
        .feature-card a{
            text-decoration: none;
            color: black;
        }
        .card {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 12px;
    margin: 20px 0;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    text-align: center;
}
.card h2 {
    color: #1d7874;
}

.feature-card a {
    display: inline-block;
    text-decoration: none;
    color: white;
    background-color: #29a19c;
    padding: 10px 20px;
    margin: 10px 0;
    border-radius: 6px;
    transition: background-color 0.3s;
}
.feature-card a:hover {
    background-color: #167c76;
}

.info-section {
    background-color: #c7ede7;
    padding: 30px;
    margin-top: 40px;
    border-radius: 12px;
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

    <div class="dashboard-container">
        <header>
            <h1>Charity Dashboard</h1>
        </header>

        <div class="card-container-dash">
            <%
                int totalCharity = 0;
                double totalDonations = 0.0;
                int totalMembers = 0;

                Connection conn = null;
                PreparedStatement psCharity = null;
                PreparedStatement psDonation = null;
                PreparedStatement psMembers = null;
                ResultSet rs1 = null, rs2 = null, rs3 = null;
                try {
                    conn = AdminDashboard.getConnection();

                    // Count charities (adjust table name if needed)
                    try {
                        psCharity = conn.prepareStatement("SELECT COUNT(*) FROM MANAGE");
                        rs1 = psCharity.executeQuery();
                        if (rs1.next()) {
                            totalCharity = rs1.getInt(1);
                        }
                    } catch (Exception e) {
                        // If no charity table, ignore or log
                    } finally {
                        if (rs1 != null) try { rs1.close(); } catch (Exception e) {}
                        if (psCharity != null) try { psCharity.close(); } catch (Exception e) {}
                    }

                    // Sum donations
                    try {
                        psDonation = conn.prepareStatement("SELECT SUM(amount) FROM donation");
                        rs2 = psDonation.executeQuery();
                        if (rs2.next()) {
                            totalDonations = rs2.getDouble(1);
                        }
                    } catch (Exception e) {
                        // If no donations table, ignore or log
                    } finally {
                        if (rs2 != null) try { rs2.close(); } catch (Exception e) {}
                        if (psDonation != null) try { psDonation.close(); } catch (Exception e) {}
                    }

                    // Count members
                    try {
                        psMembers = conn.prepareStatement("SELECT COUNT(*) FROM users");
                        rs3 = psMembers.executeQuery();
                        if (rs3.next()) {
                            totalMembers = rs3.getInt(1);
                        }
                    } catch (Exception e) {
                        // If no users table, ignore or log
                    } finally {
                        if (rs3 != null) try { rs3.close(); } catch (Exception e) {}
                        if (psMembers != null) try { psMembers.close(); } catch (Exception e) {}
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("SQL Error: " + e.getMessage());
                } finally {
                    if (conn != null) try { conn.close(); } catch (Exception e) {}
                }
            %>

            <div class="card">
                <h2>Total Charity</h2>
                <p><%= totalCharity %></p>
            </div>

            <div class="card">
                <h2>Total Donations</h2>
                <p>RM <%= String.format("%.2f", totalDonations) %></p>
            </div>
        </div>
            
        <div class="card">
            <h2>Total Members</h2>
            <p><%= totalMembers %></p>
        </div>

        <!-- Dashboard Features Section -->
        <div class="dashboard-features">
            <div class="feature-card">
                <a href="ManageCharityRequest.jsp"><h3>Charity Management</h3></a><br><br>
                <a href="ManageReqForm.jsp"><h3>Add the Charity</h3></a><br><br>
                <a href="ManageReqDelete.jsp"><h3>Delete Charity</h3></a><br><br>
            </div>
            <%
                // Step 1: Prepare data for pie chart
                Map<String, Double> yearlyDonations = new LinkedHashMap<String, Double>();
                Connection conn2 = null;
                PreparedStatement psYearly = null;
                ResultSet rsYearly = null;
                try {
                    conn2 = AdminDashboard.getConnection();
                    // Derby-compatible: extract year as string from created_at
                    String sql = "SELECT SUBSTR(CAST(donation_date AS CHAR(10)), 1, 4) AS yr, SUM(amount) AS total " +
                                 "FROM donation GROUP BY SUBSTR(CAST(donation_date AS CHAR(10)), 1, 4) " +
                                 "ORDER BY SUBSTR(CAST(donation_date AS CHAR(10)), 1, 4)";
                    psYearly = conn2.prepareStatement(sql);
                    rsYearly = psYearly.executeQuery();
                    while (rsYearly.next()) {
                        String year = rsYearly.getString("yr");
                        double total = rsYearly.getDouble("total");
                        yearlyDonations.put(year, total);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("SQL Error: " + e.getMessage());
                } finally {
                    if (rsYearly != null) try { rsYearly.close(); } catch (Exception e) {}
                    if (psYearly != null) try { psYearly.close(); } catch (Exception e) {}
                    if (conn2 != null) try { conn2.close(); } catch (Exception e) {}
                }
            %>

            <!-- Step 2: Load Google Charts and Render Pie Chart -->
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script>
                google.charts.load("current", {
                    packages: ["corechart"]
                });
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Year', 'Donation Amount'],
                        <% for (Map.Entry<String, Double> entry : yearlyDonations.entrySet()) { %>
                            ['<%= entry.getKey() %>', <%= entry.getValue() %>],
                        <% } %>
                    ]);

                    var options = {
                        title: 'Annual Donation Distribution',
                        is3D: true,
                        width: 600,
                        height: 400
                    };

                    var chart = new google.visualization.PieChart(document.getElementById('donationPieChart'));
                    chart.draw(data, options);
                }
            </script>

            <!-- Step 3: Add container for chart -->
            <div class="feature-card">
                <div style="text-align:center; margin: 50px 0;">
                    <h2>Donation Breakdown by Year</h2>
                    <div id="donationPieChart" style="margin: 0 auto;"></div>
                </div>
            </div>
            
            <div class="feature-card">
                <h3>News</h3>
                <hr>
                <h3>Stories</h3>
                <hr>
                <h3>Educational</h3>
                <hr>
            </div>
        </div>

        <section class="info-section">
            <h2>About Us</h2>
            <p>We are committed to making a difference in our community through your generous donations and support.</p>
        </section>
    </div>
</section>
</body>
</html>
