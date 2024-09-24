select * from pizza_sales;

#PART A
select sum(total_price) as total_revenue 
from pizza_sales;
---
select sum(total_price)/count(distinct order_id) as avg_order_value 
from pizza_sales;
---
select sum(quantity) as total_pizza_sold
from pizza_sales;
---
select count(distinct order_id) as total_orders
from pizza_sales;
---
select sum(quantity)/count(distinct order_id) as avg_pizzas_per_order
from pizza_sales;

#PART B
select dayname(str_to_date(order_date, '%d-%m-%y')) as day, count(distinct order_id) as total_orders
from pizza_sales
group by day;
---
select monthname(str_to_date(order_date, '%d-%m-%y')) as month, count(distinct order_id) as total_orders
from pizza_sales
group by month
order by total_orders desc;
---
select pizza_category, round(sum(total_price),2),
	round(sum(total_price)*100/ (select sum(total_price) from pizza_sales where month(str_to_date(order_date, '%d-%m-%y')) = 1), 2) as total_sales_percentage
from pizza_sales 
where month(str_to_date(order_date, '%d-%m-%y')) = 1 #for sales in january
group by pizza_category;
---
select pizza_size, round(sum(total_price),2), round(sum(total_price)*100/ (select sum(total_price) from pizza_sales where quarter(str_to_date(order_date, '%d-%m-%y')) = 1) , 2) as total_sales_percentage
from pizza_sales 
where quarter(str_to_date(order_date, '%d-%m-%y')) = 1 #for sales in first quarter
group by pizza_size
order by total_sales_percentage desc;
---
select pizza_name, sum(total_price) as total_revenue, sum(quantity) as total_quantity, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_revenue desc
#order by total_quantity desc
#order by total_orders desc
limit 5
;
---
select pizza_name, sum(total_price) as total_revenue, sum(quantity) as total_quantity, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_revenue asc
#order by total_quantity desc
#order by total_orders desc
limit 5

