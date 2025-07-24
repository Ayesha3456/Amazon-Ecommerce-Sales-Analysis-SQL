USE ecommerce_sales_data;
GO

SELECT * FROM ecommerce_sales_data

/* KPI METRICS */
/* Total Products Listed */

SELECT COUNT(DISTINCT product_id) AS Total_Products FROM ecommerce_sales_data;

/* Average Discount Percentage */

SELECT ROUND(AVG(TRY_CAST(REPLACE(discount_percentage, '%', '') AS FLOAT)),2) AS Avg_Discount FROM ecommerce_sales_data;

/* Top 5 Most Discounted Products */

SELECT TOP 5 product_name, discount_percentage FROM ecommerce_sales_data ORDER BY discount_percentage DESC;

/* Average Rating by Category */

SELECT category, ROUND(AVG(rating), 2) AS Avg_Rating FROM ecommerce_sales_data GROUP BY category;

/* Total Reviews Submitted */

SELECT COUNT(*) AS Total_Reviews FROM ecommerce_sales_data WHERE review_id IS NOT NULL;

/* Top Rated Products (Min 100 Reviews) */

SELECT product_name, rating, rating_count FROM ecommerce_sales_data WHERE rating >= 4.5 AND rating_count >= 100 ORDER BY rating DESC;

/* GRANULAR ANALYSIS */
/* Product Count by Category */

SELECT category, COUNT(*) AS Product_Count FROM ecommerce_sales_data GROUP BY category ORDER BY Product_Count DESC;

/* Average Actual vs Discounted Price by Category */

SELECT category, ROUND(AVG(actual_price), 2) AS Avg_Actual_Price, ROUND(AVG(discounted_price), 2) AS Avg_Discounted_Price FROM ecommerce_sales_data GROUP BY category;

/* Most Reviewed Products */

SELECT product_name, rating_count FROM ecommerce_sales_data ORDER BY rating_count DESC;

/* Frequent Reviewers (Top 10) */

SELECT user_name, COUNT(review_id) AS Review_Count FROM ecommerce_sales_data GROUP BY user_name ORDER BY Review_Count DESC;
