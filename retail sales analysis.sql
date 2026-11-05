create database retail_db;
use retail_db;
create table sales(
sales_id INT PRIMARY KEY,
product_name VARCHAR(20),
category VARCHAR(50),
quantity INT,
price DECIMAL(10,2),
customer_city VARCHAR(50),
payment_mode VARCHAR(30),
sales_person VARCHAR(50));
INSERT INTO sales VALUES
(1, 'Laptop', 'Electronics', 2, 55000, 'Bangalore', 'UPI', 'Anil'), 
(2, 'Mouse', 'Electronics', 5, 800, 'Mysore', 'Cash', 'Bhumika'),
(3, 'Keyboard', 'Electronics', 3, 1500, 'Bangalore', 'Card', 'Chetan'), 
(4, 'Chair', 'Furniture', 4, 3500, 'Mangalore', 'UPI', 'Anil'), 
(5, 'Table', 'Furniture', 2, 7000, 'Bangalore', 'Card', 'Dhruv'),
(6, 'Notebook', 'Stationery', 10, 80, 'Mysore', 'Cash', 'Bhumika'),
(7, 'Pen', 'Stationery', 20, 30, 'Bangalore', 'UPI', 'Chetan'), 
(8, 'Printer', 'Electronics', 1, 18000, 'Mangalore', 'Card', 'Dhruv'), 
(9, 'Desk Lamp', 'Furniture', 3, 1200, 'Mysore', 'UPI', 'Anil'),
(10, 'Headphones', 'Electronics', 4, 2500, 'Bangalore', 'Cash', 'Bhumika'), 
(11, 'Bookshelf', 'Furniture', 1, 9000, 'Mangalore', 'Card', 'Chetan'),
(12, 'Marker', 'Stationery', 8, 60, 'Bangalore', 'Cash', 'Dhruv'); 
--  Display all records from the sales table. 
select * from sales;
-- Display only product_name,category,price
select product_name,category,price from sales;
-- Display all sales where the product category is Electronics. 
select * from sales where category="Electronics";
-- Display all sales made by salesperson Anil. 
select * from sales where sales_person="Anil";
--  Display all sales where the quantity sold is greater than 3. 
select * from sales where quantity>3;
--  Display all sales where the price is greater than 5,000. 
select * from sales where price>5000;
--  Display all sales made in Bangalore. 
select * from sales where customer_city="Bangalore";
-- Display the product name, quantity and price of products where the payment mode is UPI. 
select product_name,quantity,price from sales where payment_mode="UPI";
-- Display Electronics products sold in Bangalore. 
select * from sales where category="Electronics" AND customer_city="Bangalore";
--  Display sales where the quantity is greater than 3 and the payment mode is UPI. 
select * from sales where quantity>3 AND payment_mode="UPI";
--  Display sales where the category is Furniture and the city is Mangalore. 
select * from sales where category="Furniture" AND customer_city="Mangalore";
-- Display sales made either in Bangalore or Mysore. 
select * from sales where customer_city IN ("Bangalore","Mysore");
-- Display Electronics products where the price is greater than 10,000. 
select * from sales where category="Electronics" AND price>10000;
--  Display sales made by Anil or Bhumika. 
select * from sales where sales_person IN ("Anil","Bhumika");
--  Display products whose price is between 1,000 and 10,000. 
select * from sales where price BETWEEN 1000 AND 10000;
--  Display products whose quantity is between 2 and 5. 
select * from sales where quantity BETWEEN 2 AND 5; 
--  Display sales from Bangalore, Mysore and Mangalore using IN. 
select * from sales where customer_city IN ("Bangalore",'Mysore','Mangalore');
--  Display sales where the payment mode is either Cash or Card. 
select * from sales where payment_mode IN('Cash','Card');
-- Display Furniture and Electronics products using IN. 
select * from sales where category IN('Furniture','Electronics');
-- Find the total number of sales records.
select COUNT(*) as total_sales from sales;
--  Find the total quantity of products sold. 
select SUM(quantity) as total_quantity from sales;
-- Find the highest product price. 
select MAX(price) as highest_price from sales;
--  Find the lowest product price. 
select MIN(price) as lowest_price from sales;
-- Find the average product price. 
select AVG(price) as average_price from sales;
--  Find the total quantity of Electronics products sold. 
select SUM(quantity) as total_electronics_quantity from sales where category="Electronics";
-- Find the number of products sold using UPI. 
select COUNT(*) as upi_sales from sales where payment_mode='UPI';
--  Find the average price of Furniture products. 
select AVG(price) as average_furniture_price from sales where category='Furniture';
--  Find the number of sales made in each city. 
select customer_city,COUNT(*) as total_sales from sales GROUP BY customer_city;
-- Find the total quantity sold in each city. 
select customer_city,SUM(quantity) as total_quantity from sales GROUP BY customer_city;
--  Find the average product price for each category. 
select category,AVG(price) as average_price from sales GROUP BY category;
--  Find the highest product price in each category. 
select category,MAX(price) as highest_price from sales GROUP BY category;
-- Find the lowest product price in each category. 
select category,MIN(price) as lowest_price from sales GROUP BY category;
--  Find the number of sales handled by each salesperson. 
select sales_person,COUNT(*) as total_sales from sales GROUP BY sales_person;
-- Find the total quantity sold by each salesperson. 
select sales_person,SUM(quantity) as total_quantity from sales GROUP BY sales_person;
--  Find the number of sales for each payment mode. 
select payment_mode,COUNT(*) as total_sales from sales GROUP BY payment_mode;
-- Find the total quantity sold for each category. 
select category,SUM(quantity) as total_quantity from sales GROUP BY category;
--  Display cities where more than 2 sales were made. 
select customer_city,COUNT(*) as total_sales from sales GROUP BY customer_city HAVING COUNT(*)>2;
-- Display categories having more than 3 sales. 
select category,COUNT(*) as total_sales from sales GROUP BY category HAVING COUNT(*)>3;
-- Display salespersons who handled more than 2 sales. 
select sales_person,COUNT(*) as total_sales from sales GROUP BY sales_person HAVING COUNT(*)>2;
-- Display categories where the average product price is greater than 2,000. 
select category,AVG(price) as average_price from sales GROUP BY category HAVING AVG(price)>2000;
-- Display cities where the total quan ty sold is greater than 10. 
select customer_city,SUM(quantity) as total_quantity from sales GROUP BY customer_city HAVING SUM(quantity)>10;
-- Display payment modes used for more than 3 sales. 
select payment_mode,COUNT(*) as total_sales from sales GROUP BY payment_mode HAVING COUNT(*)>3;
-- Display all products from highest price to lowest price. 
select * from sales ORDER BY price desc;
-- Display all products from lowest price to highest price. 
select * from sales ORDER BY price;
--  Display products alphabetically according to their names. 
select * from sales ORDER BY product_name asc;
--  Display categories and their average product price, starting from the highest average price. 
select category,AVG(price) as average_price from sales GROUP BY category ORDER BY average_price desc;
-- Find the total quantity sold in each city and display the cities from highest quantity to lowest quantity. 
select customer_city,SUM(quantity) as total_quantity from sales GROUP BY customer_city ORDER BY total_quantity desc;
-- Find the average price of each category and display only categories whose average price is greater than 2,000. 
select category,AVG(price) as average_price from sales GROUP BY category HAVING AVG(price) >2000;
--  Find the number of sales made by each salesperson and display only salespersons who made more than 2 sales. 
select sales_person,COUNT(*) as total_sales from sales GROUP BY sales_person HAVING COUNT(*)>2;
--  Find the total quantity sold for each category and arrange the categories from highest to lowest quantity.
select category,SUM(quantity) as total_quantity from sales GROUP BY category ORDER BY total_quantity desc; 
-- Find the average product price for each city and display the cities from highest average price to lowest average price. 
select customer_city,AVG(price) as average_price from sales GROUP BY customer_city ORDER BY average_price desc;
-- Find the number of sales for each payment mode and display only payment modes used more than 3 times. 
select payment_mode,COUNT(*) as total_sales from sales GROUP BY payment_mode HAVING COUNT(*)>3;
--  Find the total quantity of Electronics products sold in each city. 
select customer_city,SUM(quantity) as total_quantity from sales where category='Electronics' GROUP BY customer_city;
--  Find the average price of products sold in Bangalore for each category. 
select category,AVG(price) as average_price from sales where customer_city='Bangalore' GROUP BY category;
--  Find the total quantity sold by each salesperson and display only salespersons whose total quantity is greater than 10. 
select sales_person,SUM(quantity) as total_quantity from sales GROUP BY sales_person HAVING SUM(quantity)>10;
-- Find the number of sales for each category, but display only categories having more than 3 sales, and arrange them from highest number of sales to lowest.
select category,COUNT(*) as total_sales from sales GROUP BY category HAVING COUNT(*)>3 ORDER BY total_sales desc;