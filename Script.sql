--  Setup and Initial Look--

create	database Blinkit;

select * from grocery_data;

Select count(*) from grocery_data;

-- Data Cleaning --

update grocery_data
set Item_Fat_Content =
case 
when Item_Fat_Content in ('LF', 'low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end;

select distinct(Item_Fat_Content) from grocery_data;

-- KPIs --
-- 1 Total Sales --
-- Calculates the total sales revenue in millions --

select cast(sum(Sales/1000000) as decimal(10,2)) as total_sales_million
from grocery_data;

-- 2 AVERAGE SALES --
--  Calculates the average value of a single sale --

select cast(avg(Sales) as decimal(10,1)) as avg_sales
from grocery_data;

-- 3 NO OF ITEMS --
-- Counts the total number of items sold --

select count(*) as no_of_items
from grocery_data;

-- 4 AVG RATING --
-- Calculates the average customer rating for items --

select cast(avg(Rating) as decimal(10,1)) as avg_rating
from grocery_data;

-- 5 Total Sales by Fat Content --
--  Shows total sales for 'Low Fat' vs. 'Regular' items --

select Item_Fat_Content, cast(sum(Sales) as decimal(10,2)) as total_sales
from grocery_data
group by Item_Fat_Content;

-- 6 Total Sales by Item Type --
--  Lists which item categories (e.g., 'Fruits', 'Snacks') make the most money, from highest to lowest --

SELECT
    Item_Type,
    CAST(SUM(Sales) AS DECIMAL(10, 2)) AS total_sales
FROM
    grocery_data
GROUP BY
    Item_Type
ORDER BY
    total_sales DESC;

-- 7 Fat Content by Outlet for Total Sales --
--  Breaks down sales by location and fat content (e.g., sales of 'Low Fat' items in 'Tier 1' cities) --

select Outlet_Location_Type, Item_Fat_Content,
cast(sum(Sales) as decimal(10,2)) as total_sales
from grocery_data
group by Outlet_Location_Type, Item_Fat_Content
order by total_Sales;

-- 8 Percentage of Sales by Outlet Size --
-- Shows what percentage of total sales comes from 'Small', 'Medium', and 'High' sized stores--

select Outlet_Size,
cast(sum(Sales) as decimal(10,2)) as total_sales,
CAST((SUM(Sales) * 100) / SUM(SUM(Sales)) OVER () AS DECIMAL(10, 2)) AS sale_percentage
FROMFrom grocery_data
group by Outlet_Size
order by total_Sales desc;

-- 9 Sales by Outlet Location --
-- Shows which location types ('Tier 1', 'Tier 2', etc.) generate the most sales --
select Outlet_Location_Type, 
cast(sum(Sales) as decimal(10,2)) as total_sales
From grocery_data
group by Outlet_Location_Type
order by total_Sales desc;

-- 10 All Metrics by Outlet Type --
-- Provides a full summary (total sales, average sales, item count, etc.) for each type of store (e.g., 'Supermarket Type1') --

SELECT Outlet_Type, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC