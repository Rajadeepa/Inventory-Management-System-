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
-- Insert into Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
VALUES
('Supplier A', 'Contact A', 'Address A', 'City A', '12345', 'Country A', '123-456-7890'),
('Supplier B', 'Contact B', 'Address B', 'City B', '67890', 'Country B', '098-765-4321');


CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    ReorderLevel INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert into Products
INSERT INTO Products (ProductName, SupplierID, UnitPrice, UnitsInStock, ReorderLevel)
VALUES
('Product 1', 1, 10.00, 100, 20),
('Product 2', 2, 20.00, 50, 10);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert into Orders
INSERT INTO Orders (OrderDate, SupplierID)
VALUES
('2024-08-01', 1),
('2024-08-05', 2);

CREATE TABLE Order_Details (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert into Order_Details
INSERT INTO Order_Details (OrderID, ProductID, Quantity)
VALUES
(1, 1, 30),
(2, 2, 20);

CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastUpdated DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert into Inventory
INSERT INTO Inventory (ProductID, QuantityInStock, LastUpdated)
VALUES
(1, 100, '2024-08-07'),
(2, 50, '2024-08-07');

#--Track Inventory Levels by Product#
SELECT p.ProductName, i.QuantityInStock, i.LastUpdated
FROM Products p
JOIN Inventory i ON p.ProductID = i.ProductID;


#--Generate Reorder Reports

SELECT  p.ProductName, p.UnitsInStock, p.ReorderLevel
FROM Products p
where unitsInStock <=reorderlevel;


select * from products;

#--List Orders by Supplier#

SELECT distinct s.SupplierName, o.OrderID, o.OrderDate, p.ProductName, od.Quantity
FROM Suppliers s
JOIN Orders o ON s.SupplierID = o.SupplierID
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY s.SupplierName, o.OrderDate;


