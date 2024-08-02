create table transactions (
	transaction_id serial primary key,
	user_id int,
	product_category varchar(100),
	product_id int,
	quantity int,
	price decimal(10,2),
	transaction_date date
)

select * from transactions

insert into transactions (user_id,product_category,product_id,quantity,price,transaction_date) values
(1,'electronics',101,2,199.99,'2024-01-01'),(2,'Books',202,1,9.99,'2024-01-01'),(3,'Clothing',303,5,29.99,'2024-01-02'),
(4,'electronics',102,1,399.99,'2024-01-02'),(5,'Books',203,2,19.99,'2024-01-03'),(1,'electronics',101,1,199.99,'2024-01-04'),
(2,'Clothing',304,3,39.99,'2024-01-05'),(3,'Books',204,4,14.99,'2024-01-05'),(4,'electronics',103,1,299.99,'2024-01-06'),
(5,'Clothing',305,2,49.99,'2024-01-07')

select count (distinct transaction_id) from transactions

select count (distinct product_category) from transactions

select count (distinct quantity) from transactions


select distinct quantity from transactions

select sum(price) from transactions where quantity = 4
	
select sum(price) from transactions where quantity = 5


select sum(price) from transactions where product_id = 304

--total sales per product category

select product_category, sum(price * quantity) AS total_sales from transactions
group by product_category order by total_sales

select product_category, sum(price * quantity) AS total_sales from transactions
group by product_category order by total_sales desc

--avg sales per user

select user_id, avg(price * quantity) AS average_sales from transactions
group by user_id order by average_sales desc


select quantity, sum(price) from transactions group by quantity

select product_category, sum(quantity) from transactions group by product_category
 order by sum(quantity) desc limit 1


select sum(quantity) from transactions group by product_category
 order by sum(quantity) desc limit 1


select product_category, sum(quantity) from transactions
  where price > 9.99 group by product_category
  having sum(quantity) > 199.99

select quantity from transactions order by quantity asc limit 1


select quantity from transactions order by quantity desc limit 1

select transaction_date from transactions order by transaction_date asc limit 1

select transaction_date from transactions order by transaction_date desc limit 1


select count(price),sum(price),min(price),max(price),avg(price) from transactions

--total quantity sold per product for a specific date range

select product_id,sum(quantity) AS total_quantity from transactions
where transaction_date between '2024-01-01' AND '2024-01-05'
group by product_id order by total_quantity desc

--total sales per user or specific categories

select user_id,sum(price * quantity) AS total_sales from transactions
where product_category in ('electronics','Books')
group by user_id order by total_sales desc

--product catergory with min quantity

select product_category, sum(quantity) AS total_quantity from transactions
   group by product_category having sum(quantity) >10

--min 
select user_id,sum(price * quantity) AS total_sales
from transactions
group by user_id having count(transaction_id) > 2
order by total_sales desc

