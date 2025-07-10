# MediAid Enhanced Login System Setup

## Overview
The MediAid donation website now features an enhanced login and registration system with:
- Beautiful, modern UI with donation-themed background
- Toggle between login and registration forms
- Role-based authentication (Donor/Admin)
- Enhanced form validation
- Responsive design

## Features Added

### 1. Enhanced Login Page (`login.jsp`)
- **Dual Form Interface**: Toggle between login and registration
- **Role Selection**: Choose between Donor and Admin roles
- **Modern Styling**: Beautiful gradient design with donation-themed background
- **Form Validation**: Client-side password confirmation
- **Error Handling**: Display success/error messages from server

### 2. Updated Servlets
- **LoginServlet**: Enhanced to handle role-based authentication
- **RegisterServlet**: Updated to store additional user information

### 3. Database Schema
- **Enhanced Users Table**: Added fullname, email, and role columns
- **Sample Data**: Pre-populated test accounts

## Setup Instructions

### 1. Database Setup
1. Open your Derby database management tool (e.g., NetBeans Database Services)
2. Connect to your MediAidDB database
3. Run the `database_setup.sql` script to create/update the tables
4. Verify the users table has the following columns:
   - id (auto-increment primary key)
   - username (unique)
   - password
   - fullname
   - email
   - role
   - created_at

### 2. Test Accounts
The setup script creates these test accounts:

**Admin Account:**
- Username: `admin`
- Password: `admin123`
- Role: admin

**Donor Accounts:**
- Username: `donor1`, Password: `donor123`, Role: donor
- Username: `donor2`, Password: `donor123`, Role: donor

### 3. Deployment
1. Build and deploy your MediAidWeb project
2. Access the application through your web server
3. Navigate to `login.jsp` to see the new login interface

## Usage Guide

### For Users
1. **Registration**: Click "Register" tab or "Register here" link
2. **Fill Form**: Enter full name, username, email, and password
3. **Select Role**: Choose between Donor or Admin
4. **Submit**: Click "Register" button
5. **Login**: Use your credentials to log in

### For Administrators
1. **Admin Login**: Select "Admin" role during login
2. **Dashboard Access**: Admins are redirected to `Dashboard.jsp`
3. **User Management**: Access user management features

### For Donors
1. **Donor Login**: Select "Donor" role during login
2. **User Dashboard**: Donors are redirected to `user/index.jsp`
3. **Donation Features**: Access donation and history features

## File Structure
```
MediAidWeb/
├── web/
│   ├── login.jsp (Enhanced login page)
│   ├── user/
│   │   └── index.jsp (Donor dashboard)
│   └── Dashboard.jsp (Admin dashboard)
├── src/java/controller/
│   ├── LoginServlet.java (Enhanced login handling)
│   └── RegisterServlet.java (Enhanced registration)
└── database_setup.sql (Database schema)
```

## Security Considerations
- Passwords are stored in plain text (consider implementing password hashing)
- Role-based access control is implemented
- Session management for user authentication
- Form validation on both client and server side

## Troubleshooting

### Common Issues
1. **Database Connection Error**: Ensure Derby server is running
2. **Table Not Found**: Run the database_setup.sql script
3. **Login Fails**: Check username/password and role selection
4. **Styling Issues**: Ensure CSS is properly loaded

### Error Messages
- `Invalid username or password`: Check credentials
- `Username already exists`: Choose a different username
- `Database error`: Check database connection
- `Passwords do not match`: Ensure password confirmation matches

## Future Enhancements
- Password hashing (bcrypt)
- Email verification
- Password reset functionality
- Remember me feature
- Two-factor authentication
- Account profile management

## Support
For technical support or questions about the enhanced login system, please refer to the project documentation or contact the development team. 