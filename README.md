Inventory-Management-System
overview
I developed a database to manage inventory levels, suppliers, and product orders for a business. The database includes the following tables: Products, Suppliers, Orders, Order_Details, and Inventory. Key queries include tracking inventory levels by product, generating reorder reports, and listing orders by supplier.This project involves creating an Inventory Management System using MySQL. The system tracks product inventory levels, manages supplier information, processes orders, and generates reports on reorder needs and orders by suppliers.

Project Structure
The project includes the following main components:

->Database Schema: Defines the structure of the database with tables for Suppliers, Products, Orders, Order_Details, and Inventory.
->Data Insertion: Populates the tables with sample data.
->Queries: Provides SQL queries to track inventory levels, generate reorder reports, and list orders by supplier.

Tables and Their Purpose

Suppliers
SupplierID: Unique identifier (Primary Key)
SupplierName: Name of the supplier
ContactName: Name of the contact person
Address: Address of the supplier
City: City of the supplier
PostalCode: Postal code
Country: Country of the supplier
Phone: Contact phone number

Products
Stores information about products.

ProductID: Unique identifier (Primary Key)
ProductName: Name of the product
SupplierID: Foreign Key referencing Suppliers
UnitPrice: Price per unit
UnitsInStock: Number of units currently in stock
ReorderLevel: Stock level at which new inventory should be ordered

Orders
OrderID: Unique identifier (Primary Key)
OrderDate: Date of the order
SupplierID: Foreign Key referencing Suppliers

Order_Details
OrderDetailID: Unique identifier (Primary Key)
OrderID: Foreign Key referencing Orders
ProductID: Foreign Key referencing Products
Quantity: Number of units ordere

#########Inventory
Tracks current inventory levels.

InventoryID: Unique identifier (Primary Key)
ProductID: Foreign Key referencing Products
QuantityInStock: Quantity currently in stock
LastUpdated: Date when the inventory record was last updated

SQL Scripts
Table Creation and Data Insertion
The following SQL scripts create tables and insert sample data into them.


 Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

Insert sample data into Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
VALUES
('Supplier A', 'Contact A', 'Address A', 'City A', '12345', 'Country A', '123-456-7890'),
('Supplier B', 'Contact B', 'Address B', 'City B', '67890', 'Country B', '098-765-4321');

 Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    ReorderLevel INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

Insert sample data into Products
INSERT INTO Products (ProductName, SupplierID, UnitPrice, UnitsInStock, ReorderLevel)
VALUES
('Product 1', 1, 10.00, 100, 20),
('Product 2', 2, 20.00, 50, 10);

 Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

 Insert sample data into Orders
INSERT INTO Orders (OrderDate, SupplierID)
VALUES
('2024-08-01', 1),
('2024-08-05', 2);

Create Order_Details table
CREATE TABLE Order_Details (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

Insert sample data into Order_Details
INSERT INTO Order_Details (OrderID, ProductID, Quantity)
VALUES
(1, 1, 30),
(2, 2, 20);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastUpdated DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Inventory
INSERT INTO Inventory (ProductID, QuantityInStock, LastUpdated)
VALUES
(1, 100, '2024-08-07'),
(2, 50, '2024-08-07');


Queries
->Track Inventory Levels by Product
SELECT p.ProductName, i.QuantityInStock, i.LastUpdated
FROM Products p
JOIN Inventory i ON p.ProductID = i.ProductID;





->Generate Reorder Reports

SELECT p.ProductName, p.UnitsInStock, p.ReorderLevel
FROM Products p
WHERE p.UnitsInStock <= p.ReorderLevel;


->List Orders by Supplier

SELECT s.SupplierName, o.OrderID, o.OrderDate, p.ProductName, od.Quantity
FROM Suppliers s
JOIN Orders o ON s.SupplierID = o.SupplierID
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY s.SupplierName, o.OrderDate;



Usage
Set up the Database: Run the provided SQL scripts to create tables and insert sample data.
Run Queries: Use the queries to retrieve data based on your needs.









