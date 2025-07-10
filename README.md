# MediAid Donation Website

## 🏥 Project Overview

MediAid is a donation website that allows users to register, login, and make donations. The system supports both donor and admin roles with a beautiful, modern interface.

## ✨ Features

- **Enhanced Login System**: Modern, responsive login and registration interface
- **Role-Based Authentication**: Separate flows for donors and administrators
- **Beautiful UI**: Donation-themed design with smooth animations
- **Form Validation**: Client-side and server-side validation
- **Database Integration**: Apache Derby or H2 database support
- **Session Management**: Secure user sessions and role-based access

## 🚀 Quick Start

### Option 1: NetBeans IDE (Recommended)

1. **Download NetBeans IDE**: https://netbeans.apache.org/download/
2. **Open Project**: File → Open Project → Select `MediAidWeb` folder
3. **Start Derby Server**: Services → Databases → Java DB → Start Server
4. **Create Database**: Right-click Java DB → Create Database
   - Name: `MediAidDB`
   - User: `app`
   - Password: `app`
5. **Run SQL Script**: Right-click database → Execute Command → Paste `database_setup.sql`
6. **Deploy**: Right-click project → Deploy
7. **Test**: Open `http://localhost:8080/MediAidWeb/login.jsp`

### Option 2: H2 Database (Alternative)

1. **Download H2**: https://www.h2database.com/
2. **Start H2 Console**: `java -jar h2.jar`
3. **Connect**: URL: `jdbc:h2:./MediAidDB`, User: `sa`, Password: (empty)
4. **Run SQL**: Copy and paste `database_setup.sql`
5. **Update Servlets**: Use `LoginServletH2.java` and `RegisterServletH2.java`
6. **Deploy and Test**

## 📁 Project Structure

```
MediAidWeb/
├── web/
│   ├── login.jsp (Enhanced login page)
│   ├── css/
│   │   ├── login-style.css (Login page styles)
│   │   └── user-style.css (User dashboard styles)
│   ├── user/
│   │   └── index.jsp (Donor dashboard)
│   └── Dashboard.jsp (Admin dashboard)
├── src/java/controller/
│   ├── LoginServlet.java (Derby version)
│   ├── LoginServletH2.java (H2 version)
│   ├── RegisterServlet.java (Derby version)
│   ├── RegisterServletH2.java (H2 version)
│   └── DonationServlet.java
├── MediAidDB/ (Derby database files)
├── database_setup.sql (Database schema)
└── README files
```

## 🗄️ Database Setup

### Derby Database (Default)
- **URL**: `jdbc:derby://localhost:1527/MediAidDB`
- **User**: `app`
- **Password**: `app`

### H2 Database (Alternative)
- **URL**: `jdbc:h2:./MediAidDB`
- **User**: `sa`
- **Password**: (empty)

### Database Schema
```sql
-- Users table
CREATE TABLE users (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(20) DEFAULT 'donor',
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    PRIMARY KEY (id)
);

-- Donations table
CREATE TABLE donations (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    donor_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    donation_type VARCHAR(50),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    PRIMARY KEY (id)
);
```

## 👥 Test Accounts

### Admin Account
- **Username**: `admin`
- **Password**: `admin123`
- **Role**: admin
- **Access**: Admin Dashboard

### Donor Accounts
- **Username**: `donor1`
- **Password**: `donor123`
- **Role**: donor
- **Access**: User Dashboard

- **Username**: `donor2`
- **Password**: `donor123`
- **Role**: donor
- **Access**: User Dashboard

## 🎨 UI Features

### Login Page (`login.jsp`)
- **Toggle Forms**: Switch between login and registration
- **Role Selection**: Choose Donor or Admin role
- **Form Validation**: Real-time validation and error messages
- **Responsive Design**: Works on mobile and desktop
- **Modern Styling**: Beautiful gradients and animations

### User Experience
- **Smooth Transitions**: CSS animations and hover effects
- **Error Handling**: Clear error and success messages
- **Accessibility**: Proper labels and keyboard navigation
- **Mobile Friendly**: Responsive design for all devices

## 🔧 Configuration

### Database Connection
The database connection is configured in the servlets:
- `LoginServlet.java` - Derby connection
- `LoginServletH2.java` - H2 connection
- `RegisterServlet.java` - Derby connection
- `RegisterServletH2.java` - H2 connection

### Web Application
- **Context Path**: `/MediAidWeb`
- **Default Port**: `8080`
- **Login URL**: `http://localhost:8080/MediAidWeb/login.jsp`

## 🛠️ Troubleshooting

### Common Issues

1. **"Database not found"**
   - Start Derby server first
   - Check database name is exactly `MediAidDB`
   - Verify connection URL

2. **"Connection refused"**
   - Ensure Derby server is running
   - Check port 1527 is available
   - Restart NetBeans

3. **"Driver not found"**
   - Use NetBeans IDE (includes Derby driver)
   - Or add Derby JAR files to classpath
   - For H2, ensure h2.jar is in classpath

4. **"Table already exists"**
   ```sql
   DROP TABLE users;
   DROP TABLE donations;
   ```
   Then run setup script again.

### Derby Server Commands
- **Start**: `java -jar derbyrun.jar server start`
- **Stop**: `java -jar derbyrun.jar server shutdown`
- **Status**: Green icon in NetBeans Services

## 📱 URLs

After deployment:
- **Login Page**: `http://localhost:8080/MediAidWeb/login.jsp`
- **User Dashboard**: `http://localhost:8080/MediAidWeb/user/index.jsp`
- **Admin Dashboard**: `http://localhost:8080/MediAidWeb/Dashboard.jsp`
- **Test Page**: `http://localhost:8080/MediAidWeb/test-login.html`

## ✅ Success Checklist

- [ ] Derby/H2 server is running
- [ ] Database `MediAidDB` is created
- [ ] Tables are created (users, donations)
- [ ] Test data is inserted
- [ ] Project builds successfully
- [ ] Project deploys to Tomcat
- [ ] Login page loads in browser
- [ ] Can register new account
- [ ] Can login with test accounts
- [ ] Role-based redirects work

## 🔒 Security Notes

- Passwords are stored in plain text (consider implementing hashing)
- Role-based access control is implemented
- Session management for user authentication
- Form validation on both client and server side

## 🚀 Future Enhancements

- Password hashing (bcrypt)
- Email verification
- Password reset functionality
- Remember me feature
- Two-factor authentication
- Account profile management
- Payment gateway integration

## 📞 Support

If you encounter issues:
1. Check the error messages carefully
2. Verify database server is running
3. Ensure database connection details are correct
4. Check if tables exist and have correct structure
5. Verify test accounts are working

## 📄 Documentation Files

- `LOGIN_SETUP_README.md` - Detailed login system setup
- `DATABASE_SETUP_GUIDE.md` - Comprehensive database setup
- `QUICK_START_GUIDE.md` - Fastest way to get started
- `database_setup.sql` - Database schema and sample data

---

**Happy Coding! 🎉** 