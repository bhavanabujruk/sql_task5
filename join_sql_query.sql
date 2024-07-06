select * from sales

select order_line,customer_id,product_id,order_date,sales from sales

select * from customer

select customer_id,customer_name,city from customer
---------------------------------------------------------------------------------------------------------------
--inner join

select s.order_line,s.customer_id,s.product_id,s.order_date,s.sales,c.customer_name,c.city from sales as s
inner join customer as c
on s.customer_id = c.customer_id

--product to sales
	
select * from sales

select order_line,customer_id,product_id,sales from sales

select * from product

select product_id,product_name from product

select s.order_line,s.customer_id,s.product_id,s.sales,p.product_name from sales as s 
inner join product as p
on s.product_id = p.product_id

select sum(s.sales),p.product_id from sales as s
inner join product as p
on s.product_id = p.product_id
group by p.product_id

select s.order_line,s.customer_id,s.product_id,s.sales,p.* from sales as s 
inner join product as p
on s.product_id = p.product_id


--get sales,discount,and order_date from sales also get product_name and customer_name

select s.sales, s.discount,s.order_date , p.product_name,c.customer_name from sales as s
inner join product as p
on p.product_id = s.product_id	
inner join customer as c
on c.customer_id = s.customer_id	


select sum(s.sales),avg(s.quantity),p.product_name,p.category from sales as s
inner join product as p 
on s.product_id = p.product_id
group by p.product_name,p.category
having sum(s.sales) > 500
order by avg(s.quantity) ASC
limit 10 
offset 10

---------------------------------------------------------------------------------------------

--left join

select * from sales

select * from product

select sum(s.sales),avg(s.quantity) , p.product_name,p.category from sales as s
left join product as p 
on s.product_id = p.product_id
group by p.product_name , p.category 
having sum(s.sales) > 500
order by avg(s.quantity) ASC
limit 10 
offset 10

---------------------------------------------------------------------------------------------------------

	--Right join

select * from sales

select * from product

select sum(s.sales),avg(s.quantity),p.product_name,p.category from sales as s
right join product as p
on s.product_id = p.product_id
group by p.product_name , p.category
having sum(s.sales) > 500
order by avg (s.quantity) ASC
limit 10
offset 10

-------------------------------------------------------------------------------------

--full join 

select sum(s.sales),avg(s.quantity),p.product_name,p.category from sales as s
full join product as p
on s.product_id = p.product_id
group by p.product_name,p.category
having sum(s.sales)>500
order by avg (s.quantity) ASC
limit 10 
offset 10