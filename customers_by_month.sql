-- Количество уникальных покупателей и выручка по месяцам (YYYY-MM)
select
	TRIM(TO_CHAR(s.sale_date, 'YYYY-MM')) as selling_month,
	count(distinct s.customer_id) as total_customers,
	SUM(p.price*s.quantity) as income
from sales as s
inner join products as p
	on s.product_id = p.product_id
group by selling_month
order by selling_month;