ALTER AUTHORIZATION ON DATABASE::seek TO [sa];

CREATE DATABASE seek;
USE seek;

-- Create UserRoles table
CREATE TABLE UserRoles (
    roleID INT PRIMARY KEY,
    roleName NVARCHAR(50) NOT NULL
);

-- Inserting data into UserRoles table
INSERT INTO UserRoles (roleID, roleName) VALUES
(1, N'Admin'),
(2, N'User');

-- Create Department table
CREATE TABLE Departments (
    departmentID INT PRIMARY KEY,
    departmentName NVARCHAR(100) NOT NULL
);

-- Inserting data into Department table
INSERT INTO Departments (departmentID, departmentName) VALUES
(1, N'Elementary'),
(2, N'Junior High School'),
(3, N'Senior High School'),
(4, N'Colleges');

-- Create UserAccount table
CREATE TABLE UserAccounts (
    userID INT IDENTITY(1,1) PRIMARY KEY,
    userIDNum NVARCHAR(20) UNIQUE NOT NULL,
    username NVARCHAR(50) UNIQUE NOT NULL,
    [password] NVARCHAR(50) NOT NULL,
    roleID INT,
    FOREIGN KEY (roleID) REFERENCES UserRoles(roleID)
);

-- Create UserInfo table
CREATE TABLE UserInfo (
    userInfoID INT IDENTITY(1,1) PRIMARY KEY,
    userIDNum NVARCHAR(20) UNIQUE NOT NULL,
    firstName NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    departmentID INT,
    contactNo NVARCHAR(20),
    email NVARCHAR(100),
    registrationDate DATE,
    FOREIGN KEY (userIDNum) REFERENCES UserAccounts(userIDNum),
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID)
);

-- Create ItemLocations table
CREATE TABLE ItemLocations (
    locationID INT IDENTITY(1,1) PRIMARY KEY,
    locationName NVARCHAR(100)
);

-- Create Items table
CREATE TABLE Items (
    itemID INT IDENTITY(1,1) PRIMARY KEY,
    userIDNum NVARCHAR(20),
    itemName NVARCHAR(100) NOT NULL,
    itemType NVARCHAR(50),
    itemStatus NVARCHAR(50),
    itemDescription NVARCHAR(255),
    locationFound INT,
    dateFound DATE,
    ImageURL NVARCHAR(255),
    FOREIGN KEY (userIDNum) REFERENCES UserAccounts(userIDNum),
    FOREIGN KEY (locationFound) REFERENCES ItemLocations(locationID)
);

-- Create TransactionHistory table
CREATE TABLE TransactionHistory (
    transactionID INT IDENTITY(1,1) PRIMARY KEY,
    userIDNum NVARCHAR(20),
    otherUserIDNum NVARCHAR(20),
    itemID INT,
    transactionDate DATE,
    transactionType NVARCHAR(50),
    FOREIGN KEY (userIDNum) REFERENCES UserAccounts(userIDNum),
    FOREIGN KEY (otherUserIDNum) REFERENCES UserAccounts(userIDNum),
    FOREIGN KEY (itemID) REFERENCES Items(itemID)
);

-- Create Notification_Message table
CREATE TABLE Notification_Message (
    notificationID INT IDENTITY(1,1) PRIMARY KEY,
    userIDNum NVARCHAR(20),
    messageNotif NVARCHAR(255),
    dateReceive DATE,
    FOREIGN KEY (userIDNum) REFERENCES UserAccounts(userIDNum)
);

-- Create Categories table
CREATE TABLE Categories (
    categoryID INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(100)
);

-- Insert data into Categories table
INSERT INTO Categories (categoryName) VALUES 
('Electronics'),
('Clothing'),
('Jewelry'),
('Books');

-- Create Tags table
CREATE TABLE Tags (
    tagID INT IDENTITY(1,1) PRIMARY KEY,
    tagName NVARCHAR(100)
);

-- Insert data into Tags table
INSERT INTO Tags (tagName) VALUES 
('Lost'),
('Found'),
('Identified'),
('Unidentified');
