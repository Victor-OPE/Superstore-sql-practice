--Sales_Practical.sql
--Created: 2025-11-6
--Purpose: SQL practice queries for sales database
--===============================================================================
--Business Question 1: Total Sales per region and city---- TASK NUMBER 1
--===============================================================================
SELECT
region,
city,
SUM(sales) AS Totalsales
FROM Superstore
GROUP  BY city,region
ORDER BY Totalsales DESC;
--===============================================================================
--Business Question 2: Top 100 products by revenue-- TASK NUMBER 2
--===============================================================================
SELECT TOP 100 
product_name,
SUM(sales) AS Totalrevenue
FROM superstore
GROUP BY Product_Name
ORDER BY Totalrevenue DESC;
--===============================================================================
--Business Question 3: COUNT OF ORDERs PER CITY---- TASK NUMBER 3
--===============================================================================
SELECT TOP 100
COUNT(order_id) AS NumOrder,
city
FROM Superstore
GROUP BY City
ORDER BY NumOrder desc ;
--===============================================================================
--Business Question 4: Monthly sales trend for 2016 & 2017---- TASK NUMBER 4
--===============================================================================
SELECT 
YEAR(Order_date) AS year,
DATENAME(MONTH, Order_date) AS Monthname,
MONTH(order_date)AS Monthnumber,
SUM(sales) AS Monthlysales 
FROM superstore
WHERE YEAR(Order_date) in('2014','2015','2016','2017')
GROUP BY YEAR(Order_date),
DATENAME(MONTH, Order_date),
MONTH(Order_date)
ORDER BY 
YEAR,Monthnumber;

--===============================================================================
--Business Question 5:Orders above $>1000---- TASK NUMBER 5
--===============================================================================
SELECT TOP 100
Order_id,
customer_name,
order_date,
sales
FROM Superstore
WHERE sales >1000
ORDER BY sales DESC;
--===============================================================================
--Business Question 6:Average sales per customer---- TASK NUMBER 6
--=============================================================================
SELECT TOP 100
COUNT(DISTINCT Customer_id) AS Uniquecustomers,
Customer_name,
AVG ( sales) AS averagesales_per_customer
FROM Superstore
GROUP BY Customer_name
ORDER BY averagesales_per_customer DESC;
--===============================================================================
--Business Question 7:Total sales by category---- TASK NUMBER 7
--=============================================================================
SELECT 
Category,
AVG(Sales) AS Average_sales_by_category
FROM Superstore
GROUP BY Category
ORDER BY Average_sales_by_category DESC;
--===============================================================================
--Business Question 8:Total quantity sold per product---- TASK NUMBER 8
--===============================================================================
SELECT TOP 100
Product_name,
SUM(Quantity) AS Total_quantity
FROM Superstore
GROUP BY Product_name
ORDER BY Total_quantity DESC;
--===============================================================================
--Business Question 9:Top 100 customers by Total spending ---- TASK NUMBER 9
--=============================================================================
SELECT 
Customer_name,
SUM(Sales) AS Total_spending
FROM Superstore
GROUP BY customer_name
ORDER BY Total_spending DESC;
--===============================================================================
--Business Question 10:Total Order by segment--- TASK NUMBER 10
--=============================================================================
SELECT 
Segment,
COUNT(Order_id) Total_order_by_segment
FROM Superstore
GROUP BY Segment
ORDER BY Total_order_by_segment DESC