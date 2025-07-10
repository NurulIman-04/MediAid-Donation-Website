-- Database setup script for MediAid Donation Website
-- This script creates/updates the users table with all necessary columns

-- Create users table if it doesn't exist
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

-- Insert some sample data for testing
INSERT INTO users (username, password, fullname, email, role) VALUES 
('admin', 'admin123', 'Administrator', 'admin@mediaid.com', 'admin'),
('donor1', 'donor123', 'John Doe', 'john@example.com', 'donor'),
('donor2', 'donor123', 'Jane Smith', 'jane@example.com', 'donor');

-- Create donations table if it doesn't exist
CREATE TABLE donations (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    donor_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    donation_type VARCHAR(50),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    PRIMARY KEY (id)
); 