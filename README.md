# PostgreSQL_Data_Project
📚 Bookstore SQL Project

This project demonstrates the design and querying of a Bookstore Database using SQL. It includes table creation, data import, and a variety of basic to advanced SQL queries for data analysis.

🗂️ Database Schema
The project consists of three main tables:

**1. Books**

Stores information about books available in the store.

Book_ID (Primary Key)
Title
Author
Genre
Published_Year
Price
Stock

**2. Customers**
Contains customer details.

Customer_ID (Primary Key)
Name
Email
Phone
City
Country

**3. Orders**
Records book orders placed by customers.

Order_ID (Primary Key)
Customer_ID (Foreign Key)
Book_ID (Foreign Key)
Order_Date
Quantity
Total_Amount 

💡 Key Concepts Covered
SQL Joins (INNER, LEFT)
Aggregate Functions (SUM, AVG, COUNT)
Grouping (GROUP BY, HAVING)
Filtering (WHERE, BETWEEN)
Sorting (ORDER BY)
Data Import (COPY)
Handling NULLs (COALESCE) 

