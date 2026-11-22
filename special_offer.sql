Находит покупателей, у которых первая покупка была акционной
WITH first_sales AS (
select distinct on (s.customer_id)
	CONCAT(c.first_name, ' ', c.last_name) as customer,
	s.sale_date as sale_date,
	CONCAT(e.first_name, ' ', e.last_name) as seller,
	s.customer_id,
	p.price
from sales as s
inner join customers as c
	on s.customer_id = c.customer_id
inner join employees as e
	on s.sales_person_id = e.employee_id
inner join products as p
	on s.product_id = p.product_id 
order by s.customer_id, s.sale_date, s.sales_id)

select
	customer,
	sale_date,
	seller
FROM first_sales
where price = 0
order by customer_id;