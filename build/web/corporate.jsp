<%-- 
    Document   : corporate
    Created on : Jul 3, 2025, 8:59:21 PM
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MediAid | Corporate Support</title>
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        /* General */
      body {
            font-family: 'Comic Neue', cursive;
            margin: 0;
            padding: 0;
            background: linear-gradient(90deg, rgba(67, 206, 162, 0.15), rgba(24, 90, 157, 0.15));
            color: black;
        }/* ✅ Tukar sini */



    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

        /* 🔷 Navbar Styles */
.navbar {
  position: sticky;
  top: 0;
  width: 100%;
  background: linear-gradient(90deg, rgba(67, 206, 162, 0.2), rgba(24, 90, 157, 0.2));
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  z-index: 1000;
  font-family: 'Comic Neue', cursive;
}


.navbar-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 40px;
  max-width: 1400px;
  margin: auto;
  height: 80px; /* Tetapkan height tetap */
  box-sizing: border-box;
  overflow: hidden; /* Elak elemen overflow */
}

.navbar-logo {
  display: flex;
  align-items: center;
  gap: 10px;
  height: 100%; /* Ikut height parent */
}

.navbar-logo img {
  max-height: 100%; /* Kekalkan dalam height navbar */
  object-fit: contain;
  transition: max-height 0.3s ease;
}

.navbar-logo span {
  font-size: 1.5em;
  color: #007BFF;
  font-weight: bold;
}


.navbar-links {
  list-style: none;
  display: flex;
  gap: 30px;
  margin: 0;
  padding: 0;
}

.navbar-links li a {
  text-decoration: none;
  color: #333;
  font-size: 1em;
  padding: 8px 12px;
  transition: color 0.3s, background 0.3s;
}

.navbar-links li a:hover {
  color: #007BFF;
  background-color: #f0f8ff;
  border-radius: 5px;
}

.navbar-user {
  display: flex;
  gap: 15px;
  align-items: center;
}

.navbar-user span {
  font-weight: bold;
  color: #007BFF;
}

.navbar-user .btn {
  padding: 6px 14px;
  background: linear-gradient(90deg, #43cea2 0%, #185a9d 100%);
  color: white;
  text-decoration: none;
  border-radius: 6px;
  transition: background 0.3s, transform 0.2s;
  font-weight: bold;
  border: none;
}

.navbar-user .btn:hover {
  background: linear-gradient(90deg, #185a9d 0%, #43cea2 100%);
  transform: translateY(-2px) scale(1.03);
}


        /* Hero Section */
        .hero {
            text-align: center;
            padding: 60px 20px;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .hero h1 {
            font-size: 40px;
            margin-bottom: 10px;
            color: black;
        }

        .hero p {
            font-size: 18px;
            color: blue;
        }

        /* Slider */
        .slider {
            display: flex;
            overflow-x: auto;
            scroll-snap-type: x mandatory;
        }

        .slider img {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            scroll-snap-align: start;
        }

        /* Info Cards */
        .info-cards {
  display: flex;
  flex-wrap: wrap;         /* Buat dia responsive kalau skrin kecil */
  justify-content: center; /* Centerkan semua kad */
  gap: 20px;               /* Jarak antara kad */
  margin-top: 30px;
}


        .card {
  width: 300px;               /* Lebar tetap yang kecil */
  background: rgba(255, 255, 255, 0.9);
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
  text-align: center;
}


        .card:hover {
      transform: translateY(-5px);
    }
    
        .card img {
  width: 250px; /* atau apa-apa saiz yang sesuai */
  height: auto;
  border-radius: 8px;
  margin-bottom: 10px;
  display: block;
  margin-left: auto;
  margin-right: auto;
}


        .card h3 {
            color: #185a9d;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card p {
            color: #444;
            font-size: 15px;
        }

        /* Infographic Section */
        .infographic {
            background-color: rgba(255,255,255,0.2);
            padding: 40px 20px;
            text-align: center;
        }

        .infographic h2 {
            font-size: 26px;
            color: black;
        }

        .infographic img {
            max-width: 90%;
            height: auto;
            margin: 20px 0;
            border-radius: 10px;
        }

        .infographic p {
            font-size: 16px;
            color:black;
        }

        .section-title {
    text-align: center;
    font-size: 28px;
    margin-top: 40px;
    color: black; /* Optional: change text color if needed */
}

.main-section {
      padding: 50px 20px;
      text-align: center;
      background-color: rgba(255, 255, 255, 0.85);
    }

    .main-section h1 {
      font-size: 2.5em;
      margin-bottom: 20px;
    }

    .main-section p {
      max-width: 800px;
      margin: 0 auto 40px;
      font-size: 1.1em;
      line-height: 1.6;
    }

    .contact-kpj {
  background-color: #f0f7fc;
  padding: 60px 20px;
}

.contact-container {
  max-width: 1100px;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
  gap: 40px;
  justify-content: center;
}

.contact-info, .contact-form {
  flex: 1 1 400px;
  background: white;
  padding: 30px;
  border-radius: 16px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
}

.contact-info h2, .contact-form h2 {
  color: #007BFF;
  margin-bottom: 20px;
}

.contact-info p {
  font-size: 1em;
  margin: 15px 0;
  display: flex;
  align-items: center;
}

.contact-info .icon {
  width: 22px;
  margin-right: 12px;
  opacity: 0.8;
}

.contact-form input, .contact-form textarea {
  width: 100%;
  padding: 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-family: inherit;
}

.contact-form button {
  display: inline-block;
  margin-top: 10px;
  padding: 10px 20px;
  background: linear-gradient(90deg, #43cea2 0%, #185a9d 100%);
  color: white;
  text-decoration: none;
  border-radius: 8px;
  transition: background 0.3s ease, transform 0.3s ease;
  font-weight: bold;
  border: none;
}

.contact-form button:hover {
  background: linear-gradient(90deg, #185a9d 0%, #43cea2 100%);
  transform: scale(1.05);
}


        /* Footer */
        footer {
      text-align: center;
      padding: 20px;
      font-size: 0.9em;
      background: linear-gradient(90deg, rgba(67, 206, 162, 0.2), rgba(24, 90, 157, 0.2));
      color: #333;
    }
    </style>
</head>
<% 
  String username = (String) session.getAttribute("username");
%>
<body>

<!-- 🔷 Navbar -->
<nav class="navbar">
  <div class="navbar-container">
    <div class="navbar-logo">
      <img src="images/MediAidLogo.png" alt="MediAid Logo" />
      <span>MediAid</span>
    </div>
    <ul class="navbar-links">
      <li><a href="Dashboard.jsp">Public</a></li>
      <li><a href="corporate.jsp">Corporate</a></li>
    </ul>
    <div class="navbar-user">
        <a href="login.jsp" class="btn">Login</a>
        <a href="login.jsp" class="btn">Register</a>
    
    </div>
  </div>
</nav>


<!-- Hero Section -->
<header class="hero">
    <h1>Partner with MediAid</h1>
    <p>Empower lives through Corporate Social Responsibility (CSR) initiatives with real impact.</p>
</header>

<!-- Image Slider -->
<section class="slider">
    <img src="images/10.png" alt="Corporate Donation">
    <img src="images/11.png" alt="CSR Program">
    <img src="images/12.png" alt="Community Support">
</section>

<h2 class="section-title">What We Aim to Achieve</h2>
<!-- Info Cards Section -->
<section class="info-cards">
    <div class="card">
        <img src="images/13.png" alt="Transparency">
        <h3>Transparent & Trackable</h3>
        <p>Provide a transparent and trackable medical donation system.</p>
    </div>

    <div class="card">
        <img src="images/14.png" alt="Automation">
        <h3>Automated Management</h3>
        <p>Automate and simplify charity management processes.</p>
    </div>

    <div class="card">
        <img src="images/15.png" alt="Accessibility">
        <h3>Accessible Giving</h3>
        <p>Make donating easier and more accessible for the public.</p>
    </div>
</section>



<!-- Infographic Section -->
<div class="infographic">
    <h2>Corporate Partners’ Contributions</h2>
    <img src="images/16.png" alt="Corporate Impact Statistics">
    <p>Over 70 companies have collaborated with MediAid to fund medical support for critical cases nationwide.</p>
</div>

<section class="main-section">
    <h1>Corporate Social Responsibility</h1>
    <p>
      MediAid is proud to work with healthcare partners, donors, and corporations
      in ensuring critical aid reaches those in need. We believe in transparency,
      collaboration, and impact-driven efforts to improve health outcomes.
    </p>
  </section>

  <section class="contact-kpj">
  <div class="contact-container">
    <!-- Left Column: Info -->
    <div class="contact-info">
      <h2>Contact Us</h2>
      <p>📍 MediAid HQ, Jalan Kesihatan 10, Shah Alam, Selangor</p>
      <p>☎ +603-1234 5678</p>
      <p>✉ info@mediaid.org</p>
      <p>⏰ Mon - Fri, 9:00 AM - 6:00 PM</p>
    </div>

    <!-- Right Column: Form -->
    <div class="contact-form">
      <h2>Send Us a Message</h2>
      <form action="ContactServlet" method="post">
  <input type="text" name="name" placeholder="Your Name" required>
  <input type="email" name="email" placeholder="Your Email" required>
  <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
  <button type="submit">Submit</button>
</form>

  </div>
</section>



<!-- Footer -->
<footer>
    <p>&copy; 2025 MediAid. All rights reserved. Empowering health through meaningful giving.</p>
</footer>

</body>
</html>
