create database project;
use project;

alter table dataset change column `Loyalty Member` Loyalty_member text ;
alter table dataset change column `Product type` product_type text ;
alter table dataset change column `customer id` cistomer_id text ;
alter table dataset change column `order status` order_status text ;
alter table dataset change column `Purchase date` purchase_date text;
alter table dataset change column `shipping type` shipping_type text ;
alter table dataset change column `Loyalty Member` Loyalty_member text ;
alter table dataset change column `add-on total` add_on_total text ;
alter table dataset change column `total price` total_price double ;
alter table dataset change column `unit price` unit_price double;
alter table dataset change column `payment method` payment_method text;


-- 1 Find the average age of customers who are loyalty members.
select avg(age) as average_age
from dataset
where loyalty_member = 'yes';
-- Insight: The average age of loyalty members provides insight into the demographic that is more likely to join the loyalty program. This information can help tailor marketing strategies toward the most receptive age group.

-- 2 Calculate the total revenue generated from products of type 'Electronics'.
SELECT SUM(Total_Price) AS Total_Revenue
FROM dataset
WHERE product_type = 'smartphone';
-- Insight: Understanding the total revenue generated from a specific product type, such as electronics, can help the company focus on high-performing categories and potentially expand inventory or marketing efforts in those areas.

 -- 3 Find the number of orders placed by each gender.
SELECT Gender, COUNT(*) AS Order_Count
FROM dataset
GROUP BY Gender;
-- Insight: This query helps identify purchasing patterns across different genders, which can guide targeted marketing campaigns and product recommendations.

-- 4.List the SKUs of products with an average rating above 4.
SELECT SKU
FROM dataset
WHERE Rating > 4;
-- Insight: Knowing which products have high ratings can help in promoting these items more aggressively, as they are likely to attract more customers based on positive reviews.

-- 5 Find the top 3 most frequently purchased products.
SELECT SKU, COUNT(*) AS Purchase_Count
FROM dataset
GROUP BY SKU
ORDER BY Purchase_Count DESC
LIMIT 3;
-- Insight: Identifying the top-selling products can help the company ensure these items are well-stocked and possibly offer promotions to further boost sales.

-- 6  Calculate the average total price of orders by payment method.
SELECT payment_method, AVG(Total_Price) AS Average_Total_Price
FROM dataset
GROUP BY Payment_Method;
-- Insight: Understanding the average spending per payment method can help in identifying the preferred payment options among customers and potentially streamline checkout processes to favor these methods.

-- 7 Calculate the total revenue generated in the last year.
SELECT SUM(Total_Price) AS Total_Revenue
FROM dataset
WHERE Purchase_Date >= '2023-01-01' AND Purchase_Date < '2024-01-01';
-- Insight: Annual revenue tracking helps in assessing the company’s financial performance year-over-year, aiding in strategic planning and goal setting.

-- 8 Find the average quantity of products purchased per order.
SELECT AVG(Quantity) AS Average_Quantity
FROM dataset;
-- Insight: Knowing the average number of items per order can help in inventory management and predicting stock requirements.

-- 9 List all add-ons purchased with their total sales.
SELECT "Add-ons Purchased", SUM(add_on_total) AS Total_Sales
FROM dataset
GROUP BY "Add-ons Purchased";
-- Insight: This information can help identify which add-ons are most popular and potentially bundle these with main products to increase overall sales.

-- 10 Find the average rating for each product type.
SELECT Product_Type, AVG(Rating) AS Average_Rating
FROM dataset
GROUP BY Product_Type;
-- Insight: This information helps understand customer satisfaction across different product categories.

-- 11 Find the total revenue generated from each product type.
SELECT Product_Type, SUM(Total_Price) AS Total_Revenue
FROM dataset
GROUP BY Product_Type;
-- Insight: Understanding revenue distribution across product types helps in strategic planning and resource allocation.

-- 12  Find the average total price of orders for each shipping type.
SELECT Shipping_Type, AVG(Total_Price) AS Average_Total_Price
FROM dataset
GROUP BY Shipping_Type;
-- Insight: This information can help in assessing the cost implications of different shipping methods.

-- 13 Find the number of orders for each order status.
SELECT Order_Status, COUNT(*) AS Order_Count
FROM dataset
GROUP BY Order_Status;
-- Insight: Knowing the distribution of order statuses can help identify any issues in the order processing workflow.

-- 14 Calculate the total number of orders made by customers aged 30 and above.
SELECT COUNT(*) AS Order_Count
FROM dataset
WHERE Age >= 30;
-- Insight: Understanding the purchasing behavior of different age groups can help in targeted marketing.

-- 15 Find the top 5 SKUs with the highest average unit price.
SELECT SKU, AVG(Unit_Price) AS Average_Unit_Price
FROM dataset
GROUP BY SKU
ORDER BY Average_Unit_Price DESC
LIMIT 5;
-- Insight: Identifying high-value products can help in focusing marketing efforts on premium items.

-- 16 Calculate the total quantity of products purchased by loyalty members.
SELECT SUM(Quantity) AS Total_Quantity
FROM dataset
WHERE Loyalty_Member = 'Yes';
-- Insight: This metric helps understand the purchasing power of loyalty members compared to non-members.

-- 17 Find the average total price of orders made by male customers.
SELECT AVG(Total_Price) AS Average_Total_Price
FROM dataset
WHERE Gender = 'Male';
-- Insight: Knowing the average spending by gender can help in tailoring marketing strategies.

-- 18 Calculate the total revenue generated from each payment method.
SELECT Payment_Method, SUM(Total_Price) AS Total_Revenue
FROM dataset
GROUP BY Payment_Method;
-- Insight: Understanding revenue distribution across payment methods can help optimize payment processing.

-- 19 Find the number of unique SKUs purchased.
SELECT COUNT(DISTINCT SKU) AS Unique_SKUs
FROM dataset;
-- Insight: This metric helps understand the diversity of products purchased by customers.

-- 20 Calculate the average rating for products of type 'Clothing'.
SELECT AVG(Rating) AS Average_Rating
FROM dataset
WHERE Product_Type = 'tablet';
-- Insight: Understanding customer satisfaction for specific product types helps improve product offerings.

-- 21 Find the total revenue generated from orders with add-ons purchased.
SELECT SUM(Total_Price + Add_on_Total) AS Total_Revenue
FROM dataset
WHERE "Add-ons Purchased" IS NOT NULL;
-- Insight: This metric helps understand the additional revenue generated from add-on sales.

-- 22 Calculate the average unit price of products for each product type.
SELECT Product_Type, AVG(Unit_Price) AS Average_Unit_Price
FROM dataset
GROUP BY Product_Type;
-- Insight: This information helps in pricing strategy and understanding the value perception of different product types.

-- 23 Find the percentage of orders paid with credit card.
SELECT 
    (SUM(CASE WHEN payment_method = 'credit card' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS credit_card_percentage
FROM 
    dataset;
-- Insight: Knowing the preferred payment methods helps in optimizing payment options.

-- 24 Find the total number of orders placed in the month of December.
SELECT COUNT(*) AS Order_Count
FROM dataset
WHERE Purchase_Date LIKE '____-12-%';
-- Insight: This metric helps understand seasonal purchasing patterns and prepare for peak sales periods.

-- 25 Calculate the total revenue generated from customers aged below 25.
SELECT SUM(Total_Price) AS Total_Revenue
FROM dataset
WHERE Age < 25;
-- Insight: Understanding the purchasing power of younger customers can help in creating age-appropriate marketing strategies.

-- 26 Find the number of orders with a total price above $100.
SELECT COUNT(*) AS Order_Count
FROM dataset
WHERE Total_Price > 100;
-- Insight: Knowing the frequency of high-value orders helps in identifying potential premium customers.

-- 27 Calculate the average rating for orders placed in the last quarter.
SELECT AVG(Rating) AS Average_Rating
FROM dataset
WHERE Purchase_Date >= '2023-10-01' AND Purchase_Date <= '2023-12-31';
-- Insight: This metric helps understand customer satisfaction trends in recent periods.

-- 28 Find the total quantity of products sold in each month.
SELECT EXTRACT(MONTH FROM DATE(Purchase_Date)) AS Month, SUM(Quantity) AS Total_Quantity
FROM dataset
GROUP BY Month
ORDER BY Month;
-- Insight: Understanding monthly sales trends helps in inventory planning and identifying peak sales periods.






