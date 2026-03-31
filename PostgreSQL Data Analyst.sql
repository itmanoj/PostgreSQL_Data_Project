CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
)

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'C:\Users\Manoj Kumar\Desktop\30 Day - SQL Practice Files\Orders.csv' 
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'C:\Users\Manoj Kumar\Desktop\30 Day - SQL Practice Files\Orders.csv' 
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Users\Manoj Kumar\Desktop\30 Day - SQL Practice Files\Orders.csv' 
CSV HEADER;






-- 1) Retrieve all books in the "Fiction" genre:

Select * From Books
Where Genre = 'Fiction'

-- 2) Find books published after the year 1950:
Select * From Books
Where Published_Year >1950;

-- 3) List all customers from the Canada:
Select * From Customers
Where country = 'Canada'

-- 4) Show orders placed in November 2023:
Select * From Orders
Where Order_date between '2023-11-01' AND '2023-11-30'

-- 5) Retrieve the total stock of books available:
Select Sum(Stock) From Books

-- 6) Find the details of the most expensive book:
Select * From Books Order by Price DESC Limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
Select * From Orders 
Where quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
Select * From Orders 
Where Total_amount > 20;

-- 9) List all genres available in the Books table:

Select Distinct genre From Books 

-- 10) Find the book with the lowest stock:
Select * From Books Order by stock Limit 1

-- 11) Calculate the total revenue generated from all orders:
Select Sum(total_amount) AS Revinue From Orders
OR 
Select Sum(total_amount) From Orders
-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

Select b.Genre, Sum(o.Quantity) As Total_books_sold
From Orders o
Join Books b ON o.Book_id = b.book_id
Group by b.Genre

-- 2) Find the average price of books in the "Fantasy" genre:

Select AVG(price) As Avarage_Price
From Books
Where Genre = 'Fantasy'

-- 3) List customers who have placed at least 2 orders:
Select customer_id, Count(order_id) As Order_count
From Orders 
Group BY customer_id
Having Count(order_id) >= 2

Select o.customer_id, c.name, Count(o.order_id) As Order_count
From orders o
Join customers c ON o.customer_id = c.customer_id
Group BY o.customer_id, c.name
Having Count(order_id) >= 2;

-- 4) Find the most frequently ordered book:
Select Book_id, Count(Order_id) As Order_Count
From Orders 
Group BY Book_id
Order BY Order_Count DESC;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
Select * From books 
Where genre = 'Fantasy'
Order BY price DESC Limit 3;

-- 6) Retrieve the total quantity of books sold by each author:

Select b.author, sum(o.quantity) AS Total_bbok_sold
From Orders o
Join books b ON o.book_id = b.book_id
Group BY b.Author

-- 7) List the cities where customers who spent over $30 are located:
Select Distinct c.city, total_amount
From orders o
Join customers c ON o.customer_id = c.customer_id
Where o.total_amount > 30

-- 8) Find the customer who spent the most on orders:
Select	 c.customer_id, c.name, Sum(o.total_amount) AS Total_spent
From Orders o
Join customers c ON o.customer_id = c.customer_id
Group BY c.customer_id, c.name
Order BY Total_spent DESC

--9) Calculate the stock remaining after fulfilling all orders:

Select b.book_id, b.title, b.stock, Coalesce (sum(quantity),0) AS Order_Quantity 
From books b
Left Join orders o ON b.book_id = o.book_id
Group BY b.book_id;



