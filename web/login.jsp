<%--
    Document   : login
    Created on : Jun 27, 2025, 12:52:07 AM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediAid - Login/Register</title>
    <link rel="stylesheet" href="css/login-style.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Welcome to MediAid</h2>
            
            <!-- Error/Success Messages -->
            <% if ("invalid".equals(request.getParameter("error"))) { %>
                <div class="error-message">Invalid username or password. Please try again.</div>
            <% } else if ("db_driver".equals(request.getParameter("error"))) { %>
                <div class="error-message">A critical database error occurred. Please contact support.</div>
            <% } else if ("1".equals(request.getParameter("success"))) { %>
                <div class="success-message">Registration successful! Please login with your credentials.</div>
            <% } else if ("exists".equals(request.getParameter("error"))) { %>
                <div class="error-message">Username already exists. Please choose a different one.</div>
            <% } else if ("db".equals(request.getParameter("error"))) { %>
                <div class="error-message">Database error. Please try again later.</div>
            <% } %>
            
            <div class="toggle-links">
                <span class="toggle-link active" id="showLogin">Login</span> |
                <span class="toggle-link" id="showRegister">Register</span>
            </div>
            
            <!-- Login Form -->
            <form id="loginForm" action="LoginServlet" method="post">
                <div class="role-selector">
                    <button type="button" class="role-btn selected" id="loginDonorBtn">Donor</button>
                    <button type="button" class="role-btn" id="loginAdminBtn">Admin</button>
                </div>
                <div class="form-group">
                    <label for="loginUsername">Username</label>
                    <input type="text" id="loginUsername" name="username" required>
                </div>
                <div class="form-group">
                    <label for="loginPassword">Password</label>
                    <input type="password" id="loginPassword" name="password" required>
                </div>
                <input type="hidden" id="loginSelectedRole" name="role" value="donor">
                <button type="submit">Login</button>
                <div class="register-link">
                    Don't have an account? <a href="#" id="switchToRegister">Register here</a>
                </div>
            </form>
            
            <!-- Register Form -->
            <form id="registerForm" class="hidden" action="RegisterServlet" method="post">
                <div class="role-selector">
                    <button type="button" class="role-btn selected" id="donorBtn">Donor</button>
                    <button type="button" class="role-btn" id="adminBtn">Admin</button>
                </div>
                <div class="form-group">
                    <label for="registerName">Full Name</label>
                    <input type="text" id="registerName" name="fullname" required>
                </div>
                <div class="form-group">
                    <label for="registerUsername">Username</label>
                    <input type="text" id="registerUsername" name="username" required>
                </div>
                <div class="form-group">
                    <label for="registerEmail">Email</label>
                    <input type="email" id="registerEmail" name="email" required>
                </div>
                <div class="form-group">
                    <label for="registerPassword">Password</label>
                    <input type="password" id="registerPassword" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <input type="hidden" id="selectedRole" name="role" value="donor">
                <button type="submit">Register</button>
                <div class="register-link">
                    Already have an account? <a href="#" id="switchToLogin">Login here</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Toggle between login and register forms
        const loginForm = document.getElementById('loginForm');
        const registerForm = document.getElementById('registerForm');
        const showLogin = document.getElementById('showLogin');
        const showRegister = document.getElementById('showRegister');
        const switchToRegister = document.getElementById('switchToRegister');
        const switchToLogin = document.getElementById('switchToLogin');

        function showLoginForm() {
            loginForm.classList.remove('hidden');
            registerForm.classList.add('hidden');
            showLogin.classList.add('active');
            showRegister.classList.remove('active');
        }
        function showRegisterForm() {
            registerForm.classList.remove('hidden');
            loginForm.classList.add('hidden');
            showRegister.classList.add('active');
            showLogin.classList.remove('active');
        }
        showLogin.addEventListener('click', showLoginForm);
        showRegister.addEventListener('click', showRegisterForm);
        switchToRegister.addEventListener('click', function(e) { e.preventDefault(); showRegisterForm(); });
        switchToLogin.addEventListener('click', function(e) { e.preventDefault(); showLoginForm(); });

        // Role selection logic for register
        const donorBtn = document.getElementById('donorBtn');
        const adminBtn = document.getElementById('adminBtn');
        const selectedRoleInput = document.getElementById('selectedRole');
        donorBtn.addEventListener('click', function() {
            donorBtn.classList.add('selected');
            adminBtn.classList.remove('selected');
            selectedRoleInput.value = 'donor';
        });
        adminBtn.addEventListener('click', function() {
            adminBtn.classList.add('selected');
            donorBtn.classList.remove('selected');
            selectedRoleInput.value = 'admin';
        });

        // Role selection logic for login
        const loginDonorBtn = document.getElementById('loginDonorBtn');
        const loginAdminBtn = document.getElementById('loginAdminBtn');
        const loginSelectedRoleInput = document.getElementById('loginSelectedRole');
        loginDonorBtn.addEventListener('click', function() {
            loginDonorBtn.classList.add('selected');
            loginAdminBtn.classList.remove('selected');
            loginSelectedRoleInput.value = 'donor';
        });
        loginAdminBtn.addEventListener('click', function() {
            loginAdminBtn.classList.add('selected');
            loginDonorBtn.classList.remove('selected');
            loginSelectedRoleInput.value = 'admin';
        });

        // Registration form validation
        registerForm.addEventListener('submit', function(e) {
            const password = document.getElementById('registerPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
        });
    </script>
</body>
</html>
