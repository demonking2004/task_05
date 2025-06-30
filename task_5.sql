-- Task_05

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Customers
INSERT INTO Customers VALUES (1, 'Alice', 'Delhi');
INSERT INTO Customers VALUES (2, 'Bob', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Charlie', 'Kolkata');
INSERT INTO Customers VALUES (4, 'Daisy', 'Chennai');

-- Insert into Orders
INSERT INTO Orders VALUES (101, '2025-06-01', 1, 2500.00);
INSERT INTO Orders VALUES (102, '2025-06-03', 1, 1500.00);
INSERT INTO Orders VALUES (103, '2025-06-05', 2, 3000.00);
INSERT INTO Orders VALUES (104, '2025-06-10', 5, 2000.00); -- No matching customer
INSERT INTO Orders VALUES (105, '2025-06-15', 3, 1800.00);
INSERT INTO Orders VALUES (106, '2025-06-18', 1, 2200.00);
INSERT INTO Orders VALUES (107, '2025-06-20', 3, 1600.00);
INSERT INTO Orders VALUES (108, '2025-06-25', 6, 2500.00); -- No matching customer

-- INNER JOIN: Customers with matching Orders
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN: All Customers and their Orders (if any)
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN: All Orders and their Customers (if any)
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL JOIN: All Customers and all Orders (match where possible)
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
