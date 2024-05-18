SELECT * FROM pizza_db.pizza_sales;

ALTER TABLE pizza_sales MODIFY COLUMN order_time DATETIME;

-- -----------KPIs----------------

-- TOTAL REVENUE-- 
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- AVERAGE ORDER VALUE--
SELECT SUM(total_price)/ COUNT(DISTINCT(order_id))  AS Avg_Order_Value
FROM pizza_sales;


-- TOTAL PIZZAS SOLD--
SELECT SUM(quantity) AS Total_Pizzas_sold FROM pizza_sales;


-- AVERAGE PIZZAS PER ORDER--
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_PIZZAS_PER_ORDER FROM pizza_sales;

-- TOTAL NUMBER OF ORDERS--
SELECT COUNT(distinct(order_id)) AS TOTAL
FROM pizza_sales;




-- % OF SALES BY PIZZA CATEGORY --
SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Percent_of_totalsales
FROM pizza_sales 
GROUP BY pizza_category;


-- % OF SALES BY PIZZA CATEGORY by Month --
-- SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Percent_of_totalsales
-- FROM pizza_sales 
-- WHERE MONTH(order_date) = 1
-- GROUP BY pizza_category;


-- % OF SALES BY PIZZA SIZE --
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percent_of_totalsales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY --
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- TOP 5 PIZZAS BY REVENUE --
SELECT  pizza_name AS Top_5_Pizza, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- TOP 5 PIZZAS BY TOTAL ORDERS --
SELECT pizza_name AS Top_5_Pizza, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- TOP 5 PIZZAS BY QUANTITY --
SELECT pizza_name AS Top_5_Pizza, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;














