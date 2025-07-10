<%-- 
    Document   : userhome
    Created on : Jun 27, 2025, 9:14:55 PM
    Author     : user
--%>

<%@ page session="true" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MediAid Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300;400;700&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Comic Neue', cursive;
      background: linear-gradient(90deg, rgba(67, 206, 162, 0.15), rgba(24, 90, 157, 0.15));
      animation: fadeIn 1s;
    }

    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    .hero {
      background: linear-gradient(90deg, rgba(67, 206, 162, 0.3), rgba(24, 90, 157, 0.2));
      padding: 120px 20px;
      text-align: center;
      color: white;
      position: relative;
    }

    .hero::after {
      content: "";
      position: absolute;
      top: 0; left: 0; width: 100%; height: 100%;
      background-color: rgba(0,0,0,0.5);
      z-index: 0;
    }

    .hero-content {
      position: relative;
      z-index: 1;
    }

    .hero h1 {
      font-size: 3.5em;
      margin-bottom: 15px;
    }

    .hero p {
      font-size: 1.5em;
      margin-bottom: 40px;
    }

    .hero-buttons a {
      padding: 15px 30px;
      background-color: #007BFF;
      color: white;
      border-radius: 30px;
      text-decoration: none;
      margin: 10px;
      display: inline-block;
      transition: background-color 0.3s, transform 0.3s;
    }

    .hero-buttons a:hover {
      background-color: #0056b3;
      transform: scale(1.05);
    }

    .section-title {
      text-align: center;
      margin-top: 50px;
      font-size: 2.5em;
      color: #007BFF;
    }

    .info-cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      padding: 30px;
      max-width: 1200px;
      margin: auto;
    }

    .card {
      background: rgba(255, 255, 255, 0.9);
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 100%;
      border-radius: 8px;
      margin-bottom: 10px;
    }

    .card h3 {
      color: #007BFF;
      font-size: 1.5em;
    }

    footer {
      text-align: center;
      padding: 20px;
      font-size: 0.9em;
      background: linear-gradient(90deg, rgba(67, 206, 162, 0.2), rgba(24, 90, 157, 0.2));
      color: #333;
    }

    .infographic {
      text-align: center;
      margin: 40px 0;
    }

    .infographic img {
      width: 80%;
      max-width: 600px;
      border-radius: 12px;
      animation: slideIn 1s;
    }

    @keyframes slideIn {
      from { transform: translateY(20px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }



    .text {
      margin-top: 15px;
    }

    .text h3 {
      color: #00695c;
      font-size: 1.3em;
    }

    .text p {
      color: #555;
      font-size: 0.95rem;
    }

    .donate-btn {
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

.donate-btn:hover {
  background: linear-gradient(90deg, #185a9d 0%, #43cea2 100%);
  transform: scale(1.05);
}

    
   .campaign-slider {
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  position: relative;
}

.slider-track {
  display: flex;
   width: 300vw; /* ✅ correct for 3 slides */
  height: 100%;
  transition: transform 1s ease-in-out;
}

.slide {
  flex: 0 0 100vw;
  height: 100vh;
  position: relative;
}


.slide img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.caption {
  position: absolute;
  top: 50%;
  left: 10%;
  transform: translateY(-50%);
  color: white;
  background: rgba(0, 0, 0, 0.4);
  padding: 20px 30px;
  border-radius: 10px;
  max-width: 400px;
  animation: fadeSlideIn 1s ease-in-out;
}

.caption h2 {
  font-size: 2.5em;
  margin: 0;
}

.caption p {
  font-size: 1.2em;
  margin: 10px 0;
}

.caption a {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007BFF;
  color: white;
  text-decoration: none;
  border-radius: 6px;
  margin-top: 10px;
}

.caption a:hover {
  background-color: #0056b3;
}

@keyframes fadeSlideIn {
  from { opacity: 0; transform: translate(-20px, -50%); }
  to   { opacity: 1; transform: translate(0, -50%); }
}

.slider-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 40px;
  height: 40px;
  background: linear-gradient(90deg, #43cea2, #185a9d); /* warna tema */
  color: white;
  border: none;
  cursor: pointer;
  z-index: 10;
  border-radius: 50%; /* buat bulat sempurna */
  font-size: 1.2rem; /* kecilkan ikon dalam */
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.3s, transform 0.2s;
}


.slider-btn:hover {
  background: linear-gradient(90deg, #185a9d, #43cea2);
  transform: scale(1.1);
}

.slider-btn.prev {
  left: 20px;
}

.slider-btn.next {
  right: 20px;
}

/*nav-bar*/
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

<!-- 🔁 Slider Section (KPJ-style) -->
<div class="campaign-slider">
  <div class="slider-track" id="sliderTrack">
    <!-- Slide 1 -->
    <div class="slide">
      <img src="images/1.png" alt="Cancer Patient">
      <div class="caption">
        <h2>Support Cancer Patients</h2>
        <p>Your donation helps cover chemotherapy and medication.</p>
        <a href="login.jsp" class="donate-btn">Donate Now</a>
      </div>
    </div>
    <!-- Slide 2 -->
    <div class="slide">
      <img src="images/2.png" alt="Dialysis">
      <div class="caption">
        <h2>Dialysis Aid Needed</h2>
        <p>Provide free dialysis for kidney patients in need.</p>
        <a href="login.jsp" class="donate-btn">Donate Now</a>
      </div>
    </div>
    <!-- Slide 3 -->
    <div class="slide">
      <img src="images/3.png" alt="Hospital Utilities">
      <div class="caption">
        <h2>Equip Our Hospitals</h2>
        <p>Help fund essential equipment like oxygen tanks and wheelchairs.</p>
        <a href="login.jsp" class="donate-btn">Donate Now</a>
      </div>
    </div>
  </div>

  <!-- ◀ Left & Right ▶ buttons -->
  <button class="slider-btn prev" onclick="moveSlide(-1)">&#10094;</button>
  <button class="slider-btn next" onclick="moveSlide(1)">&#10095;</button>
</div> <!-- ✅ only ONE closing </div> for campaign-slider -->


<div class="hero">
  <div class="hero-content">
    <h1>Welcome to MediAid</h1>
    <p>At MediAid, we believe that access to healthcare is a fundamental right, and we are here to help make it a reality for those in need. Whether it’s funding life-saving treatments, providing essential medical equipment, or supporting long-term care, we connect compassionate donors with urgent medical causes.</p>
    <p>As a dedicated medical aid donation platform, MediAid is committed to transparency, accountability, and real impact ensuring that every contribution directly helps save and improve lives.</P>
    <p>MediAid – Giving Hope, Healing Lives.</p>
  </div>
</div>

<h2 class="section-title">🌍 Global & Malaysian Health Updates</h2>

<section class="info-cards">
  <div class="card">
    <img src="images/5.png" alt="Malaysia Healthcare">
    <h3>Malaysia’s Healthcare Budget</h3>
    <p>RM36 billion allocated to public health in 2023. Focus: digital healthcare & mental health services expansion.</p>
  </div>

  <div class="card">
    <img src="images/6.png" alt="Global Health">
    <h3>Top Global Health Challenges</h3>
    <p>Cardiovascular diseases, mental health, and pandemic preparedness remain key priorities worldwide.</p>
  </div>

  <div class="card">
    <img src="images/7.png" alt="Vaccination">
    <h3>Vaccination Success in Malaysia</h3>
    <p>Malaysia has over 85% COVID-19 vaccine coverage. Boosters and child immunization campaigns ongoing.</p>
  </div>

  <div class="card">
    <img src="images/8.png" alt="Mental Health">
    <h3>Mental Health Support</h3>
    <p>1 in 3 Malaysians report anxiety or depression. Government and NGOs scaling up mental wellness programs.</p>
  </div>
</section>

<div class="infographic">
  <h2>📊 Healthcare Infographic</h2>
  <img src="images/9.png" alt="Healthcare Infographic">
  <p>Understanding the key statistics and trends in healthcare globally and in Malaysia.</p>
</div>



<footer>
  &copy; 2025 MediAid. Developed for CSC584. Health data sourced from Ministry of Health Malaysia, WHO, and UNICEF.
</footer>

<script>
  let index = 0;
  function moveSlide(direction) {
    const track = document.getElementById("sliderTrack");
    const slides = track.children.length;
    index += direction;
    if (index < 0) index = slides - 1;
    if (index >= slides) index = 0;
    track.style.transform = "translateX(-" + (index * 100) + "vw)";
  }
</script>





</body>
</html>