# Inventory Management System

## Overview
I developed a database to manage inventory levels, suppliers, and product orders for a business. The database includes the following tables: Products, Suppliers, Orders, Order_Details, and Inventory. This project involves creating an Inventory Management System using MySQL. The system tracks product inventory levels, manages supplier information, processes orders, and generates reports on reorder needs and orders by suppliers.

## Project Structure
The project includes the following main components:

- **Database Schema:** Defines the structure of the database with tables for Suppliers, Products, Orders, Order_Details, and Inventory.
- **Data Insertion:** Populates the tables with sample data.

## Tables and Their Purpose

### Suppliers
- **SupplierID:** Unique identifier (Primary Key)
- **SupplierName:** Name of the supplier
- **ContactName:** Name of the contact person
- **Address:** Address of the supplier
- **City:** City of the supplier
- **PostalCode:** Postal code
- **Country:** Country of the supplier
- **Phone:** Contact phone number

### Products
Stores information about products.
- **ProductID:** Unique identifier (Primary Key)
- **ProductName:** Name of the product
- **SupplierID:** Foreign Key referencing Suppliers
- **UnitPrice:** Price per unit
- **UnitsInStock:** Number of units currently in stock
- **ReorderLevel:** Stock level at which new inventory should be ordered

### Orders
- **OrderID:** Unique identifier (Primary Key)
- **OrderDate:** Date of the order
- **SupplierID:** Foreign Key referencing Suppliers

### Order_Details
- **OrderDetailID:** Unique identifier (Primary Key)
- **OrderID:** Foreign Key referencing Orders
- **ProductID:** Foreign Key referencing Products
- **Quantity:** Number of units ordered

### Inventory
Tracks current inventory levels.
- **InventoryID:** Unique identifier (Primary Key)
- **ProductID:** Foreign Key referencing Products
- **QuantityInStock:** Quantity currently in stock
- **LastUpdated:** Date when the inventory record was last updated

## Usage

1. **Set up the Database:** Create tables and insert sample data as needed.
2. **Run Data Operations:** Use queries to retrieve data based on business requirements.

