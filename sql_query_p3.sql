-- Creating DATABSE FOR THE RETAIL SALES ANALYSIS PROJECT

CREATE DATABASE sql_project_p3;

-- Create a Table
-- To find the maximum characters for VARCHAR, use the function MAX(LEN(COLUMN NAME), later work on it
CREATE TABLE Retail_Sales
	(
	transactions_id INT PRIMARY KEY,
	sale_date	DATE,
	sale_time	TIME,
	customer_id	INT,
	gender	VARCHAR (15),
	age	INT,
	category  	VARCHAR (15),
	quantiy	INT,
	price_per_unit FLOAT,	
	cogs	FLOAT,
	total_sale float
    );
    
    
SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
LIMIT 10;

SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`;

-- Query used to determine the total transactions
SELECT Count(*) FROM sql_project_p3.`sql - retail sales analysis_utf`;

SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
WHERE ï»¿transactions_id IS NULL;    -- rename the ï»¿transactions_id to TRANSACTION_id
    
-- Finding NULL values in dataset (One Column at a time)    
SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
WHERE customer_id IS NULL;
   
-- Finding NULL values in dataset with single query
SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
WHERE 
ï»¿transactions_id IS NULL
or
sale_date IS NULL
or
sale_time IS NULL
or
customer_id IS NULL
or
gender IS NULL   
or
age IS NULL   
or
category IS NULL
or
quantiy IS NULL
or
price_per_unit IS NULL
or
cogs IS NULL
or
total_sale IS NULL;    
   
-- DATA EXPLORATION

-- How many sales do we have?
SELECT COUNT(*) FROM sql_project_p3.`sql - retail sales analysis_utf`;
-- We have 1987 sales transactions
   
-- How many unique customers do we have?
SELECT COUNT(distinct customer_id) FROM sql_project_p3.`sql - retail sales analysis_utf`;
-- We have 155 unique customers  
   
SELECT distinct category FROM sql_project_p3.`sql - retail sales analysis_utf`;
   
-- MAIN DATA ANALYSIS AND BUSINESS KEY QUESTIONS AND ANSWERS
-- add count(*) to find the total figures
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
WHERE sale_date = '2022-11-05';
-- Total sales made were 11


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022  
SELECT 
category,
sum(quantiy)
FROM
sql_project_p3.`sql - retail sales analysis_utf`
WHERE 
category = 'Clothing'   
GROUP BY category;   
-- the quantity sold for Clothing is 1780

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category
SELECT 
category,
sum(total_sale) as net_sale,
count(*) as total_orders
FROM sql_project_p3.`sql - retail sales analysis_utf`
GROUP BY category;
-- the total sale for each category clothing=309995(698), Beauty=286790(611) and Electronics=311445(678)

-- Q.5 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
SELECT 
round(avg(age), 2) as average_age
from sql_project_p3.`sql - retail sales analysis_utf`
WHERE category ='Beauty';
-- the average age of customers who purchase items from the beauty category is 40.42


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
WHERE total_sale > 1000;
-- 306 records

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
SELECT 
category,
gender,
COUNT(*) as total_number
FROM sql_project_p3.`sql - retail sales analysis_utf`
GROUP BY category, gender
ORDER BY gender;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year 39 minutes
SELECT 
YEAR (sale_date) as year,
MONTH (sale_date) as month, 
avg(total_sale) as avg_sale
FROM sql_project_p3.`sql - retail sales analysis_utf`
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH DESC;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
SELECT 
customer_id,
sum(total_sale) as total_sales
FROM sql_project_p3.`sql - retail sales analysis_utf`
GROUP BY customer_id
ORDER BY total_sales desc
LIMIT 5;

-- Q.9. **Write a SQL query to find the number of unique customers who purchased items from each category
SELECT 
category,
count(distinct customer_id) as unique_customers
FROM sql_project_p3.`sql - retail sales analysis_utf`
GROUP BY category;


-- 10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:


-- yet to add the query

-- END OF PROJECT




SELECT * FROM sql_project_p3.`sql - retail sales analysis_utf`
LIMIT 10;
   
   DROP table retail_sales;