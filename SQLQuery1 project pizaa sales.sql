--------this is show the table you import--------
select * from pizza_sales

---------this is show the sum of total revenue -----
select SUM(total_price) as total_revenue from pizza_sales

--------- this is show the average_order_value------
select sum(total_price)/COUNT(distinct order_id) as average_order_value from pizza_sales

------------this is show the total _pizaa_sold-----
select sum(quantity) as Total_pizza_sold from pizza_sales

--------- this is show the total_order--------- 
select count(distinct order_id) as Total_order from pizza_sales

-------- this is show the average of oreder per pizza----
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal (10,2)) as decimal(10,2)) as Avg_pizzas_per_order_ from pizza_sales


--------- this query is show the how to calculate the order date wise--------

select datename(dw, order_date) as order_day, count(distinct order_id) as Total_order from pizza_sales
group by datename(dw, order_date)



---------- this is show the how much order give in month wise -----
select datename(month, order_date) as month_name, count(distinct order_id) as Total_orders from pizza_sales
group by datename(month, order_date)
order by Total_orders desc

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category




----- this query is show pizza size wise---

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_sales,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE DATEPART(quarter,order_date)=1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE DATEPART(quarter,order_date)=1
GROUP BY pizza_size
ORDER BY pizza_size


-------- this query is show the how to find the top five pizaa-----
 select top 5 pizza_name , sum(total_price) as total_revenue from pizza_sales
 group by pizza_name
 order by total_revenue 

 ----- this query is show the how to find the top five pizza quantity wise ----
 select top 5 pizza_name , count(distinct order_id) as total_orders  from pizza_sales
 group by pizza_name
 order by total_orders 

 ------- total sale of pizza----
 SELECT TOP 5 pizza_name, pizza_size, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
WHERE MONTH(order_date) = 8
GROUP BY pizza_name, pizza_size
ORDER BY total_pizzas_sold ASC;




