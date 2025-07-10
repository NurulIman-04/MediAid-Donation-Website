# MediAid Quick Start Guide

## 🚀 Fastest Way to Get Started

Since you already have a Derby database set up, here's the quickest way to get everything working:

## Step 1: Use NetBeans IDE (Easiest Method)

### 1. Open NetBeans IDE
- Download NetBeans if you don't have it: https://netbeans.apache.org/download/

### 2. Open Your Project
- File → Open Project
- Navigate to: `C:\Users\akma\Downloads\MediAid-Donation-Website\MediAid-Donation-Website_dashboard\MediAidWeb`
- Select the project and click "Open"

### 3. Start Derby Database
- In NetBeans, go to **Services** tab (left side)
- Expand **Databases**
- Right-click on **Java DB**
- Select **Start Server**
- Wait for green icon (server is running)

### 4. Create/Connect to Database
- Right-click on **Java DB** again
- Select **Create Database**
- Enter:
  - **Database Name:** `MediAidDB`
  - **User Name:** `app`
  - **Password:** `app`
- Click **OK**

### 5. Run Database Script
- Right-click on the connected database
- Select **Execute Command**
- Copy and paste the contents of `database_setup.sql`
- Click **Run SQL**

### 6. Deploy and Test
- Right-click on your project
- Select **Clean and Build**
- Right-click on your project again
- Select **Deploy**
- Open browser and go to: `http://localhost:8080/MediAidWeb/login.jsp`

## Step 2: Alternative - Use H2 Database (If Derby doesn't work)

### 1. Download H2 Database
- Go to: https://www.h2database.com/
- Download the latest version
- Extract the ZIP file

### 2. Start H2 Console
- Double-click `h2.jar` in the extracted folder
- Or run: `java -jar h2.jar`
- Browser will open to H2 console

### 3. Connect to Database
- **JDBC URL:** `jdbc:h2:./MediAidDB`
- **User Name:** `sa`
- **Password:** (leave empty)
- Click **Connect**

### 4. Run SQL Script
- Copy and paste the contents of `database_setup.sql`
- Click **Run**

### 5. Update Connection in Code
- Open `LoginServlet.java`
- Change the connection URL to:
  ```java
  private final String dbURL = "jdbc:h2:./MediAidDB";
  private final String dbUser = "sa";
  private final String dbPass = "";
  ```

## Step 3: Test the Login System

### Test Accounts:
- **Admin:** username: `admin`, password: `admin123`
- **Donor:** username: `donor1`, password: `donor123`

### Features to Test:
1. **Registration:** Try creating a new account
2. **Login:** Use the test accounts above
3. **Role Selection:** Choose between Donor and Admin
4. **Form Validation:** Try submitting with missing fields
5. **Error Handling:** Try wrong passwords

## 🎯 Quick Troubleshooting

### If you get "Database not found":
1. Make sure Derby server is running (green icon in NetBeans)
2. Check if database name is exactly `MediAidDB`
3. Try creating the database again

### If you get "Connection refused":
1. Start Derby server first
2. Check if port 1527 is available
3. Restart NetBeans

### If you get "Driver not found":
1. Make sure you're using NetBeans IDE
2. Derby driver is included with NetBeans
3. If using H2, make sure h2.jar is in your classpath

### If tables already exist:
```sql
DROP TABLE users;
DROP TABLE donations;
```
Then run the setup script again.

## 📱 Test URLs

After deployment:
- **Login Page:** `http://localhost:8080/MediAidWeb/login.jsp`
- **User Dashboard:** `http://localhost:8080/MediAidWeb/user/index.jsp`
- **Admin Dashboard:** `http://localhost:8080/MediAidWeb/Dashboard.jsp`

## ✅ Success Checklist

- [ ] Derby server is running (green icon)
- [ ] Database `MediAidDB` is created
- [ ] Tables are created (users, donations)
- [ ] Test data is inserted
- [ ] Project builds successfully
- [ ] Project deploys to Tomcat
- [ ] Login page loads in browser
- [ ] Can register new account
- [ ] Can login with test accounts
- [ ] Role-based redirects work

## 🆘 Still Having Issues?

1. **Use H2 Database** - It's simpler and more reliable
2. **Check Java Version** - Make sure you have JDK 8 or higher
3. **Restart Everything** - NetBeans, Derby server, Tomcat
4. **Check Ports** - Make sure 8080 and 1527 are available

## 📞 Need More Help?

The most common issue is Derby server not running. Always start the Derby server first before trying to connect to the database! 