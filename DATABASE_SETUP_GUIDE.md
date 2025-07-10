# MediAid Database Setup Guide

## Overview
This guide will help you set up and configure the Apache Derby database for the MediAid donation website. You already have a Derby database created, but we need to set it up properly and run the database script.

## Prerequisites
- Java Development Kit (JDK) 8 or higher
- NetBeans IDE (recommended) or any Java IDE
- Apache Tomcat server

## Step 1: Start the Derby Database Server

### Option A: Using NetBeans IDE (Recommended)

1. **Open NetBeans IDE**
2. **Go to Services tab** (usually on the left side)
3. **Expand "Databases"**
4. **Right-click on "Java DB"**
5. **Select "Start Server"**
6. **Wait for the server to start** (you should see a green icon)

### Option B: Using Command Line

1. **Open Command Prompt/Terminal**
2. **Navigate to your project directory:**
   ```bash
   cd "C:\Users\akma\Downloads\MediAid-Donation-Website\MediAid-Donation-Website_dashboard\MediAidWeb"
   ```
3. **Start Derby server:**
   ```bash
   java -jar derbyrun.jar server start
   ```

## Step 2: Connect to the Database

### Using NetBeans IDE:

1. **In Services tab, right-click on "Java DB"**
2. **Select "Create Database"**
3. **Enter the following details:**
   - **Database Name:** `MediAidDB`
   - **User Name:** `app`
   - **Password:** `app`
4. **Click "OK"**

### Using Command Line:

1. **Open a new Command Prompt/Terminal**
2. **Connect to Derby:**
   ```bash
   java -jar derbyrun.jar ij
   ```
3. **Connect to the database:**
   ```sql
   CONNECT 'jdbc:derby://localhost:1527/MediAidDB;user=app;password=app';
   ```

## Step 3: Run the Database Setup Script

### Using NetBeans IDE:

1. **Right-click on the connected database**
2. **Select "Execute Command"**
3. **Copy and paste the contents of `database_setup.sql`**
4. **Click "Run SQL"**

### Using Command Line (if using ij):

1. **In the ij console, run:**
   ```sql
   RUN 'database_setup.sql';
   ```

### Manual SQL Execution:

If the above doesn't work, run these commands one by one:

```sql
-- Create users table
CREATE TABLE users (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(20) DEFAULT 'donor',
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    PRIMARY KEY (id)
);

-- Insert sample data
INSERT INTO users (username, password, fullname, email, role) VALUES 
('admin', 'admin123', 'Administrator', 'admin@mediaid.com', 'admin'),
('donor1', 'donor123', 'John Doe', 'john@example.com', 'donor'),
('donor2', 'donor123', 'Jane Smith', 'jane@example.com', 'donor');

-- Create donations table
CREATE TABLE donations (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    donor_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    donation_type VARCHAR(50),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    PRIMARY KEY (id)
);
```

## Step 4: Verify Database Setup

### Check Tables:
```sql
SHOW TABLES;
```

### Check Users:
```sql
SELECT * FROM users;
```

### Check Donations:
```sql
SELECT * FROM donations;
```

## Step 5: Configure Database Connection in Your Project

### Update LoginServlet.java:
The connection details are already correct in your servlets:
- **URL:** `jdbc:derby://localhost:1527/MediAidDB`
- **Username:** `app`
- **Password:** `app`

## Step 6: Test the Application

1. **Build and deploy your MediAidWeb project**
2. **Start your web server (Tomcat)**
3. **Navigate to:** `http://localhost:8080/MediAidWeb/login.jsp`
4. **Test with the provided accounts:**
   - Admin: `admin` / `admin123`
   - Donor: `donor1` / `donor123`

## Troubleshooting

### Common Issues:

1. **"Database not found" error:**
   - Make sure Derby server is running
   - Check if database name is correct
   - Verify connection URL

2. **"Connection refused" error:**
   - Start Derby server first
   - Check if port 1527 is available
   - Restart Derby server

3. **"Table already exists" error:**
   - Drop existing tables first:
     ```sql
     DROP TABLE users;
     DROP TABLE donations;
     ```
   - Then run the setup script again

4. **"Driver not found" error:**
   - Make sure Derby JDBC driver is in your classpath
   - Add Derby JAR files to your project libraries

### Derby Server Commands:

- **Start server:** `java -jar derbyrun.jar server start`
- **Stop server:** `java -jar derbyrun.jar server shutdown`
- **Check status:** Look for green icon in NetBeans Services

### Useful SQL Commands:

```sql
-- List all tables
SHOW TABLES;

-- Describe table structure
DESCRIBE users;

-- Check table data
SELECT * FROM users;

-- Clear table data
DELETE FROM users;

-- Drop table
DROP TABLE users;
```

## Alternative: Using H2 Database (If Derby doesn't work)

If you continue having issues with Derby, you can switch to H2 database:

1. **Download H2 database:** https://www.h2database.com/
2. **Start H2 console:** `java -jar h2.jar`
3. **Connect to:** `jdbc:h2:./MediAidDB`
4. **Run the same SQL scripts**

## Next Steps

After successful database setup:

1. ✅ **Database is running**
2. ✅ **Tables are created**
3. ✅ **Test data is inserted**
4. ✅ **Application is deployed**
5. ✅ **Login system is working**

You can now use the enhanced login system with role-based authentication!

## Support

If you encounter any issues:
1. Check the error messages carefully
2. Verify Derby server is running
3. Ensure database connection details are correct
4. Check if tables exist and have correct structure
5. Verify test accounts are working 